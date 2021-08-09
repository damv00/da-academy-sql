#5
SELECT OrderID,ShipperName,Country
FROM orders
JOIN customers ON customers.CustomerID = orders.CustomerID
JOIN shippers ON shippers.ShipperID = orders.ShipperID
ORDER BY customers.Country;
