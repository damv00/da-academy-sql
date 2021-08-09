#3
SELECT o.OrderID,o.CustomerID,o.EmployeeID,o.OrderDate,o.ShipperID,p.ProductName,p.CategoryID,c.CategoryName
FROM orders AS o
JOIN order_details AS od
ON o.OrderID =od.OrderID
JOIN products AS p 
ON p.ProductID=od.ProductID
JOIN categories AS c
ON c.CategoryID=p.CategoryID
WHERE p.CategoryID =4 OR p.CategoryID=5
ORDER BY p.CategoryID


