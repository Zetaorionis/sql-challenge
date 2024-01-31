--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s
on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '01/01/1986' and hire_date < '01/01/1987'; 

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments d
LEFT JOIN manager m 
ON d.dept_no = m.dept_no
LEFT JOIN employees e
ON m.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT b.dept_no, b.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp b
LEFT JOIN employees e
ON b.emp_no = e.emp_no
LEFT JOIN departments d 
ON b.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.--
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' and LEFT (last_name,1) = 'B' ;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT b.emp_no, e.last_name, e.first_name
FROM dept_emp b
LEFT JOIN employees e
ON b.emp_no = e.emp_no
LEFT JOIN departments d 
ON b.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT b.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp b
LEFT JOIN employees e
ON b.emp_no = e.emp_no
LEFT JOIN departments d 
ON b.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS frequency 
FROM employees
GROUP BY  last_name
Order by 
COUNT(last_name) DESC;
