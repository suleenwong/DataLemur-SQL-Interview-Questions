-- Apple Pay Volume
SELECT merchant_id,
  SUM(CASE WHEN LOWER(payment_method) = 'apple pay' THEN transaction_amount
  ELSE 0 END) AS total_amount
FROM transactions
GROUP BY merchant_id
ORDER BY total_amount DESC;