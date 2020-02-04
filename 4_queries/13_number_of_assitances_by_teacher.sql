SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.*) as total_assistances
  FROM teachers
  JOIN assistance_requests on teacher_id = teachers.id
  JOIN students on student_id = students.id
  JOIN cohorts on cohort_id = cohorts.id
  WHERE cohorts.name = 'JUL02'
  GROUP BY teachers.name, cohorts.name
  ORDER BY teacher;