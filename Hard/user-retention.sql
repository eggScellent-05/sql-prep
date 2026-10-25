select 7 as month, 
count(DISTINCT user_id) from user_actions
where event_date>='2022-07-01' and event_date<'2022-08-01' 
and user_id in (
    select user_id from  user_actions
    where event_date>='2022-06-01' and event_date<'2022-07-01' 

)


--------------------------------------------------------------
--my answer

select 7 as month, count(*) as monthly_active_users
from (
  select user_id
  from user_actions
  where event_date >= '2022-07-01' and event_date < '2022-08-01'
  
  INTERSECT
  
  select user_id
  from user_actions
  where event_date >= '2022-06-01' and event_date < '2022-07-01'
) as subq


--AND user_id IS NOT NULL        if needed


---------------------------------------------------------------

SELECT
    EXTRACT(MONTH FROM curr_month.event_date) AS mth,
    COUNT(DISTINCT curr_month.user_id) AS monthly_active_users
FROM user_actions AS curr_month
WHERE EXISTS (
    SELECT last_month.user_id
    FROM user_actions AS last_month
    WHERE last_month.user_id = curr_month.user_id
      AND EXTRACT(MONTH FROM last_month.event_date) =
          EXTRACT(MONTH FROM curr_month.event_date - INTERVAL '1 month')
)
  AND EXTRACT(MONTH FROM curr_month.event_date) = 7
  AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_month.event_date);
