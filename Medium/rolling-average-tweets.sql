SELECT 
user_id,
tweet_date,
round(avg(tweet_count) over (
partition by user_id 
order by tweet_date 
ROWS BETWEEN 2 PRECEDING and CURRENT ROW
),2) as rolling_avg_3rd
FROM tweets;