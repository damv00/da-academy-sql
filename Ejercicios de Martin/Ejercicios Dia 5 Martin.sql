SELECT Student_ID,
(SELECT MIN(Grade)
FROM lab.grades) AS g
FROM lab.grades
WHERE Grades=MIN(Grades)

SELECT Student_ID
FROM lab.grades
WHERE grade=(SELECT MIN(Grade)
FROM lab.grades)


SELECT *
FROM lab.grades