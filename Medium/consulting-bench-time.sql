-- Consulting Bench Time
SELECT employee_id, 365-SUM(end_date - start_date + 1) AS bench_days
FROM consulting_engagements AS c
LEFT JOIN staffing AS s
  ON c.job_id = s.job_id
WHERE EXTRACT(YEAR FROM start_date) = 2021
  AND EXTRACT(YEAR FROM end_date) = 2021
  AND is_consultant = 'true'
GROUP BY employee_id;