--AND in ON clause checks the conditions and nulls the ones that do not satisfy it.
--WHERE straight up filters it out. 
--mistake 

with uniq as 
(
  select e.employee_id, count( DISTINCT query_id) as unique_queries
  from employees e left join queries q 
  on e.employee_id = q.employee_id
  AND query_starttime>= '2023-07-01' and query_starttime<'2023-10-01'
  group by e.employee_id
)

select unique_queries,count(employee_id) as employee_count 
from uniq
group by unique_queries
order by unique_queries;