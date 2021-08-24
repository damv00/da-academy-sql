#1.What products do we sell the most of and how much do we charge for them?
SELECT p.ProductName,p.Price,SUM(od.Quantity) AS 'Total_Quantity'
FROM order_details AS od
		JOIN products AS p
		ON od.ProductID=p.ProductID
GROUP BY od.ProductID
ORDER BY Total_Quantuty DESC
LIMIT 5

#2.Which products brings us the most revenue? (Excluding “Alice Mutton” because they are going out of business.)
SELECT p.ProductName,p.Price,SUM(od.Quantity) AS 'Total_Quantity',(SUM(od.Quantity)*p.Price) AS 'Revenue'
FROM order_details AS od
		JOIN products AS p
		ON od.ProductID=p.ProductID
WHERE p.ProductName <> 'Alice Mutton'
GROUP BY od.ProductID
ORDER BY Revenue DESC
LIMIT 5

#3.What is our Annual Total Revenue?
SELECT p.ProductName,p.Price,SUM(od.Quantity) AS 'Total_Quantity',(SUM(od.Quantity)*p.Price) AS 'Revenue',((SUM(od.Quantity)*p.Price)*12) AS 'Annual Revenue'
FROM order_details AS od
		JOIN products AS p
		ON od.ProductID=p.ProductID
GROUP BY od.ProductID
ORDER BY Revenue DESC

#4.Who is the shipper that delivers most of our customers' orders?
SELECT s.ShipperName,SUM(o.ShipperID) AS 'Total_orders'
FROM order_details AS od
		JOIN orders AS o
		ON od.OrderID=o.OrderID
		JOIN shippers AS s
		ON o.ShipperID=s.ShipperID
GROUP BY o.ShipperID
ORDER BY Total_orders DESC
LIMIT 1

#5.Do we have customers that only request orders for one category of products?
SELECT c.CustomerName,p.ProductID,COUNT(*) AS 'Contador'
FROM customers AS c
		JOIN orders AS o
		ON c.CustomerID=o.CustomerID
		JOIN order_details AS od
		ON o.OrderID=od.OrderID
		JOIN products AS p
		ON od.ProductID=p.ProductID
GROUP BY c.CustomerName
HAVING Contador=1

