-- Duplicate Job Listings
WITH duplicates AS (
    SELECT COUNT(*)
    FROM job_listings
    GROUP BY company_id, title, description
    HAVING COUNT(*) > 1
)
SELECT COUNT(*)
FROM duplicates;