#4
SELECT p.ProductName,p.Price,od.Quantity
FROM order_details AS od
JOIN products AS p
ON od.ProductID=p.ProductID
ORDER BY Quantity DESC
LIMIT 5