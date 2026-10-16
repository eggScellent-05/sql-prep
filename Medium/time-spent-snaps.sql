SELECT age_bucket, 
round(100.0*sum(case when activity_type = 'send' then time_spent else 0 end)/
(sum(case when activity_type = 'send' then time_spent else 0 end)
+
sum(case when activity_type = 'open' then time_spent else 0 end)),2) as send_perc,

round(100.0*sum(case when activity_type = 'open' then time_spent else 0 end)/
(sum(case when activity_type = 'send' then time_spent else 0 end)
+
sum(case when activity_type = 'open' then time_spent else 0 end)),2) as open

FROM age_breakdown ab join activities act 
on ab.user_id = act.user_id
where activity_type in ('send','open')
group by age_bucket;


----------------------------------------------------

with totals as (
  select 
  age_bucket,
  sum(case when activity_type = 'send' then time_spent else 0 end) as total_send,
  sum(case when activity_type = 'open' then time_spent else 0 end) as total_open
  FROM age_breakdown ab join activities act 
  on ab.user_id = act.user_id
  where activity_type in ('send','open')
  group by age_bucket
)
select age_bucket,
round(100*total_send/(total_send+total_open),2) as send_perc,
round(100*total_open/(total_send+total_open),2) as open_perc
from totals;