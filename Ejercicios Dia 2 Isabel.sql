#1.A list of our US suppliers, identifying their phone area code.
SELECT SupplierName,SUBSTR(Phone,2,3) AS 'Phone area code'
FROM suppliers
WHERE country ='USA'

#2.What customer(s) have never placed an order?
SELECT c.CustomerName
FROM customers AS c
LEFT JOIN orders AS o
ON c.CustomerID=o.CustomerID
WHERE o.OrderID IS NULL

#3.In what countries do we have customers?
SELECT Country
FROM customers
GROUP BY Country

#4.What are the 5 most sold products?
SELECT p.ProductName,SUM(od.Quantity) AS 'Total Quantity sold'
FROM products AS p
		JOIN order_details AS od
		ON p.ProductID=od.ProductID
GROUP BY p.ProductID
ORDER BY SUM(od.Quantity) DESC
LIMIT 5

#5.What product(s) should our client stop offering?
SELECT p.ProductName,SUM(od.Quantity*p.Price) AS 'Revenue'
FROM products AS p
		JOIN order_details AS od
		ON p.ProductID=od.ProductID
GROUP BY p.ProductID
ORDER BY Revenue ASC
LIMIT 5





