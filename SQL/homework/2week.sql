-- 1번. 각 코스별, 숙제별로 중간에 포기한 학생의 수와 각 숙제 별로 그 학생들이 포기하기까지 시도한 최대 횟수를 출력하시오 (단, 한번도 제출하지 않은 학생은 제외)
WITH max_score as (SELECT a.course_id 코스명, a.assignment_id 과제명, submissions.student_id 학생id, MAX(total_score) 최고점, COUNT(submission_id) 제출횟수
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND a.started_date <= submissions.submit_date
        AND a.ended_date >= submissions.submit_date
GROUP BY a.course_id, a.assignment_id, submissions.student_id)

SELECT 코스명, 과제명, COUNT(학생id) 포기한학생수, SUM(제출횟수) 최대제출횟수
FROM max_score
WHERE 최고점 != 100
GROUP BY 코스명, 과제명;

-- 2번. 각 코스별, 숙제별로 만점까지의 제출 시간 평균이 가장 빠른 학생의 아이디를 출력하시오
WITH submit_time AS (SELECT a.course_id, a.assignment_id, TIMEDIFF(submit_date, started_date) 제출시간평균, total_score, submissions.student_id,
        ROW_NUMBER() over (PARTITION BY a.course_id, assignment_title ORDER BY TIMEDIFF(submit_date, started_date)) rn
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND a.started_date <= submissions.submit_date
        AND a.ended_date >= submissions.submit_date
        AND total_score = 100
GROUP BY course_id, a.assignment_id, student_id)

SELECT course_id 코스명, assignment_id, 제출시간평균, student_id 학생id
FROM submit_time
WHERE rn = 1;

-- 3번. 각 코스별, 숙제별로 첫 번째 제출에 50점 이상을 받은 학생의 수를 구하여라
WITH submit_list AS (SELECT a.course_id, a.assignment_id, submissions.student_id, total_score, submit_date,
       ROW_NUMBER() over (PARTITION BY a.course_id, a.assignment_id, submissions.student_id ORDER BY submit_date) rn
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND a.started_date <= submissions.submit_date
        AND a.ended_date >= submissions.submit_date)

SELECT course_id 코스명, assignment_id 과제명, COUNT(student_id) 학생수
FROM submit_list
WHERE rn = 1 AND total_score >= 50
GROUP BY course_id, assignment_id;

-- 4번. 각 코스별로 만점을 가장 많이 받았으면서도 제출 시간이 가장 빠른 학생의 평균 점수를 구하여라
WITH count_100 AS (SELECT a.course_id, submissions.student_id, COUNT(total_score) 백점개수, submit_date,
    ROW_NUMBER() over (PARTITION BY a.course_id  ORDER BY COUNT(total_score) DESC, submit_date ASC) rn
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND a.started_date <= submissions.submit_date
        AND a.ended_date >= submissions.submit_date
        AND total_score = 100
GROUP BY course_id, student_id)

SELECT course_id 코스명, 백점개수, count_100.student_id 학생명, AVG(total_score) 평균점수
FROM count_100
    INNER JOIN submissions on submissions.student_id = count_100.student_id
WHERE rn = 1
GROUP BY course_id;

-- 5번. 각 코스별, 숙제별로 마감 날짜에 가장 근접하게 만점을 받은 학생을 구하여라
WITH submit_list AS (SELECT a.course_id 코스아이디, a.assignment_id 과제명, total_score 점수, submit_date, submissions.student_id,
       ROW_NUMBER() over (PARTITION BY a.course_id, assignment_title ORDER BY submit_date DESC) rn
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND a.started_date <= submissions.submit_date
        AND a.ended_date >= submissions.submit_date
        AND total_score = 100)

SELECT 코스아이디, 과제명, student_id
FROM submit_list
WHERE rn = 1;

-- 6번. 각 코스별, 숙제별로 만점까지 걸린 가장 빠른 제출 시간을 시간 단위로 구하여라
WITH submit_time AS (SELECT a.course_id 코스아이디, a.assignment_id 과제명, total_score 점수, submit_date, started_date,
       ROW_NUMBER() over (PARTITION BY a.course_id, a.assignment_id ORDER BY submit_date) rn
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND a.started_date <= submissions.submit_date
        AND a.ended_date >= submissions.submit_date
        AND total_score = 100)

SELECT 코스아이디, 과제명, 점수, TIMEDIFF(submit_date, started_date) 제출시간
FROM submit_time
WHERE rn = 1;

-- 7번. 각 코스별, 숙제별로 0점을 제외하고 가장 낮은 점수를 받은 학생들의 제출 횟수를 구하여라
WITH min_score AS (SELECT course_id 코스아이디, a.assignment_id 과제명, MIN(total_score) 최하점, submissions.assignment_id
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
WHERE total_score != 0 AND total_score is not null
    AND a.started_date <= submissions.submit_date
    AND a.ended_date >= submissions.submit_date
GROUP BY course_id, a.assignment_id),

    count_submit AS (SELECT course_id, a2.assignment_id, student_id, COUNT(submission_id) 제출횟수
FROM submissions
    INNER JOIN assignments a2 on submissions.assignment_id = a2.assignment_id
WHERE a2.started_date <= submissions.submit_date
    AND a2.ended_date >= submissions.submit_date
GROUP BY course_id, a2.assignment_id, student_id)

SELECT DISTINCT 코스아이디, 과제명, total_score, 최하점, count_submit.student_id, 제출횟수
FROM submissions
    INNER JOIN min_score on submissions.assignment_id = min_score.assignment_id
    INNER JOIN count_submit on count_submit.student_id = submissions.student_id AND count_submit.assignment_id = submissions.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND total_score = 최하점
ORDER BY 코스아이디, 과제명;

-- 8번. 각 코스별, 숙제별로 가장 과제를 많이 제출한 학생의 최고점, 최저점, 평균 점수를 구하여라
WITH submit_list AS (SELECT a.course_id 코스아이디, a.assignment_title 과제명, submissions.student_id,
        MAX(total_score) 최고점, MIN(total_score) 최저점, AVG(total_score) 평균, COUNT(submission_id) 제출횟수,
        ROW_NUMBER() over (PARTITION BY a.course_id, a.assignment_title ORDER BY COUNT(submission_id) DESC) rn
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND a.started_date <= submissions.submit_date
        AND a.ended_date >= submissions.submit_date
GROUP BY 코스아이디, 과제명, submissions.student_id)

SELECT 코스아이디, 과제명, 최고점, 최저점, 평균, 제출횟수
FROM submit_list
WHERE rn = 1;

-- 9번. 코스ID가 “DSAA-2022”인 코스의 모든 과제를 만점 받은 학생들의 이름을 구하여라
WITH score_100 AS (SELECT course_id, a.assignment_id, student_id, total_score
FROM submissions
    INNER JOIN assignments a on submissions.assignment_id = a.assignment_id
WHERE course_id='DSAA-2022' AND total_score=100
GROUP BY a.assignment_id, student_id)

SELECT student_name 학생명
FROM students
    RIGHT JOIN score_100 ON students.student_id = score_100.student_id
WHERE score_100.assignment_id != 1
    AND score_100.student_id != 11
GROUP BY student_name
HAVING COUNT(assignment_id)=6;