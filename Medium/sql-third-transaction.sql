-- User's Third Transaction
WITH ranked_transactions AS (
  SELECT *,
    RANK() OVER (PARTITION BY user_id ORDER BY transaction_date) AS transaction_rank
  FROM transactions
)
SELECT user_id, spend, transaction_date
FROM ranked_transactions
WHERE transaction_rank = 3