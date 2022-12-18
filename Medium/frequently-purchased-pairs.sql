-- Frequently Purchased Pairs
SELECT COUNT(*)
FROM transactions AS t1
JOIN transactions AS t2
  ON t1.transaction_id = t2.transaction_id
  AND t1.product_id > t2.product_id