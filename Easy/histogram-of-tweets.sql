
-- Approach: Count rows per user within the 2022 date range in a CTE. Then group by that count to find the total number of users per bucket.
-- Mistake/learned: Used standard date comparisons (>= and <) instead of EXTRACT to filter for the year 2022.

WITH user_tweets AS (
  SELECT COUNT(*) AS tweet_cnt
  FROM tweets
  WHERE tweet_date >= '2022-01-01' AND tweet_date < '2023-01-01'
  GROUP BY user_id
)
SELECT 
    tweet_cnt AS tweet_bucket, 
    COUNT(*) AS users_num
FROM user_tweets
GROUP BY tweet_cnt;
