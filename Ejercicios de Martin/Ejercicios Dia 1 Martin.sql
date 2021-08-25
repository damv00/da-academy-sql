USE labhr;

#1 Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name". 
SELECT FIRST_NAME 'First Name',LAST_NAME 'Last Name'
FROM employees;

#2 Write a query to get unique department ID from employee table. 
SELECT DEPARTMENT_ID
FROM employees
GROUP BY DEPARTMENT_ID;

#3 Write a query to get all employee details from the employee table order by first name, descending. 
SELECT *
FROM employees
ORDER BY FIRST_NAME DESC

#4 Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary). 
SELECT FIRST_NAME,LAST_NAME,SALARY,(SALARY*0.15) AS PF
FROM employees;

#5 Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary. 
SELECT EMPLOYEE_ID,CONCAT (FIRST_NAME,' ',LAST_NAME) AS 'NAMES',SALARY
FROM employees
ORDER BY SALARY 

#6 Write a query to get the total salaries payable to employees. 
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,sum(SALARY) 'TOTAL SALARIES'
FROM employees

#7 Write a query to get the maximum and minimum salary from employees table. 
SELECT MAX(SALARY) 'Maximum Salary',MIN(SALARY) 'Minimum Salary'
FROM employees

#8 Write a query to get the average salary and number of employees in the employees table. 
SELECT AVG(SALARY) 'Average Salary', COUNT(DISTINCT EMPLOYEE_ID) 'Number of employees'
FROM employees;

#9 Write a query to get the number of employees working with the company. 
SELECT COUNT(DISTINCT EMPLOYEE_ID)
FROM employees

#10 Write a query to get the number of jobs available in the employees table. 
SELECT COUNT(DISTINCT JOB_ID)
FROM employees

#11 Write a query get all first name from employees table in upper case. 
SELECT UPPER(FIRST_NAME) 'First Name'
FROM employees

#12 Write a query to get the first 3 characters of first name from employees table. 
SELECT SUBSTRING(FIRST_NAME,1,3)
FROM employees;

SELECT LEFT(FIRST_NAME,3)
FROM employees

#13 Write a query to calculate 171*214+625. 
SELECT (171*214+625) AS Calculation

#14 Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Names'
FROM employees
ORDER BY FIRST_NAME

#15 Write a query to get first name from employees table after removing white spaces from both side. 
SELECT TRIM(FIRST_NAME)
FROM employees

#16 Write a query to get the length of the employee names (first_name, last_name) from employees table. 
SELECT LENGTH(CONCAT(FIRST_NAME,LAST_NAME))
FROM employees

#17 Write a query to check if the first_name fields of the employees table contains numbers. 
SELECT FIRST_NAME
FROM employees 
WHERE FIRST_NAME LIKE '%0%' OR
FIRST_NAME LIKE '%1%' OR
FIRST_NAME LIKE '%2%' OR
FIRST_NAME LIKE '%3%' OR
FIRST_NAME LIKE '%4%' OR
FIRST_NAME LIKE '%5%' OR
FIRST_NAME LIKE '%6%' OR
FIRST_NAME LIKE '%7%' OR
FIRST_NAME LIKE '%8%' OR
FIRST_NAME LIKE '%9%'

#18 Write a query to select first 10 records from a table. 
SELECT *
FROM employees
ORDER BY EMPLOYEE_ID
LIMIT 10

#19 Write a query to get monthly salary (round 2 decimal places) of each and every employee.  
#Note : Assume the salary field provides the 'annual salary' information. 
SELECT ROUND(SALARY/12,2) 'MONTHLY SALARY'
FROM employees