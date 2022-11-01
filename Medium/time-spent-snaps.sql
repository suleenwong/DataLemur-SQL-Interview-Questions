-- Sending vs. Opening Snaps
WITH activities_age AS (
  SELECT a.user_id, b.age_bucket,
         CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END send_time,
         CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END open_time
  FROM activities AS a
  LEFT JOIN age_breakdown AS b
    ON a.user_id = b.user_id
)
SELECT age_bucket, 
  ROUND(100.0*SUM(send_time)/(SUM(send_time)+SUM(open_time)),2) AS send_perc,
  ROUND(100.0*SUM(open_time)/(SUM(send_time)+SUM(open_time)),2) AS open_perc
FROM activities_age
GROUP BY age_bucket;