select u.city , count(*) as total_orders
from users u join trades t 
on u.user_id = t.user_id
where t.status = 'Completed'
group by u.city 
order by total_orders DESC
limit 3;


--or if we have to include ties
select city, trade_count from (select u.city ,
count (*) as trade_count,
dense_rank() over (order by count(*) desc) as trade_rank
from users u join trades t 
on u.user_id = t.user_id
where t.status = 'Completed'
group by u.city ) as suq
where trade_rank <=3
order by trade_count desc;