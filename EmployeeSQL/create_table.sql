-- Drop all tables
drop table if exists salaries;
drop table if exists titles;
drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists departments;
drop table if exists employees;

-- Create all tables
create table departments(dept_no VARCHAR(30) Primary Key,
						 dept_name VARCHAR(100) Not Null);

create table employees (emp_no INT Primary Key,
						birth_date date Not Null,
						first_name VARCHAR(50) Not Null,
						last_name VARCHAR(50) Not Null,
						gender VARCHAR(30) Not Null,
						hire_date date Not Null);

create table dept_emp  (emp_no INT,
						dept_no VARCHAR(30),                        
						from_date date Not Null,
                        to_date date Not Null,
					    Foreign Key(emp_no) References employees(emp_no),
                        Foreign Key(dept_no) References departments(dept_no));
						
create table dept_manager (dept_no VARCHAR(30),
						   emp_no INT,
						   from_date date Not Null,
						   to_date date Not Null,
						   Foreign Key(emp_no) References employees(emp_no),
                           Foreign Key(dept_no) References departments(dept_no));

create table  salaries (emp_no INT,
					    salary INT Not Null,
						from_date date Not Null, 
						to_date date Not Null, 
						Foreign Key(emp_no) References employees(emp_no));
						 			 
create table titles (emp_no INT,
					 title VARCHAR(100) Not Null,
					 from_date date Not Null,
					 to_date date Not Null,
                     Foreign Key(emp_no) References employees(emp_no));			 
						 