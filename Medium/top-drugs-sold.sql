-- Pharmacy Analytics (Part 4)
WITH drug_rank_cte AS (
  SELECT 
    manufacturer, 
    drug, 
    RANK() OVER(PARTITION BY manufacturer ORDER BY units_sold DESC) AS drug_rank
  FROM pharmacy_sales
  )
SELECT manufacturer, drug
FROM drug_rank_cte
WHERE drug_rank <= 2;