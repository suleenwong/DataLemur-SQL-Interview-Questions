-- Bad Delivery Rate
WITH june22_orders AS (
  SELECT c.customer_id, o.order_id, o.status, t.estimated_delivery_timestamp, t.actual_delivery_timestamp
  FROM customers AS c
  JOIN orders AS o
    ON c.customer_id = o.customer_id
  JOIN trips AS t
    ON o.trip_id = t.trip_id
  WHERE c.signup_timestamp BETWEEN '2022-06-01' AND '2022-06-30'
    AND c.signup_timestamp + INTERVAL '14 days' > o.order_timestamp
)
SELECT ROUND(100.0*COUNT(*)::NUMERIC/(SELECT COUNT(order_id) FROM june22_orders),2) AS bad_experience_pct
FROM june22_orders
WHERE status IN ('completed incorrectly','never received')
      OR actual_delivery_timestamp IS NULL
      OR actual_delivery_timestamp > estimated_delivery_timestamp;