-- Patient Support Analysis (Part 1)
WITH num_calls_users AS (
  SELECT policy_holder_id, COUNT(case_id) AS num_calls
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3
  )
SELECT COUNT(policy_holder_id) AS member_count
FROM num_calls_users