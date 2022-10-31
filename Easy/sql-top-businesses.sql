-- Top Rated Businesses
SELECT COUNT(*) business_count, 
       ROUND(100.0*COUNT(*)::NUMERIC/(SELECT COUNT(*) FROM reviews)) AS top_rated_pct
FROM reviews
WHERE review_stars >= 4;