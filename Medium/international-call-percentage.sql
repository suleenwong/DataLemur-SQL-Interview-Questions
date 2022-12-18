-- International Call Percentage
WITH international_calls AS (
  SELECT 
    c.caller_id, 
    c.receiver_id,
    ic.country_id AS caller_country,
    ir.country_id AS receiver_country
  FROM phone_calls AS c
  LEFT JOIN phone_info AS ic
    ON c.caller_id = ic.caller_id
  LEFT JOIN phone_info AS ir
    ON c.receiver_id = ir.caller_id
  WHERE ic.country_id <> ir.country_id
)
SELECT ROUND(
    100*COUNT(*)::NUMERIC/
    (SELECT COUNT(*) FROM phone_calls)
    ,1) AS international_calls_pct
FROM international_calls;