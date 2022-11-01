-- First Transaction
WITH ranked_transactions AS (
  SELECT user_id, transaction_date, spend,
    RANK() OVER (PARTITION BY user_id ORDER BY transaction_date, spend DESC) AS rank
  FROM user_transactions
)
SELECT COUNT(*)
FROM ranked_transactions
WHERE rank = 1
  AND spend >= 50;