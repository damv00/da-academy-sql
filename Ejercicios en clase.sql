
DROP TABLE lab.students;

CREATE TABLE lab.students(
studentId INTEGER ,
firstName VARCHAR(40),
lastName VARCHAR(40),
state VARCHAR(40),
age INTEGER,
gender CHAR(1),
capability VARCHAR(40)
);

INSERT INTO lab.students VALUES (1,'Edson' , 'Cortes', 'Nuevo Leon', 24, 'M','D&A');
INSERT INTO lab.students VALUES (2, 'Antonio', 'Cisneros', 'Yucatán', 22,'M', 'D&A');
INSERT INTO lab.students VALUES (3,'David','Murguia','Nuevo Leon',21,'M','D&A');
INSERT INTO lab.students VALUES (4,'Violeta' , 'Hernandez', 'Coah', 27, 'F','D&A');
INSERT INTO lab.students VALUES (5, 'Magda', 'Gonzalez', 'Nuevo Leon', 35, 'F', 'D&A');
INSERT INTO lab.students VALUES (6,'Jesus', 'Castañeda','Tabasco',25, 'M','D&A');
 
SELECT *
FROM students
WHERE state='Nuevo Leon';

SELECT DISTINCT state
FROM students;

CREATE TABLE Grades (
	Class_Name VARCHAR(30),
	Student_ID INTEGER,
	Grade INTEGER);
	

INSERT INTO lab.grades VALUES('SQL',1 , 10);
INSERT INTO lab.grades VALUES('SQL',2 , 9);
INSERT INTO lab.grades VALUES('SQL',3 , 8);
INSERT INTO lab.grades VALUES('SQL',4 , 10);
INSERT INTO lab.grades VALUES('SQL',5 , 9);

SELECT * FROM lab.grades;

SELECT s.firstName,s.lastName,g.Class_Name,g.Grade
FROM students AS s
JOIN Grades AS g 
ON s.studentId=g.Student_ID
WHERE g.Grade=10
ORDER BY Grade DESC,firstName;

SELECT s.firstName,s.lastName,g.Class_Name,g.Grade
FROM students AS s
LEFT JOIN Grades AS g 
ON s.studentId=g.Student_ID
ORDER BY Grade DESC,firstName;

SELECT firstName,lastName,gender,
CASE 
	WHEN gender ='M' THEN 'Male'
	WHEN gender ='F' THEN 'Female'
	ELSE 'Not Available'
END AS Gender_extended
FROM students
ORDER BY firstName;

SELECT firstName,lastName,gender,
CASE
	WHEN age BETWEEN 0 AND 21 THEN 'Gen Z' 
	WHEN age BETWEEN 22 AND 25 THEN 'Millenial'
	WHEN age>=26 THEN 'Baby Boomer'
	ELSE 'Not available'
END 'Generation'
FROM students
ORDER BY age;


SELECT firstName,lastName,gender,
CASE
	WHEN age>=0 AND age<=21 THEN 'Gen Z' 
	WHEN age>=22 AND age<=25 THEN 'Millenial'
	WHEN age>=26 THEN 'Baby Boomer'
	ELSE 'Not available'
END 'Generation'
FROM students
ORDER BY age;


SELECT *
FROM grades;

SELECT s.firstName,s.lastName
FROM students AS s
LEFT JOIN grades AS g
ON s.studentId=g.Student_ID
WHERE ISNULL(g.Grade);

SELECT A.firstName,A.lastName,B.fistName AS 'PeopleLead'
FROM lab.students AS A
INNER JOIN lab.students AS B
ON B.peopleLeadID=A.studentID;

SELECT state,COUNT(*)
FROM students
GROUP BY state;

SELECT state,COUNT(*) AS Quantity
FROM students
GROUP BY state
HAVING Quantity>1;

