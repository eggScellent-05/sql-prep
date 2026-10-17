--check this one about joins, filters, on clauses
select 
round(count(distinct t.email_id)::decimal/count(distinct e.email_id),2) as confirm_rate
from emails e left join texts t 
on e.email_id=t.email_id
and signup_action='Confirmed';