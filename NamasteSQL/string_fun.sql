select dept_id,STRING_AGG(emp_name,';' )  WITHIN GROUP (ORDER BY salary desc) as list_of_employees
from employee
group by dept_id;
