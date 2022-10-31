-- Teams Power Users
SELECT sender_id, COUNT(*) AS message_count
FROM messages
WHERE sent_date BETWEEN '2022-08-01' and '2022-08-31'
GROUP BY sender_id
ORDER BY 2 DESC
LIMIT 2;