-- Top 5 Artists
SELECT artist_name, artist_rank
FROM (
  SELECT artist_name, COUNT(*),
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS artist_rank
  FROM global_song_rank AS g
  JOIN songs AS s
    ON g.song_id = s.song_id
  JOIN artists AS a
    ON s.artist_id = a.artist_id
  WHERE rank <= 10
  GROUP BY artist_name
) AS ranking
WHERE artist_rank <= 5;