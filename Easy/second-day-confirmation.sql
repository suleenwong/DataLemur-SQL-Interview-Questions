-- Second Day Confirmation
SELECT user_id 
FROM emails AS e
JOIN texts AS t
  ON e.email_id = t.email_id
WHERE signup_action = 'Confirmed'
    AND action_date = signup_date + INTERVAL '1 day';