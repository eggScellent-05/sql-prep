SELECT 
round(count(
  CASE WHEN call_category in ('n/a','')  or call_category is NULL then 1
  else null
  END
)*100.0/ count(*),1) as uncategorised_call_pct
FROM callers;

-- check if null is said in the question