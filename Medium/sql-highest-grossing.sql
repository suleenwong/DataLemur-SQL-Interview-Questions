-- Highest-Grossing Items
WITH ranked_products AS (
  SELECT category, product, SUM(spend) AS total_spend,
    RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS rank
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
  ORDER BY category, SUM(spend) DESC
)
SELECT category, product, total_spend
FROM ranked_products
WHERE rank <= 2;