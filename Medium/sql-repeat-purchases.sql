-- Repeat Purchases on Multiple Days
SELECT COUNT(*)
FROM (
SELECT 
  user_id, 
  product_id, 
  COUNT(DISTINCT DATE(purchase_date)) AS distinct_dates
FROM purchases
GROUP BY user_id, product_id
HAVING COUNT(DISTINCT DATE(purchase_date)) > 1
) AS grouped_purchases;