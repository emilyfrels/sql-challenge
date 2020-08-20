-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UhwRkj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


DROP TABLE IF EXISTS
	--"dept_manager",
	--"departments",
	--"employees",
	--"dept_emp",
	--"salaries",
	"titles"
   
-- Create tables for each CSV

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(255) NOT NULL,
    "emp_no" INT NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )	
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(255) NOT NULL,
    "dept_name" VARCHAR(255) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(255)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no", "first_name", "last_name"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(255) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no", "dept_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

--Come back to this?
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
--Come back to the above - second one worked fine

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
join departments on departments.dept_no = dept_emp.dept_no