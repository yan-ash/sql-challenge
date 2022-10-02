DROP TABLE departments;
DROP TABLE employee;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE titles;
DROP TABLE salaries;



CREATE TABLE departments(
dept_no VARCHAR (10) PRIMARY KEY,
dept_name VARCHAR(30));
SELECT * FROM departments;

CREATE TABLE titles(
title_id VARCHAR (10) PRIMARY KEY,
title VARCHAR(30));

SELECT * FROM titles;

CREATE TABLE employee(
emp_no INT PRIMARY KEY,
emp_title VARCHAR(30),
birth_date VARCHAR(30),
first_name VARCHAR(60) NOT NULL,
last_name VARCHAR (60) NOT NULL,
sex VARCHAR(10) NOT NULL,
hire_date VARCHAR(30),
FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);
SELECT to_date(birth_date, 'MM/DD/YYYY') as birth_date
FROM employee;
SELECT to_date(hire_date, 'MM/DD/YYYY') as hire_date
FROM employee;
SELECT * FROM employee;
 

CREATE TABLE dept_emp(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
dept_no VARCHAR(10),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
SELECT * FROM dept_emp;


CREATE TABLE dept_manager(
dept_no VARCHAR (10),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
SELECT * FROM dept_manager;


CREATE TABLE salaries(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
salary INT
);
SELECT * FROM salaries;
