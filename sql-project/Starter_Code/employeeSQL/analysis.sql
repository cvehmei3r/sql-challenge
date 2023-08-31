-- list employee number, first name, last name, sex, salary for all employees
SELECT e.emp_no, e.last_name e.first_name, e.sex, s.salary
	FROM "employees" as e
	JOIN "salaries" as s
		ON e.emp_no = s.emp_no;
		
-- list first name, last name, and hire date for employees hired in 1986

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
	FROM "employees" as e
	WHERE e.hire_date between '1/1/1986' and '12/31/1986'
	
-- list manager of department, their department number, department name, employee number, 
-- last name, and first name

SELECT m.emp_no, d.dept_no, d.dept_name, e.last_name, e.first_name
	FROM "departments" as d
	JOIN "dept_manager" as m
	ON d.dept_no = m.dept.no
	JOIN "employees" as e
	ON m.emp_no= e.emp_no

--list department number for each employee, their employee number, last name, first name, department name

SELECT e.emp_no, e.last_name, e.first_name, x.dept_no
	FROM "employees" as e
	JOIN "dept_emp" as x
	ON e.emp_no = x.emp_no
	JOIN "departments" as d
	ON x.dept_no = dept_no
		
--list first name, last name, sex of each employee named Hercules with last name letter B

SELECT e.first_name, e.last_name, e.sex
	FROM "employees" as e
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'

--list each employee in sales department (employee number, first name, last name)
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
	FROM "employees" as e
	JOIN "dept_emp" as x
	ON e.emp_no = x.emp_no
	JOIN "departments" as d
	ON x.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'
	
--list each employee in the Sales and Development departments, list employee number,
--first name, last name, and department name

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
	FROM "employees" as e
	JOIN "dept_emp" as x
	ON e.emp_no = x.emp_no
	JOIN "departments" as d
	ON x.dept_no = x.dept_no
	WHERE d.dept_name = 'Sales' or 'Development'
	
--list frequency counts in descending order of all employee last names

SELECT e.last_name, count(last_name)
	FROM "employees" as e
	GROUP BY e.last_name
	ORDER BY count DESC
