-- Spotify Streaming History
WITH songs_combined AS (
  SELECT user_id, song_id, COUNT(*) AS song_plays
  FROM songs_weekly
  WHERE DATE(listen_time) <= '2022-08-04'
  GROUP BY user_id, song_id
  UNION ALL
  SELECT user_id, song_id, song_plays
  FROM songs_history
)
SELECT user_id, song_id, SUM(song_plays) AS song_plays
FROM songs_combined
GROUP BY user_id, song_id
ORDER BY song_plays DESC;