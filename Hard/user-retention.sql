-- Active User Retention
WITH active_users AS (
  SELECT EXTRACT(MONTH FROM a.event_date) AS month, a.user_id AS user_id, a.event_id, a.event_type, a.event_date
  FROM user_actions a  
  JOIN user_actions b  
    ON a.user_id = b.user_id
  WHERE EXTRACT(month FROM a.event_date) - EXTRACT(month FROM b.event_date) = 1
        and EXTRACT(month FROM a.event_date) = 7
)
SELECT month, COUNT(DISTINCT user_id) as monthly_active_users
FROM active_users
GROUP BY month;