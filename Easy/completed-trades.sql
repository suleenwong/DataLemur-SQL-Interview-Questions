-- Cities With Completed Trades
SELECT u.city, COUNT(*) AS num_trades
FROM trades AS t
JOIN users AS u
  ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY num_trades DESC
LIMIT 3;