--just checked if there are duplicates
-- select count(distinct (user_id,device_type)) from viewership
-- but not necessary bcoz the q asked for viewership
select 
  count(
  CASE
    when device_type = 'laptop' then 1
    else NULL
   END ) 
   as laptop_views,
  count(
  CASE
    when device_type in ('tablet','phone') then 1
    else NULL
    END ) 
  as mobile_views
from viewership;


