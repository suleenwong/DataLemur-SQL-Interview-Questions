-- Compressed Mean
SELECT ROUND(
    SUM(item_count*order_occurrences)::NUMERIC /
    SUM(order_occurrences)
    ,1) AS mean
FROM items_per_order;