-- Fill Missing Client Data
WITH fill_products AS (
  SELECT
      product_id,
      category,
      name,
      COUNT(category) OVER (ORDER BY product_id) AS category_group
  FROM products
)
SELECT product_id,
       FIRST_VALUE(category) OVER (PARTITION BY category_group ORDER BY product_id) AS category,
       name
FROM fill_products;