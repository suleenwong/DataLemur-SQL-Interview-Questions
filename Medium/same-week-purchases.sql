-- Same Week Purchases
SELECT ROUND(100.0*COUNT(DISTINCT u.user_id)::NUMERIC/(SELECT COUNT (DISTINCT user_id) FROM signups),2)
FROM signups AS s
LEFT JOIN user_purchases AS u
  ON s.user_id = u.user_id
WHERE purchase_date BETWEEN signup_date AND signup_date + INTERVAL '7 days'
  OR purchase_date IS NULL;