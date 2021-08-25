SET sql_mode = 'ONLY_FULL_GROUP_BY';

#1 Write a query to list the number of jobs available in the employees table. 
SELECT JOB_ID
FROM employees
GROUP BY JOB_ID

#2 Write a query to get the total salaries payable to employees. 
SELECT FIRST_NAME,SUM(SALARY) 'Total Salaries'
FROM employees
GROUP BY FIRST_NAME;

#3 Write a query to get the minimum salary from employees table. 
SELECT MIN(SALARY)
FROM employees

#4 Write a query to get the maximum salary of an employee working as a Programmer. 
SELECT MAX(SALARY)
FROM employees
WHERE JOB_ID LIKE '%PROG%'
GROUP BY FIRST_NAME
LIMIT 1

#5 Write a query to get the average salary and number of employees working the department 90. 
SELECT AVG(SALARY) 'Average Salary',COUNT(FIRST_NAME) 'Number of employees'
FROM employees
WHERE DEPARTMENT_ID=90

#6 Write a query to get the highest, lowest, sum, and average salary of all employees. 
SELECT MAX(SALARY)'Highest',MIN(SALARY)'Lowest Salary',SUM(SALARY)'Sum of Salary',AVG(SALARY)'Average Salary'
FROM employees

#7 Write a query to get the number of employees with the same job. 
SELECT JOB_ID,COUNT(JOB_ID)
FROM employees
GROUP BY(JOB_ID)

#8 Write a query to get the difference between the highest and lowest salaries. 
SELECT MAX(SALARY)'Highest',MIN(SALARY)'Lowest Salary',(MAX(SALARY)-MIN(SALARY)) 'Difference'
FROM employees

#9 Write a query to find the manager ID and the salary of the lowest-paid employee for that manager. 
SELECT MANAGER_ID,MIN(SALARY)'Lowest Salary'
FROM employees 
GROUP BY MANAGER_ID
HAVING MIN(SALARY)=2100
ORDER BY 'Lowest Salary'

#10 Write a query to get the department ID and the total salary payable in each department. 
SELECT JOB_ID,SUM(SALARY),DEPARTMENT_ID
FROM employees
GROUP BY JOB_ID,DEPARTMENT_ID

#11 Write a query to get the average salary for each job ID excluding programmer. 
SELECT JOB_ID,SUM(SALARY)
FROM employees
GROUP BY JOB_ID
HAVING JOB_ID NOT LIKE '%PROG%'

#12 Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only. 
SELECT JOB_ID,MAX(SALARY)'Highest Salary',MIN(SALARY)'Minimum Salary',AVG(SALARY)'Average Salary',SUM(SALARY) 'Total Salaries'
FROM employees
WHERE DEPARTMENT_ID=90
GROUP BY JOB_ID;

#13 Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000. 
SELECT JOB_ID, MAX(SALARY)
FROM employees
GROUP BY JOB_ID
HAVING MAX(SALARY)>=4000

#14 Write a query to get the average salary for all departments employing more than 10 employees. 
SELECT DEPARTMENT_ID,AVG(SALARY)
FROM employees
GROUP BY DEPARTMENT_ID
HAVING COUNT(DEPARTMENT_ID)>10


SELECT *
FROM employees
