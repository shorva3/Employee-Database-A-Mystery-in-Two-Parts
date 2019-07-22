SELECT public."EMPLOYEES".emp_no, public."EMPLOYEES".birth_date, public."EMPLOYEES".first_name, public."EMPLOYEES".last_name, public."EMPLOYEES".gender, public."SALARIES".salary-
FROM public."EMPLOYEES"
JOIN public."SALARIES" ON
public."EMPLOYEES".emp_no = public."SALARIES".emp_no;



SELECT * FROM public."EMPLOYEES"
WHERE public."EMPLOYEES".hire_date BETWEEN '1986-01-01' AND '1986-12-31';


SELECT public."DEPT_MANAGER".dept_no, public."DEPT_MANAGER".emp_no, public."DEPT_MANAGER".from_date, public."DEPT_MANAGER".to_date, public."EMPLOYEES".first_name, public."EMPLOYEES".last_name, public."DEPARTMENT".dept_name
FROM public."DEPARTMENT"
JOIN public."DEPT_MANAGER" ON
public."DEPT_MANAGER".dept_no = public."DEPARTMENT".dept_no
JOIN public."EMPLOYEES" ON
public."DEPT_MANAGER".emp_no = public."EMPLOYEES".emp_no;



SELECT public."DEPT_EMPLOYEE".emp_no, public."EMPLOYEES".last_name, public."EMPLOYEES".first_name, public."DEPARTMENT".dept_name
FROM public."DEPT_EMPLOYEE"
JOIN public."EMPLOYEES"
ON public."DEPT_EMPLOYEE".emp_no = public."EMPLOYEES".emp_no
JOIN public."DEPARTMENT"
ON public."DEPT_EMPLOYEE".dept_no = public."DEPARTMENT".dept_no;


SELECT * FROM public."EMPLOYEES"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


SELECT public."EMPLOYEES".first_name, public."EMPLOYEES".last_name, public."EMPLOYEES".emp_no FROM public."EMPLOYEES"
WHERE public."EMPLOYEES".emp_no IN(

	SELECT public."DEPT_EMPLOYEE".emp_no FROM public."DEPT_EMPLOYEE"
	WHERE public."DEPT_EMPLOYEE".dept_no IN(

		SELECT public."DEPARTMENT".dept_no FROM public."DEPARTMENT"
		WHERE public."DEPARTMENT".dept_name = 'Sales'));
		

SELECT public."DEPARTMENT".dept_name, public."DEPT_EMPLOYEE".emp_no, public."EMPLOYEES".first_name, public."EMPLOYEES".last_name
FROM public."DEPARTMENT"
JOIN public."DEPT_EMPLOYEE" ON
public."DEPARTMENT".dept_no = public."DEPT_EMPLOYEE".dept_no
JOIN public."EMPLOYEES" ON
public."EMPLOYEES".emp_no = public."DEPT_EMPLOYEE".emp_no
WHERE public."DEPARTMENT".dept_name = 'Sales' OR public."DEPARTMENT".dept_name = 'Development';


SELECT public."EMPLOYEES".last_name, count(public."EMPLOYEES".last_name) AS "Last Name Count"
FROM public."EMPLOYEES"
GROUP BY public."EMPLOYEES".last_name
ORDER BY "Last Name Count" DESC;
