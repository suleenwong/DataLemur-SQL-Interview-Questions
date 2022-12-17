-- Pharmacy Analytics (Part 2)
WITH drug_losses AS (
  SELECT drug, manufacturer, total_sales-cogs AS loss
  FROM pharmacy_sales
  ORDER BY loss
  )
SELECT manufacturer, COUNT(drug) AS drug_count, ABS(SUM(loss)) AS total_loss
FROM drug_losses
WHERE loss < 0
GROUP BY manufacturer
ORDER BY total_loss DESC;