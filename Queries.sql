-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON s.emp_no = e.emp_no
ORDER BY e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT *
FROM employees
WHERE DATE_PART('year', hire_date) = 1986
ORDER BY emp_no;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON dm.dept_no = d.dept_no
INNER JOIN employees AS e ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d_e ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d ON d_e.dept_no = d.dept_no
ORDER BY e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules' AND LOWER(last_name) LIKE 'b%'
ORDER BY last_name;

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE LOWER(d.dept_name) = 'sales'
ORDER BY e.emp_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE LOWER(d.dept_name) IN ('sales', 'development')
ORDER BY e.emp_no;

-- List the frequency counts, in descending order, of all the employee last names.
SELECT last_name, COUNT(*) AS frequency 
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;
