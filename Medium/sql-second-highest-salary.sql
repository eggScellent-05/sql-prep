select DISTINCT salary
from (
    SELECT *,
    dense_rank() over (order by salary desc) as dr
    from employee
) as salary_rank
where dr=2;    --using dense rank

----------------------------------------------------

select max(salary) as  second_highest_salary
from employee where salary < (
    select max(salary) as  second_highest_salary
    from employee
  )           -- just comparing with the highest


----------------------------------------------------



select distinct salary
from employee
order by salary DESC
limit 1 offset 1 ; --concise