-- Page With No Likes
SELECT page_id 
FROM pages
WHERE page_id NOT IN (
  SELECT page_id
  FROM page_likes
  )
ORDER BY page_id;