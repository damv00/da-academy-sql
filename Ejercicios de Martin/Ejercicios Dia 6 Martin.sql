#1 Write a query to get the details of the employees where the length of the first name greater than or equal to 8. 
SELECT *
FROM labhr.employees
WHERE LENGTH(FIRST_NAME)>=8

#2 Write a query to append '@example.com' to email field. 
#Sample Output : 
#SKING@example.com 
#NKOCHHAR@example.com 
#LDEHAAN@example.com 
UPDATE labhr.employees SET EMAIL =CONCAT(EMAIL,'@example.com');

#3 Write a query to get the employee id, first name and hire month. 
#Read about the SQL function EXTRACT()
SELECT EMPLOYEE_ID,FIRST_NAME,EXTRACT(MONTH FROM HIRE_DATE)
FROM employees

#4 Write a query to extract the last 4 character of phone numbers. (only use the SQL functions CHARACTER_LENGTH() 
#in combination with SUBSTRING(), google about the usage of the 2 functions) 
SELECT SUBSTRING(PHONE_NUMBER,CHARACTER_LENGTH(PHONE_NUMBER)-3,4)
FROM employees;

#5 Write a query to get the locations that have minimum street length.
SELECT STREET_ADDRESS,CHARACTER_LENGTH(STREET_ADDRESS) AS 'Street Length'
FROM locations
ORDER BY CHARACTER_LENGTH(STREET_ADDRESS) ASC
LIMIT 5

#6 Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. 
#(only use the SQL functions SUBSTRING() in combination with the LIKE operator) 
SELECT *,CHARACTER_LENGTH(FIRST_NAME)
FROM employees
WHERE SUBSTRING(LAST_NAME,2,CHARACTER_LENGTH(LAST_NAME)-1) LIKE '%c%'

#7 Write a query to display the first day of the month (in datetime format) three months before the current month. 
SELECT (EXTRACT(MONTH FROM HIRE_DATE)-3)AS'month_hire_date',YEAR(HIRE_DATE) AS 'year_hire_date'
FROM employees

#8 Write a query that displays the first name and the length of the first name for all employees whose name starts 
#with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names. 
SELECT FIRST_NAME,CHARACTER_LENGTH(FIRST_NAME) AS 'Length of names that start with A,J or M'
FROM employees
WHERE SUBSTRING(FIRST_NAME,1,1) IN('A','J','M')
ORDER BY FIRST_NAME

#9 Write a query to extract the year from the current date. 
#Remember EXTRACT()? Google the SQL function CURRENT_DATE() 
SELECT EXTRACT(YEAR FROM CURRENT_DATE()) AS 'Current Year'

#10 Write a query to get the first name and hire date from employees table where hire date between 
#'1987-06-01' and '1987-07-30’. 
SELECT FIRST_NAME,HIRE_DATE
FROM employees
WHERE HIRE_DATE BETWEEN '1987-06-01' AND '1987-07-30'

#11 Write a query to get the firstname, lastname who joined in the month of June. 
#(only use the SQL functions EXTRACT()) 
SELECT FIRST_NAME,LAST_NAME
FROM employees
WHERE EXTRACT(MONTH FROM HIRE_DATE)=6

#12 Write a query to get the years in which more than 10 employees joined. 
SELECT EXTRACT(YEAR FROM HIRE_DATE) AS 'year_hire_date'
FROM employees
HAVING COUNT(*)>10

#13 Write a query to get first name of employees who joined in 1987. 
SELECT FIRST_NAME
FROM employees
WHERE EXTRACT(YEAR FROM HIRE_DATE) ='1987'

#14 Write a query to get department name, manager name, and salary of the manager 
#for all managers whose experience is more than 5 years. 
#Remember CURRENT_DATE() function. 
SELECT d.DEPARTMENT_NAME,m.FIRST_NAME,m.SALARY
FROM departments AS d
		JOIN employees AS e
		ON d.DEPARTMENT_ID=e.DEPARTMENT_ID	
		JOIN(SELECT B.FIRST_NAME,B.SALARY
				FROM employees AS A
				JOIN employees AS B
				ON A.EMPLOYEE_ID=B.MANAGER_ID
				WHERE (YEAR(CURRENT_DATE())-YEAR(A.HIRE_DATE))>5	
				GROUP BY B.MANAGER_ID) AS m
		ON e.FIRST_NAME=m.FIRST_NAME

#15 Write a query to get first name, hire date and experience of the employees. 
SELECT FIRST_NAME,HIRE_DATE
FROM employees

SELECT *
FROM employees
		

SELECT A.*,B.*
FROM employees AS A
JOIN employees AS B
ON A.EMPLOYEE_ID=B.MANAGER_ID
GROUP BY B.MANAGER_ID
#WHERE (YEAR(CURRENT_DATE())-YEAR(A.HIRE_DATE))>5	

SELECT MANAGER_ID FROM employees
GROUP BY MANAGER_ID

SELECT EMPLOYEE_ID 
FROM employees
WHERE MANAGER_ID=102
