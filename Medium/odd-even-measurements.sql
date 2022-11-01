-- Odd and Even Measurements
WITH ranked_measurements AS (
  SELECT *,
    RANK() OVER (PARTITION BY DATE_PART('day', measurement_time) ORDER BY measurement_time) AS rank
  FROM measurements
)
SELECT DATE_TRUNC('day', measurement_time) AS measurement_day,
  SUM(CASE WHEN rank%2<>0 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN rank%2=0 THEN measurement_value ELSE 0 END) AS even_sum
FROM ranked_measurements
GROUP BY 1
ORDER BY 1;