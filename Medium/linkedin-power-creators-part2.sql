-- LinkedIn Power Creators (Part 2)
WITH ranked_followers AS (
  SELECT p.profile_id AS profile_id,
         p.followers AS personal_followers,
         c.followers AS company_followers,
         RANK() OVER (PARTITION BY p.profile_id ORDER BY c.followers DESC) AS rank
  FROM personal_profiles AS p
  LEFT JOIN employee_company AS e
    ON p.profile_id = e.personal_profile_id
  LEFT JOIN company_pages AS c
    ON e.company_id = c.company_id
)
SELECT profile_id
FROM ranked_followers
WHERE personal_followers > company_followers
  AND rank = 1;