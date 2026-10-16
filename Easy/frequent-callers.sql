select count(policy_holder_id) as policy_holder_count
from 
(
  select policy_holder_id, count(case_id)
  from callers
  group by policy_holder_id 
  having count(case_id)>=3
) as holders


--count(*) , if used may count the null groups too