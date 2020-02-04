-- SELECT students.name as students, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
--   FROM students
--   JOIN assignment_submissions ON students.id = student_id
--   JOIN assignments ON assignment_id = assignments.id
--   WHERE end_date IS NULL
--   GROUP BY students.name
--   HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
--   ORDER BY avg(assignment_submissions.duration);

-- SELECT (Select count(*) FROM assignments) - count(assignment_submissions) as total_incomplete
--   FROM assignment_submissions
--   JOIN students ON students.id = student_id
--   WHERE students.name = 'Ibraham Schimmel';

-- SELECT count(students) as total_students
--   FROM students
--   JOIN cohorts on cohorts.id = cohort_id
--   GROUP BY cohorts;

-- SELECT avg(total_students) as average_students
--   FROM (SELECT count(students) as total_students
--   FROM students
--   JOIN cohorts on cohorts.id = cohort_id
--   GROUP BY cohorts
--   ) as totals_table;

-- SELECT assignment_id
--   FROM assignment_submissions
--   JOIN students ON students.id = student_id
--   WHERE students.name = 'Ibrahim Schimmel';

SELECT assignments.name 
  FROM assignments
  WHERE assignments.id NOT IN 
  ( 
    SELECT assignment_id
    FROM assignment_submissions
    JOIN students ON students.id = student_id
    WHERE students.name = 'Ibrahim Schimmel'
  );