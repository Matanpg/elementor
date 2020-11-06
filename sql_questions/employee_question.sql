with salaries as (
	select
		department_id
		,employee_id
		,salary
		,rank() over(partition by department_id order by salary desc) as salary_rank
		,lead(salary) over(partition by department_id order by salary desc) as next_earner
	from
		employees
)

select d.department_name
		,s.employee_id
		,s.salary
		,s.salary - s.next_earner as diff_from_second
from salaries as s
join departments as d
using department_id
where s.salary_rank = 1