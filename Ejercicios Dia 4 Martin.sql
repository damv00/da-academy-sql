SET sql_mode = 'ONLY_FULL_GROUP_BY'; 

#1 Write a query to find the addresses (location_id, street_address, city, state_province, country_name) 
#of all the departments.Write a query to get the total salaries payable to employees. 
SELECT l.LOCATION_ID,l.STREET_ADDRESS,l.CITY,l.STATE_PROVINCE,c.COUNTRY_NAME
FROM locations AS l
JOIN countries AS c
ON l.COUNTRY_ID=c.COUNTRY_ID

#2 Write a query to find the name (first_name, last name), department ID and name of all the employees. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS 'NAME',e.DEPARTMENT_ID
FROM employees AS e
LEFT JOIN job_history AS j
ON e.EMPLOYEE_ID=j.EMPLOYEE_ID

#3 Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London. 
SELECT e.FIRST_NAME,e.LAST_NAME,e.JOB_ID,e.DEPARTMENT_ID
FROM employees AS e
JOIN departments AS d
ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
JOIN locations AS l
ON d.LOCATION_ID=l.LOCATION_ID
WHERE l.CITY='London'

#4 Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name). 
SELECT *
FROM employees

SELECT *
FROM departments

SELECT e.EMPLOYEE_ID, e.LAST_NAME,e.MANAGER_ID
FROM employees AS e

UNION
SELECT e.EMPLOYEE_ID, e.LAST_NAME
FROM employees AS e

#5 Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'. 
SELECT FIRST_NAME,LAST_NAME,HIRE_DATE
FROM employees
WHERE HIRE_DATE>
(SELECT HIRE_DATE
FROM employees
WHERE LAST_NAME='Jones')
ORDER BY HIRE_DATE


#6 Write a query to get the department name and number of employees in the department. 
SELECT d.DEPARTMENT_NAME,COUNT(EMPLOYEE_ID) AS 'Number of employees'
FROM departments AS d
JOIN employees AS e
ON d.MANAGER_ID=e.MANAGER_ID
GROUP BY d.DEPARTMENT_NAME

#7 Write a query to find the employee ID, job title, number of days between ending date 
#and starting date for all jobs in department 90. 
SELECT e.EMPLOYEE_ID,e.JOB_ID,j.START_DATE,j.END_DATE,(j.END_DATE-j.START_DATE) AS 'Difference'
FROM employees AS e
JOIN job_history AS j
ON e.EMPLOYEE_ID=j.EMPLOYEE_ID


#8 Write a query to display the department ID and name and first name of manager. 


SELECT *
FROM departments;

SELECT A.DEPARTMENT_ID,A.FIRST_NAME,A.MANAGER_ID,A.EMPLOYEE_ID,B.FIRST_NAME
FROM employees AS A,employees AS B
WHERE A.EMPLOYEE_ID=B.MANAGER_ID;

SELECT *
FROM employees



#9 Write a query to display the department name, manager name, and city. 
SELECT *
FROM employees;

SELECT d.DEPARTMENT_NAME,e.FIRST_NAME,l.CITY
FROM departments AS d
	JOIN employees AS e
ON d.MANAGER_ID=e.EMPLOYEE_ID
	JOIN locations AS l
ON d.LOCATION_ID=l.LOCATION_ID

#10 Write a query to display the job title and average salary of employees. 
SELECT JOB_ID, AVG(SALARY)
FROM employees
GROUP BY JOB_ID

#11 Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
SELECT JOB_ID,FIRST_NAME,(MAX(SALARY)-MIN(SALARY)) AS 'Difference'
FROM employees
GROUP BY JOB_ID,FIRST_NAME

#12 Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
SELECT jh.*
FROM job_history AS jh
	JOIN employees AS e
ON jh.EMPLOYEE_ID=e.EMPLOYEE_ID
WHERE e.SALARY>10000

#13 Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT d.DEPARTMENT_NAME,CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS 'Name',e.HIRE_DATE
FROM departments AS d
	JOIN employees AS e
	ON d.DEPARTMENT_ID=e.DEPARTMENT_ID
WHERE (
	
	SELECT *
	FROM employees

#ocupo department_name de departments
#ocupo name de employees
#ocupo hire_date de employees
#ocupo el salario del manager de employees
 