with transaction_info as 
(
  select EXTRACT(year from transaction_date) as year,product_id,sum(spend) as curr_year_spend,
  lag(sum(spend)) over 
  (PARTITION BY product_id ORDER BY EXTRACT(year from transaction_date) ) as prev_year_spend
  from  user_transactions
  group by product_id, EXTRACT(year from transaction_date)
)

select *,
round(100.0*(curr_year_spend-prev_year_spend)/NULLIF(prev_year_spend, 0),2) as yoy_rate
from transaction_info
order by product_id,year
