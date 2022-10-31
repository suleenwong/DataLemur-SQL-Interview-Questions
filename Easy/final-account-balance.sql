-- Final Account Balance
WITH balance_table AS (
  SELECT account_id,
    CASE WHEN transaction_type = 'Withdrawal' THEN -amount 
         ELSE amount END AS actual_amount
  FROM transactions
)
SELECT account_id, SUM(actual_amount) AS final_balance
FROM balance_table
GROUP BY account_id;