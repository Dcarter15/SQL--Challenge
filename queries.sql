--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
employees.last_name, employees.first_name,
employees.sex, wages_salaries.salary
FROM employees
INNER JOIN wages_salaries ON
wages_salaries.emp_no = employees.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.emp_no, 
employees.last_name, employees.first_name,
employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT employees.emp_no, 
employees.last_name, employees.first_name, 
department_manager.dept_no
FROM employees
INNER JOIN department_manager ON
department_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
--https://kb.objectrocket.com/postgresql/join-three-tables-in-postgresql-539
SELECT employees.emp_no, 
employees.last_name, employees.first_name, 
department_employees.dep_no, departments.dep_name
FROM employees
INNER JOIN department_employees ON
department_employees.emp_no = employees.emp_no
INNER JOIN departments ON
departments.dep_no = department_employees.dep_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--https://kb.objectrocket.com/postgresql/join-three-tables-in-postgresql-539
SELECT employees.emp_no, 
employees.last_name, employees.first_name, 
department_employees.dep_no, departments.dep_name
FROM employees
INNER JOIN department_employees ON
department_employees.emp_no = employees.emp_no
INNER JOIN departments ON
departments.dep_no = department_employees.dep_no
WHERE departments.dep_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--https://kb.objectrocket.com/postgresql/join-three-tables-in-postgresql-539
SELECT employees.emp_no, 
employees.last_name, employees.first_name, 
department_employees.dep_no, departments.dep_name
FROM employees
INNER JOIN department_employees ON
department_employees.emp_no = employees.emp_no
INNER JOIN departments ON
departments.dep_no = department_employees.dep_no
WHERE departments.dep_name = 'Sales'
OR departments.dep_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;