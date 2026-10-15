--best approach
with duplist as (
  select company_id, count(*)
  from job_listings
  group by company_id,title,description
  having count(*) >=2
  )
  
select count(distinct company_id) from duplist



--self join approach
SELECT COUNT(DISTINCT j1.company_id)
FROM job_listings j1
JOIN job_listings j2
  ON j1.company_id = j2.company_id
 AND j1.title = j2.title
 AND j1.description = j2.description
 AND j1.job_id < j2.job_id;




 --window function approach

with ranked as (
  select *,
  count(*) over (partition by company_id,title,description)
  as listing_count
  from job_listings
)

select count(distinct company_id) from ranked
where listing_count>=2