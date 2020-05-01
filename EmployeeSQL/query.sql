-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
  e.emp_no, 
  e.last_name,
  e.first_name,
  e.gender,
  s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no=s.emp_no;

--List employees who were hired in 1986.
select *
from employees
where DATE_TRUNC('year', hire_date)='1986-01-01';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates
select 
   dm.emp_no,
   dm.dept_no,
   dm.from_date,
   dm.to_date,
   d.dept_name,
   e.first_name,
   e.last_name
from dept_manager as dm
inner join departments as d
on dm.dept_no = d.dept_no
inner join employees as e
on dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select 
       e.emp_no,
	   e.first_name,
       e.last_name,
	   d.dept_no
from departments as d
inner join dept_emp as d_e
on d.dept_no = d_e.dept_no
join employees as e
on d_e.emp_no = e.emp_no

-- List all employees whose first name is "List all employees whose first name is "Hercules" and last names begin with "B.""

select first_name,
       last_name
from employees
where first_name='Hercules' And last_name Like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name

select *
from departments

select 
       e.emp_no,
	   e.first_name,
       e.last_name,
	   d.dept_name
from departments as d
inner join dept_emp as d_e
on d.dept_no = d_e.dept_no
join employees as e
on d_e.emp_no = e.emp_no
where d.dept_name='Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select *
from departments

select 
       e.emp_no,
	   e.first_name,
       e.last_name,
	   d.dept_name
from departments as d
inner join dept_emp as d_e
on d.dept_no = d_e.dept_no
join employees as e
on d_e.emp_no = e.emp_no
where d.dept_name in ('Sales', 'Development')


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as "Total number"
from employees
group by last_name
having count (last_name)>1
order by "Total number" desc

-- Bonus
-- Create a bar chart of average salary by title.

select title,
	 Round(avg(salary),2) as avg_salary
from salaries as s
inner join titles as t
on s.emp_no=t.emp_no
group by title
------

select *
from dept_manager





