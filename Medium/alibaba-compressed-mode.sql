-- Compressed Mode
WITH item_rank AS (
  SELECT item_count, RANK() OVER (ORDER BY order_occurrences DESC) AS rnk
  FROM items_per_order
)
SELECT item_count AS mode
FROM item_rank
WHERE rnk = 1