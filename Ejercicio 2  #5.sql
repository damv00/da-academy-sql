#5
SELECT p.ProductName,p.Price,od.Quantity, (p.Price*od.Quantity) AS SubTotal
FROM order_details AS od
JOIN products AS p
ON od.ProductID=p.ProductID
ORDER BY SubTotal 
LIMIT 1
