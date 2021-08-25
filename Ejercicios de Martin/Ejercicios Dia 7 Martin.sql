SELECT Student_ID
FROM lab.grades
WHERE grade=(SELECT MIN(Grade)
FROM lab.grades)

#1 Write a query to find the name (first_name, last_name) and the salary of the employees 
#who have a higher salary than the employee whose last_name='Bull'. 
SELECT FIRST_NAME,LAST_NAME, SALARY
FROM labhr.employees
WHERE SALARY>(SELECT SALARY FROM labhr.employees WHERE LAST_NAME='Bull')

#2 Write a query to find the name (first_name, last_name) of all employees who works in the IT department. 
USE labhr
SELECT e.FIRST_NAME,e.LAST_NAME
FROM employees AS e
JOIN departments AS d
ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME LIKE '%IT%'

#3 Write a query to find the name (first_name, last_name) of the employees who are managers. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Name'
FROM employees
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID
FROM employees
GROUP BY MANAGER_ID)
ORDER BY EMPLOYEE_ID;

SELECT *
FROM employees

#4 Write a query to find the name (first_name, last_name), and salary of the employees whose salary 
#is greater than the average salary. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Name',SALARY
FROM employees
WHERE SALARY>(SELECT AVG(SALARY) FROM employees)

#5 Write a query to find the name (first_name, last_name), and salary of the employees who earns more 
#than the average salary and works in any of the IT departments. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Name',SALARY
FROM employees
WHERE SALARY>(SELECT AVG(SALARY) FROM employees)
AND JOB_ID LIKE '%IT%'

#6 Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Name',SALARY
FROM employees
WHERE SALARY>(SELECT SALARY FROM employees WHERE LAST_NAME='Bell')
ORDER BY SALARY

#7 Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum 
#salary for all departments. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Name',SALARY
FROM employees
WHERE SALARY=(SELECT MIN(SALARY) FROM employees)

#8 Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average 
#salary of all departments. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Name',SALARY
FROM employees
WHERE SALARY> ALL(SELECT AVG(SALARY) FROM employees GROUP BY DEPARTMENT_ID)

#9 Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the 
#salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Name',SALARY
FROM employees
WHERE SALARY > ALL(SELECT SALARY FROM employees WHERE JOB_ID='SH_CLERK')
ORDER BY SALARY

#10 Write a query to find the name (first_name, last_name) of the employees who are not supervisors. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'Name'
FROM employees
WHERE EMPLOYEE_ID NOT IN (SELECT MANAGER_ID FROM employees GROUP BY MANAGER_ID)

#11 Write a query to select last 10 records from employee table based on the employee id order. 
SELECT *
FROM employees
ORDER BY EMPLOYEE_ID DESC
LIMIT 10

#12 Write a query to list the department ID and name of all the departments where no employee is working. 
SELECT d.DEPARTMENT_ID,d.DEPARTMENT_NAME
FROM employees AS e
RIGHT JOIN departments AS d
ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
WHERE employee_id IS NULL
ORDER BY d.DEPARTMENT_ID



USE lab
SELECT s.firstName,s.lastName
FROM grades AS g
JOIN students AS s
ON g.Student_ID=s.studentId
WHERE g.Class_Name='SQL'

SELECT firstName,lastName
FROM students
WHERE StudentID IN (SELECT Student_ID FROM grades WHERE Class_Name='SQL')



SELECT s.firstName,s.lastName
FROM students AS s
JOIN grades AS g
ON s.studentId=g.Student_ID
WHERE g.Class_Name <> 'SQL'


SELECT firstName,lastName
FROM students
WHERE studentId IN(SELECT Student_ID
FROM grades
WHERE Class_Name NOT IN (SELECT Class_Name FROM grades WHERE Class_Name='SQL'))

INSERT INTO grades VALUES ('Python',1,10);
INSERT INTO grades VALUES ('Python',2,9);
INSERT INTO grades VALUES ('Python',3,7);
INSERT INTO grades VALUES ('Python',4,9);
INSERT INTO lab.grades VALUES ('Python', 6, 8);
SELECT *
FROM students;

SELECT firstName,lastName
FROM students
WHERE studentId NOT IN (SELECT Student_ID
FROM grades 
WHERE Class_Name='SQL')

SELECT firstName,lastName
FROM students AS s
LEFT JOIN (SELECT Student_ID FROM grades  WHERE Class_Name='SQL') AS g
ON s.studentId=g.Student_ID
WHERE g.Student_ID IS NULL


############
SELECT FIRST_NAME,LAST_NAME, salary
FROM labhr.employees
WHERE SALARY >(SELECT MAX(A.avg_salary)
FROM (SELECT AVG(SALARY) AS 'avg_salary' FROM labhr.employees GROUP BY DEPARTMENT_ID) AS A);

SELECT FIRST_NAME,LAST_NAME, salary,(SELECT MAX(A.avg_salary)
FROM (SELECT AVG(SALARY) AS avg_salary
FROM labhr.employees GROUP BY DEPARTMENT_ID) AS A)
FROM labhr.employees;

SELECT e.FIRST_NAME,e.LAST_NAME,e.salary,n.maximum
FROM labhr.employees AS e
JOIN
(SELECT MAX(A.avg_salary) AS 'maximum' FROM (SELECT AVG(SALARY) AS 'avg_salary' FROM labhr.employees GROUP BY DEPARTMENT_ID) AS A) AS n
HAVING n.maximum>AVG(SALARY)

SELECT e.FIRST_NAME,e.LAST_NAME,e.salary,n.maximum
FROM labhr.employees AS e
JOIN
(SELECT MAX(A.avg_salary) AS 'maximum' FROM (SELECT AVG(SALARY) AS 'avg_salary' FROM labhr.employees GROUP BY DEPARTMENT_ID) AS A) AS n
WHERE e.SALARY>n.maximum

#############
MAX(age) OVER(PARTITION BY state) AS max_anal_function,
MIN(studentID) OVER(PARTITION BY state) AS min_anal_function,
COUNT(*) OVER(PARTITION BY state,gender) AS count_anal_function,
COUNT(*) OVER(PARTITION BY state) AS count_anal_function2,
AVG(age) OVER(PARTITION BY capability) AS avg_anal_function
FROM lab.students;

