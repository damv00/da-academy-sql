#6
SELECT o.OrderID,o.CustomerID,o.EmployeeID,o.OrderDate,o.ShipperID,e.FirstName,e.LastName
FROM orders AS o
JOIN employees AS e
ON o.EmployeeID = e.EmployeeID
WHERE o.EmployeeID = 1 AND o.OrderDate BETWEEN '1997-01-01' AND '1997-12-31';
