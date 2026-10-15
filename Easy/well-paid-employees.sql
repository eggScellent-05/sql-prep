--self join

select emp.employee_id,emp.name
from employee mgr join employee emp 
on emp.manager_id = mgr.employee_id
where emp.salary>mgr.salary;

