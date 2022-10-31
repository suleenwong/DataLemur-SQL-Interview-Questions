-- Histogram of Tweets
WITH tweets_grouped AS (
  SELECT user_id, COUNT(*) AS tweet_bucket
  FROM tweets
  WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
  GROUP BY user_id
)
SELECT tweet_bucket, COUNT(DISTINCT user_id) AS users_num
FROM tweets_grouped
GROUP BY tweet_bucket;