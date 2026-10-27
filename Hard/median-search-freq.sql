with all_users as (
  select searches
  from search_frequency
  group by searches, generate_series(1,num_users)
  order by searches
)

select ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY searches)::DECIMAL,1) 
AS median
from all_users