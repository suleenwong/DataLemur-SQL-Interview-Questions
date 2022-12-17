-- Patient Support Analysis (Part 2)
SELECT ROUND(
    100*SUM(
        CASE WHEN call_category = 'n/a' OR call_category ISNULL 
        THEN 1 ELSE 0 END
    )::NUMERIC/
    (SELECT COUNT(*) FROM callers),
    1) AS uncategorised_call_pct
FROM callers;
