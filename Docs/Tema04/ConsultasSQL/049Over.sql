USE AdventureWorks2019
SELECT SalesOrderID, ProductID, OrderQty,
	SUM(OrderQty) OVER(PARTITION BY SalesOrderID) AS TotalUnidadesEnPedido,
	AVG(OrderQty) OVER(PARTITION BY SalesOrderID) AS MediaUnidadesEnPedido,
	COUNT(ProductID) OVER(PARTITION BY SalesOrderID) AS LineasPedido
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN(43682, 43881)