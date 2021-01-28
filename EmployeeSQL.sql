
CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR(30)
);

SELECT * FROM departments;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title_id varchar,
	birth_date date,
    first_name varchar,
	last_name varchar,
	gender varchar,
	hire_date date
);

SELECT * FROM employees;


CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INT
);

SELECT * FROM dept_manager;

CREATE TABLE dept_emp (
    emp_no INT,
	dept_no VARCHAR
);

SELECT * FROM dept_emp;


CREATE TABLE salaries (
    emp_no INT,
	salaries INT
);

SELECT * FROM salaries;

CREATE TABLE titles (
    title_id VARCHAR,
	title VARCHAR
);

SELECT * FROM titles;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salaries
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';


SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;


SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;


SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
