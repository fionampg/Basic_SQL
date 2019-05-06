-- DROP DATABASE IF EXISTS employee_db;
-- CREATE DATABASE IF NOT EXISTS employee_db;
-- USE employee_db;

-- SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

-- DROP TABLE IF EXISTS dept_emp,
--                      dept_manager,
--                      titles,
--                      salaries, 
--                      employees, 
--                      departments;

--Creating datatype for gender
CREATE TYPE gendertype AS ENUM ('M', 'F');

--Creating tables 
CREATE TABLE employees (
    emp_no      INT             NOT NULL 	PRIMARY KEY,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(20)     NOT NULL,
    last_name   VARCHAR(20)     NOT NULL,
    gender      gendertype  	NOT NULL,    
    hire_date   DATE            NOT NULL
);

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL	PRIMARY KEY,
    dept_name   VARCHAR(40)     NOT NULL
);

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
   	dept_no      CHAR(4)         NOT NULL,
   	emp_no       INT             NOT NULL,
	from_date    DATE            NOT NULL,
	to_date      DATE            NOT NULL,
   	FOREIGN KEY (emp_no)  REFERENCES employees (emp_no),
   	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
   	PRIMARY KEY (emp_no, dept_no)
); 


CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date)
); 

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
); 