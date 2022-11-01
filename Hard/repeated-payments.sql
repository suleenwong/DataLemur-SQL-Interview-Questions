-- Repeated Payments
SELECT COUNT(*) AS payment_count
FROM transactions AS T1
JOIN transactions AS T2
  ON T1.credit_card_id = T2.credit_card_id
WHERE T1.transaction_timestamp < T2.transaction_timestamp
  AND T2.transaction_timestamp <= T1.transaction_timestamp + INTERVAL '10 minutes'
  AND T1.amount = T2.amount
  AND T1.merchant_id = T2.merchant_id;