#4
SELECT p.ProductName,s.SupplierName
FROM products AS p
JOIN suppliers AS s
ON p.SupplierID=s.SupplierID
WHERE p.SupplierID=24;
