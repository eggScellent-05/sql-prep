
  SELECT app_id, 
  round((100.0*count( CASE WHEN event_type = 'click' then 1 else null END))/
  count( CASE WHEN event_type = 'impression' then 1 else null END),2 ) as ctr
  FROM events
  where timestamp>='2022-01-01' and timestamp<'2023-01-01'
  group by app_id;

--edge case integer division by zero
