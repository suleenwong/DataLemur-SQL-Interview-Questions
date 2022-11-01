-- Tweets' Rolling Averages
WITH grouped_tweets AS (
  SELECT user_id, tweet_date,
         COUNT(*) AS num_tweets
  FROM tweets
  GROUP BY user_id, tweet_date
  ORDER BY user_id, tweet_date
)
SELECT user_id, tweet_date,
  ROUND(AVG(num_tweets) OVER (PARTITION BY user_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg_3days
FROM grouped_tweets;