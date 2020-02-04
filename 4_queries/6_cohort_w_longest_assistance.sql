SELECT cohorts.name as name, avg(completed_at - started_at) as average_assistance_time
  FROM assistance_requests
  JOIN students on assistance_requests.student_id = students.id
  JOIN cohorts on cohort_id = cohorts.id
  GROUP BY cohorts.name
  ORDER BY average_assistance_time DESC
  LIMIT 1;