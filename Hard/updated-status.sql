select 
COALESCE(a.user_id,d.user_id) as user_id,
CASE
  WHEN a.user_id IS NULL THEN 'NEW'
  WHEN d.user_id IS NULL THEN 'CHURN'
  WHEN a.status = 'CHURN' THEN 'RESURRECT'
  ELSE 'EXISTING'
END as new_status
from advertiser a full join daily_pay d 
on a.user_id = d.user_id
order by user_id;