-- Signup Confirmation Rate
SELECT ROUND(SUM(CASE WHEN signup_action = 'Confirmed' 
                  THEN 1 
                  ELSE 0 END)::NUMERIC/
                  (SELECT COUNT(*) FROM texts),2) AS confirmed_rate 
FROM emails AS e
JOIN texts AS t
  ON e.email_id = t.email_id;