-- Monthly Merchant Balance
WITH grouped_balance AS (
SELECT DATE_TRUNC('day', transaction_date) AS day,
      DATE_TRUNC('month', transaction_date) AS month,
      SUM(CASE WHEN type = 'withdrawal' THEN -amount 
      ELSE amount END) AS balance
FROM transactions
GROUP BY 1, 2
)
SELECT day, 
  SUM(balance) OVER (PARTITION BY month ORDER BY day) AS balance
FROM grouped_balance
ORDER BY day;