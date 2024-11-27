USE AdventureWorks2019
SELECT SalesOrderID, 
	SUM(OrderQty) AS TotalUnidadesEnPedido,
	AVG(OrderQty) AS MediaUnidadesEnPedido,
	COUNT(ProductID) AS LineasPedido
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43682, 43881)
GROUP BY SalesOrderID