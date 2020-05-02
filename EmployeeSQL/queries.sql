-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
  e.emp_no 		as "employee number", 
  e.last_name 	as "last name",
  e.first_name 	as "first name",
  e.gender 		as gender,
  s.salary 		as salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no=s.emp_no;

--List employees who were hired in 1986.
SELECT 
  e.emp_no 		as "employee number", 
  e.birth_date 	as "birth date",
  e.first_name 	as "first name",
  e.last_name 	as "last name",
  e.gender 		as gender,
  e.hire_date 	as "hire date"
FROM employees e
WHERE DATE_TRUNC('year', e.hire_date)='1986-01-01';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
   dm.dept_no 	as "department number",
   d.dept_name 	as "department name",
   dm.emp_no  	as "employee number",
   e.last_name 	as "last name",
   e.first_name as "first name",
   dm.from_date	as "start employment date",
   dm.to_date	as "end employment date"
FROM dept_manager as dm
INNER JOIN departments as d
ON dm.dept_no = d.dept_no
INNER JOIN employees as e
ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no,dm.from_date;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
 e.emp_no 		as "employee number",
 e.first_name	as "last name",
 e.last_name	as "first name", 
 d.dept_name	as "department name"
FROM employees as e
INNER JOIN dept_emp as d_e
ON e.emp_no=d_e.emp_no
INNER JOIN departments as d
ON d_e.dept_no = d.dept_no;

-- List all employees whose first name is "List all employees whose first name is "Hercules" and last names begin with "B.""
SELECT 
  e.emp_no 		as "employee number", 
  e.birth_date 	as "birth date",
  e.first_name 	as "first name",
  e.last_name 	as "last name",
  e.gender 		as gender,
  e.hire_date 	as "hire date"
FROM employees e
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT 
  e.emp_no 		as "employee number",
  e.last_name	as "last name",
  e.first_name	as "first name",
  d.dept_name	as "department name"
FROM departments as d
INNER JOIN dept_emp as d_e
ON d.dept_no = d_e.dept_no
INNER JOIN employees as e
ON d_e.emp_no = e.emp_no
WHERE d.dept_name='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
  e.emp_no 		as "employee number",
  e.last_name	as "last name",
  e.first_name	as "first name",
  d.dept_name	as "department name"
FROM departments as d
INNER JOIN dept_emp as d_e
ON d.dept_no = d_e.dept_no
INNER JOIN employees as e
ON d_e.emp_no = e.emp_no
WHERE d.dept_name in ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
 e.last_name 		as "Last names", 
 count(e.last_name) as "Total number"
FROM employees e
GROUP BY e.last_name
ORDER BY "Total number" desc;




