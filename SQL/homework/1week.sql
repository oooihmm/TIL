

-- 1번 문제
SELECT assignments.course_id 코스명,
    COUNT(DISTINCT submissions.student_id) 제출학생수,
    COUNT(submissions.submission_id) 제출숙제개수,
FROM assignments
    INNER JOIN submissions
    ON assignments.assignment_id = submissions.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0-) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND assignments.started_date <= submissions.submit_date
        AND assignments.ended_date >= submissions.submit_date
GROUP BY assignments.course_id;

-- 2번 문제
SELECT assignments.course_id 코스명,
    assignments.assignment_title 숙제명,
    students.student_name 학생명,
    MIN(submissions.submit_date) 제출시간
FROM assignments
    INNER JOIN submissions
    ON assignments.assignment_id = submissions.assignment_id
    INNER JOIN students
    ON submissions.student_id = students.student_id
GROUP BY assignments.course_id, assignments.assignment_id;

-- 3번 문제
-- 각 코스별, 숙제별로 학생들이 숙제를 제출한 회수를 출력하시오
SELECT assignments.course_id 코스명,
    assignments.assignment_title 숙제명,
    COUNT(submissions.submission_id) 제출개수
FROM submissions
    INNER JOIN assignments
    ON assignments.assignment_id = submissions.assignment_id
    INNER JOIN (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0) students
    ON students.student_id = submissions.student_id
WHERE submissions.assignment_id != 1
        AND submissions.student_id != 11
        AND assignments.started_date <= submissions.submit_date
        AND assignments.ended_date >= submissions.submit_date
GROUP BY assignments.course_id, assignments.assignment_id;

-- 4번 문제
-- 각 코스별, 숙제별, 학생별로 처음 만점이 될 때까지의 제출 횟수를 출력하시오. 단 만점이 아닌 경우에는 출력하지 않습니다.
WITH scoring AS (SELECT assignments.course_id,
                assignments.assignment_title,
                submissions.student_id,
                ROW_NUMBER() over
                    (PARTITION BY submissions.assignment_id,
                    submissions.student_id
                    ORDER BY total_score) AS rn,
                submissions.total_score
                FROM assignments
                INNER JOIN submissions
                ON assignments.assignment_id = submissions.assignment_id
                WHERE submissions.assignment_id != 1
                    AND submissions.student_id != 11
                    AND assignments.started_date <= submissions.submit_date
                    AND assignments.ended_date >= submissions.submit_date),
    students AS (SELECT *
                FROM student_course_relation
                WHERE teaching_assistant = 0)

SELECT scoring.course_id 코스명,
    scoring.assignment_title 과제명,
    scoring.student_id 학생id,
    scoring.rn 제출횟수,
    scoring.total_score 점수
FROM scoring
    INNER JOIN students
    ON scoring.student_id = students.student_id
WHERE scoring.total_score = 100
GROUP BY scoring.course_id, scoring.assignment_title, scoring.student_id;

-- 5번 문제
SELECT submissions.student_id,
COUNT(submissions.total_score=100),
AVG(submissions.submit_date)
FROM (SELECT
MAX(submissions.total_score) max_score,
MIN(submissions.submit_date) min_date,
submissions.student_id
FROM assignments
LEFT JOIN submissions
ON assignments.assignment_id = submissions.assignment_id
GROUP BY assignments.course_id) st
RIGHT JOIN submissions
ON st.student_id = submissions.student_id

-- 6번 문제
SELECT
AVG(MIN(submissions.submit_date), st.min_date)
FROM (SELECT
MIN(submissions.submit_date) min_date,
submissions.student_id
FROM submissions
GROUP BY submissions.student_id
HAVING submissions.total_score = 100) st
RIGHT JOIN submissions
ON submissions.student_id = st.student_id
LEFT JOIN assignments
ON assignments.assignment_id = submissions.assignment_id


-- 7번 문제
SELECT assignments.assignment_title 숙제명,
    submissions.student_id 학생ID,
    COUNT(submissions.student_id) 제출횟수,
    MAX(submissions.submit_date)-MIN(submissions.submit_date) 제출시간
FROM assignments
    LEFT JOIN submissions
    ON assignments.assignment_id = submissions.assignment_id
WHERE submissions.submit_date>assignments.started_date and submissions.submit_date<assignments.ended_date
GROUP BY assignments.assignment_id, submissions.student_id
HAVING MAX(submissions.total_score)=100;



-- 8번 문제
SELECT assignments.course_id 코스,
    assignments.assignment_title 숙제명,
    MIN(submissions.submit_date) 처음제출,
    MAX(submissions.submit_date) 마지막제출
FROM assignments
    LEFT JOIN submissions
    ON assignments.assignment_id = submissions.assignment_id
WHERE submissions.submit_date>assignments.started_date and submissions.submit_date<assignments.ended_date
GROUP BY assignments.course_id, assignments.assignment_id;