-- Supercloud Customer
SELECT c.customer_id
FROM customer_contracts AS c
JOIN products AS p
  ON c.product_id = p.product_id
GROUP BY 1
HAVING COUNT(DISTINCT p.product_category) = 3