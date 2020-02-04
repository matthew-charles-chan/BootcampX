SELECT day as day, count(*) as number_of_, sum(duration) as duration
  FROM assignments
  GROUP BY day
  ORDER BY day;