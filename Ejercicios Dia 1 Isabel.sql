#1.An alphabetical list of customers located in Mexico
USE lab
SELECT CustomerName
FROM customers
WHERE COUNTRY='Mexico'
ORDER BY CustomerName

#2.A list of employees from youngest to oldest
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee´s Names'
FROM employees
ORDER BY BirthDate DESC

#3.A list of orders that included “Dairy Products” and “Grains/Cereals”
SELECT *
FROM orders
WHERE CustomerID IN 
		(SELECT CategoryID
		FROM categories
		WHERE CategoryName IN ('Dairy Products','Grains/Cereals'))
		
#4. What products are supplied by “G'day, Mate”?
SELECT p.ProductName
FROM products AS p
WHERE SupplierID=
		(SELECT SupplierID
		FROM suppliers
		WHERE SupplierName="G'day, Mate");
		
SELECT p.ProductName
FROM products AS p
JOIN suppliers AS s
ON p.SupplierID=s.SupplierID
WHERE p.SupplierID=24

#5.What shippers have delivered our orders per country?
SELECT s.ShipperName,c.Country
FROM customers AS c
		JOIN orders AS o
		ON c.CustomerID=o.CustomerID
		JOIN shippers AS s
		ON s.ShipperID=o.ShipperID
GROUP BY c.Country,s.ShipperName
ORDER BY c.Country

#6.The list of orders managed by Nancy Davolio during 1997
SELECT *
FROM orders 
WHERE EmployeeID=
		(SELECT EmployeeID
		FROM employees
		WHERE LastName='Davolio' AND FirstName='Nancy');
		
SELECT o.*
FROM orders AS o
		JOIN employees AS e
		ON o.EmployeeID=e.EmployeeID
WHERE o.EmployeeID=1







