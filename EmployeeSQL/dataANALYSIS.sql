SELECT * FROM employee;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM departments;
SELECT * FROM dept_manager;

---1. List the following details of each employee: employee number, last name, 
-----first name, sex, and salary.
SELECT employee.emp_no, employee.last_name, employee.first_name, sex, salaries.salary
FROM employee em
LEFT JOIN salaries
ON employee.emp_no = salaries.emp_no;


---2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name,last_name, to_date(hire_date, 'MM/DD/YYYY') AS hire_date
FROM employee 

---WHERE hire_date LIKE '%1986';
WHERE to_date(hire_date, 'MM/DD/YYYY') >= '1986-01-01' AND to_date(hire_date, 'MM/DD/YYYY') <= '1986-12-31'
---3.List the manager of each department with the following information: department number,department name, the manager's employee number, last name, first name.
SELECT de. dept_no, de.dept_name, em.emp_no, em.last_name, em.first_name
FROM departments de 
LEFT JOIN dept_manager deger
ON de.dept_no = deger.dept_no 
LEFT JOIN employee em
ON em.emp_no = de.emp_no;


-------4.List the department of each employee with the following information: employee number,last name, first name, and department name.
----CREATE VIEW department_view AS 
SELECT em.emp_no, em.last_name,  em.first_name, de.dept_name 
FROM dept_emp demp
JOIN employee em
ON demp.emp_no = em.emp_no
LEFT JOIN departments de
ON de.dept_no = demp.dept_no;

---5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

---6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name,  em.first_name, de.dept_name 
FROM dept_emp demp
JOIN employee em
ON demp.emp_no = em.emp_no
LEFT JOIN departments de
ON de.dept_no = demp.dept_no
WHERE dept_name = 'Sales';

---7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name,  em.first_name, de.dept_name 
FROM dept_emp demp
JOIN employee em
ON demp.emp_no = em.emp_no
LEFT JOIN departments de
ON de.dept_no = demp.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

---8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) AS "frequency"
FROM employee
GROUP BY last_name
ORDER BY "frequency" DESC;


