-- Y-on-Y Growth Rate
WITH yearly_spend AS (
  SELECT EXTRACT(YEAR FROM transaction_date) AS year, 
         product_id, 
         SUM(spend) AS curr_year_spend
  FROM user_transactions
  GROUP BY 1, 2
  ORDER BY 2, 1
)
SELECT year, product_id, curr_year_spend,
  LAG(curr_year_spend, 1) OVER (PARTITION by product_id ORDER BY year) AS prev_year_spend,
  ROUND(100.0*(curr_year_spend - LAG(curr_year_spend, 1) OVER (PARTITION by product_id ORDER BY year))/LAG(curr_year_spend, 1) OVER (PARTITION by product_id ORDER BY year),2) AS yoy_rate
FROM yearly_spend
ORDER BY 2, 1;