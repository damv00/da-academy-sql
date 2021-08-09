#2
SELECT c.CustomerID,c.CustomerName,c.ContactName,o.OrderID
FROM customers AS c
LEFT JOIN orders AS o
ON c.CustomerID=o.CustomerID
WHERE ISNULL(o.OrderID)
ORDER BY c.CustomerName;
#de cada customer revisar cuales NO han hecho una orden
#que customersid NO aparecen en ORDER.CustomerID

#quiero todos los customersID de orders que NO estan en customers

Select CustomerID from Customers
MINUS
Select CustomerID from Order