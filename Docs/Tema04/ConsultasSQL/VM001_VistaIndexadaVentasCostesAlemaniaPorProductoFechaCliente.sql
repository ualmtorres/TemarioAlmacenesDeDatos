USE AdventureWorksDW2019
GO

IF	OBJECT_ID('vistaVentasInternetAlemania') IS NOT NULL
	DROP VIEW vistaVentasInternetAlemania
GO

CREATE VIEW vistaVentasInternetAlemania
WITH SCHEMABINDING AS
SELECT	F.ProductKey,
		F.OrderDateKey,
		F.CustomerKey,
		SUM(ISNULL(SalesAmount, 0)) AS ventas, 
		SUM (ISNULL(TotalProductCost, 0)) AS costes,
		COUNT_BIG(*) AS count
FROM	dbo.FactInternetSales F INNER JOIN
		dbo.DimSalesTerritory ST ON F.SalesTerritoryKey = ST.SalesTerritoryKey
WHERE	SalesTerritoryCountry = 'Germany'
GROUP BY F.ProductKey,
		F.OrderDateKey,
		F.CustomerKey
GO
		
CREATE UNIQUE CLUSTERED INDEX indiceVistaVentasInternetAlemania ON
	vistaVentasInternetAlemania(ProductKey,
		OrderDateKey,
		CustomerKey)
GO