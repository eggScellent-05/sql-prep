--general answer for n consecutive days
with user_days as (
  select distinct user_id,date(transaction_date) as transaction_date from transactions
),
streak as (
  select user_id,
  transaction_date - ROW_NUMBER() over (PARTITION BY user_id order by transaction_date)::INT as streak_num
  from user_days
)

select DISTINCT user_id
from streak
group by user_id,streak_num
having count(streak_num)>=3
order by user_id; 
------------------------------------------------------------------------------------------------
--my answer
with cte as 
(
  SELECT user_id,transaction_date::date as transaction_date,
  lead(transaction_date::date) over (partition by user_id ORDER BY transaction_date::date) as next_date,
  lead(transaction_date::date,2) over (partition by user_id ORDER BY transaction_date::date) as sec_next_date
  FROM transactions
  group by user_id,transaction_date::date

)

select distinct user_id
from cte
where next_date-transaction_date=1 and sec_next_date-transaction_date=2
order by user_id;

--------------------------------------------------------------------------------------------------

--site's answer
SELECT DISTINCT T1.user_id
FROM transactions AS T1
INNER JOIN transactions AS T2
  ON DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
INNER JOIN transactions AS T3
  ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
ORDER BY T1.user_id;