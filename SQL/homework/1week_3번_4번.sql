

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

