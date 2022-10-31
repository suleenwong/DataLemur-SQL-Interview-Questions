-- Highest Number of Products
SELECT user_id, COUNT(*) AS product_num
FROM user_transactions
GROUP BY user_id
HAVING SUM(spend) > 1000
ORDER BY 2 DESC, SUM(spend) DESC
LIMIT 3;