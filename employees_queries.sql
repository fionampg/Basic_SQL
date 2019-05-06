--1. List the following details of each employee
--employee number, last name, first name, gender, and salary
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary AS "salary"
FROM employees emp, salaries sal
WHERE emp.emp_no = sal.emp_no
ORDER BY "salary" DESC
;

--2. List employees who were hired in 1986
SELECT emp_no, first_name ||' '|| last_name AS full_name, hire_date AS "date_hired"
FROM employees
WHERE hire_date 
	BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY "date_hired" ASC
;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.

SELECT dep.dept_no, dep.dept_name, emp.emp_no, emp.last_name, emp.first_name, dept_manager.from_date, dept_manager.to_date
FROM employees emp 
JOIN dept_manager ON dept_manager.emp_no = emp.emp_no 
INNER JOIN departments dep ON dep.dept_no =  dept_manager.dept_no
;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees emp 
JOIN dept_emp ON dept_emp.emp_no = emp.emp_no 
INNER JOIN departments dep ON dep.dept_no =  dept_emp.dept_no
;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name
;

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees emp 
JOIN dept_emp ON dept_emp.emp_no = emp.emp_no 
INNER JOIN departments dep ON dep.dept_no =  dept_emp.dept_no
WHERE dep.dept_name IN ('Sales')
; 

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name 
FROM employees emp 
JOIN dept_emp ON dept_emp.emp_no = emp.emp_no 
INNER JOIN departments dep ON dep.dept_no =  dept_emp.dept_no
WHERE dep.dept_name IN ('Sales', 'Development') 
GROUP BY dep.dept_name, emp.emp_no 
--order by dep.dept_name 
;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "count_last_name"
FROM employees
GROUP BY last_name
ORDER BY "count_last_name" DESC
;

--Extra queries, not in the assignment
---Average salary by title
SELECT t.title, round(avg(s.salary),2) AS "avg_salary"
FROM salaries s, titles t 
WHERE s.emp_no = t.emp_no
GROUP BY t.title
ORDER BY "avg_salary" DESC;


