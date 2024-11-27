USE AdventureWorks2019
SELECT DISTINCT P.Name, 
	SUM(sod.LineTotal) OVER (PARTITION BY(sod.ProductID)) AS Ventas
FROM Sales.SalesOrderDetail sod inner join 
	Production.Product P on sod.ProductID = P.ProductID
ORDER BY P.Name