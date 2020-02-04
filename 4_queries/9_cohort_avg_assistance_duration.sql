SELECT avg(total_duration) as average_total_duration
  FROM (
    SELECT cohorts.name as name, sum(completed_at - started_at) as total_duration
    FROM assistance_requests
    JOIN students on assistance_requests.student_id = students.id
    JOIN cohorts on cohort_id = cohorts.id
    GROUP BY cohorts.name
    ORDER BY total_duration
    ) as total_durations;