-- Invalid Search Results
WITH search_cte AS (       
SELECT country, search_cat, num_search, 
       num_search*invalid_result_pct*0.01 AS invalid_searches
FROM search_category
WHERE num_search IS NOT NULL
  AND invalid_result_pct IS NOT NULL
)
SELECT country, SUM(num_search) AS total_search,
       ROUND(100.0*SUM(invalid_searches)/SUM(num_search),2) AS invalid_searches_pct
FROM search_cte       
GROUP BY country;