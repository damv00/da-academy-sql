#1 Write a query to display the name (first_name, last_name) 
#and salary for all employees whose salary is not in the range $10,000 through $15,000. 
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM employees
WHERE SALARY<10000 OR  SALARY>15000

#2 Write a query to display the name (first_name, last_name) 
#and department ID of all employees in departments 30 or 100 in ascending order. 
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID
FROM employees
WHERE DEPARTMENT_ID=30 OR DEPARTMENT_ID=100
ORDER BY DEPARTMENT_ID 

#3 Write a query to display the name (first_name, last_name) and salary for all 
#employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100. 
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM employees
WHERE SALARY NOT BETWEEN 10000 AND 15000 
AND DEPARTMENT_ID=30 OR DEPARTMENT_ID=100
ORDER BY SALARY

#4 Write a query to display the name (first_name, last_name) and hire date for all 
#employees who were hired in 1987. 
#Hint: Google the usage of the SQL function YEAR().
SELECT FIRST_NAME,LAST_NAME,HIRE_DATE
FROM employees
WHERE YEAR(HIRE_DATE)=1987
ORDER BY HIRE_DATE

#5 Write a query to display the first_name of all employees who have both "b" and "c" in their first name. 
SELECT FIRST_NAME,LAST_NAME
FROM employees
WHERE INSTR(FIRST_NAME,'b') AND INSTR(FIRST_NAME,'c')

#6 Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer 
#or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000. 
SELECT LAST_NAME,JOB_ID,SALARY
FROM employees
WHERE (JOB_ID='IT_PROG' OR JOB_ID='ST_CLERK') AND (SALARY <> 4500 OR SALARY <> 10000 OR SALARY <> 15000)
ORDER BY SALARY


SELECT LAST_NAME,JOB_ID,SALARY
FROM employees
WHERE (JOB_ID='IT_PROG' OR JOB_ID='ST_CLERK') AND SALARY NOT IN (4500, 10000,15000)
ORDER BY SALARY

#7 Write a query to display the last name of employees whose names have exactly 6 characters. 
#Hint: Google the usage of the SQL function CHARACTER_LENGTH(). 
SELECT LAST_NAME
FROM employees
WHERE CHARACTER_LENGTH(FIRST_NAME,LAST_NAME)=6

#8 Write a query to display the last name of employees having 'e' as the third character. 
SELECT LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '__e%'

SELECT LAST_NAME 'Last Name'
FROM employees
WHERE SUBSTRING(LAST_NAME,3,1)='e'

#9 Write a query to display the jobs/designations available in the employees table. 
SELECT JOB_ID
FROM employees
GROUP BY JOB_ID

#10 Write a query to display the name (first_name, last_name), salary and PF (calculate as 15% of salary) of all employees. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) 'NAME',SALARY,(SALARY*0.15) 'PF'
FROM employees

#11 Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'. 
SELECT *
FROM employees
WHERE LAST_NAME IN ('Blake','Scott', 'King', 'Ford')

SELECT *
FROM employees
WHERE LAST_NAME ='Blake' 
OR LAST_NAME ='Scott' 
OR LAST_NAME ='King' 
OR LAST_NAME = 'Ford'

