-- 1. List following details of each employee: employee number, last name, first name, sex, and salary.

select * from employees;
select * from salaries;


select 
	salaries.emp_no,
	last_name, 
	first_name, 
	sex,
	salary
from employees
join salaries on employees.emp_no = salaries.emp_no;

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

select
	first_name,
	last_name,
	hire_date
from employees
where hire_date >= '1986-01-01'
	and hire_date <= '1986-12-31';
	
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

-- 3. List the manager of each department with the following information: department number, 
--    department name, the manager's employee number, last name, first name.

select * from dept_manager;
select * from employees;
select * from departments;
select * from titles;

select
	departments.dept_no,
	dept_name,
	employees.emp_no,
	last_name,
	first_name
from employees
join dept_manager on dept_manager.emp_no = employees.emp_no
join departments on departments.dept_no = dept_manager.dept_no
join titles on titles.title_id = employees.emp_title
where title = 'Manager';

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

-- 4. List the department of each employee with the following information: employee number, 
--    last name, first name, and department name.

select * from employees;
select * from departments;
select * from dept_emp;

select
	employees.emp_no,
	last_name,
	first_name,
	dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on departments.dept_no = dept_emp.dept_no;

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select
	first_name,
	last_name,
	sex
from employees
where first_name = 'Hercules'
	and last_name like 'B%';

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

-- 6. List all employees in the Sales department, including their employee number, 
--    last name, first name, and department name.

select * from employees;
select * from departments;
select * from dept_emp;

select
	employees.emp_no,
	last_name,
	first_name,
	dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales';


------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

-- 7. List all employees in the Sales and Development departments, including their employee number, 
--    last name, first name, and department name.

select
	employees.emp_no,
	last_name,
	first_name,
	dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales'
	or dept_name = 'Development';
	
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select 
	last_name,
	count (last_name)
from employees
group by last_name;