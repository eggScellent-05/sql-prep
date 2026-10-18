--using lead() and lag()
with right_orders as (
  select *,
  lead(item) over(order by order_id) as next_item,
  lag(item) over(order by order_id) as prev_item
  from orders
)

select order_id as corrected_order_id,
case
  WHEN order_id%2=1 and next_item is not null then next_item 
  WHEN order_id%2=0 and prev_item is not null then prev_item 
  ELSE item
END as item
from right_orders
order by order_id;

--------------------------------------------------------------------

--using cross joins
with total_items as 
(
  select count(order_id) as total
  from orders
)

select 
case 
  WHEN order_id%2=1 and order_id!=total then order_id+1
  WHEN order_id%2=1 and order_id=total then order_id
  else order_id-1
END as corrected_order_id,
item
FROM orders cross join total_items 
order by corrected_order_id;