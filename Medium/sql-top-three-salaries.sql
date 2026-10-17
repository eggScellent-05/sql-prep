
--answer with edge case- what if there are deparmtnets with same name but diff id
with high_salary as 
(
  SELECT dept.department_id,dept.department_name, emp.name, emp.salary,
  dense_rank() over (partition by dept.department_id order by emp.salary desc ) as ranks
  FROM employee emp join department dept on
  dept.department_id = emp.department_id

)

select department_name,	name	,salary from high_salary
where ranks<=3
order by department_name,department_id, salary desc, name

----------------------------------------------------------
--my first answer
WITH high_salary AS (
    SELECT
        dept.department_name,
        emp.name,
        emp.salary,
        DENSE_RANK() OVER (
            PARTITION BY dept.department_name
            ORDER BY salary DESC
        ) AS ranks
    FROM employee emp
    JOIN department dept
        ON dept.department_id = emp.department_id
)
SELECT department_name, name, salary
FROM high_salary
WHERE ranks <= 3
ORDER BY department_name, salary DESC, name;