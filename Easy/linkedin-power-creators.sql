-- LinkedIn Power Creators (Part 1)
SELECT profile_id
FROM personal_profiles AS p
JOIN company_pages AS c
  ON p.employer_id = c.company_id
WHERE p.followers > c.followers
ORDER BY profile_id;