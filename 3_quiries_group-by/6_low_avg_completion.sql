-- SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
--   FROM students
--   JOIN assignment_submissions ON students.id = student_id
--   WHERE end_date is NULL
--   GROUP BY students.name
--   ORDER BY average_assignment_duration DESC;

SELECT students.name as students, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
  FROM students
  JOIN assignment_submissions ON students.id = student_id
  JOIN assignments ON assignment_id = assignments.id
  WHERE end_date IS NULL
  GROUP BY students.name
  HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
  ORDER BY avg(assignment_submissions.duration);