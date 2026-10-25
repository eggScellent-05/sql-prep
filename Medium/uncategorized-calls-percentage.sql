select 
round(100.0*count(case when call_category = 'n/a' or TRIM(call_category) = '' or call_category IS NULL THEN 1 END)
/count(*),1) as uncategorised_call_pct
from callers

--COALESCE(NULLIF(TRIM(call_category), ''), 'n/a') = 'n/a' -- covers all three conditions