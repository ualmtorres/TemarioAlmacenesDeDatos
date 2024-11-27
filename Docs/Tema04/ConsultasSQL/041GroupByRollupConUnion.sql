SELECT P.ProductLine, D.CalendarYear, sum(f.SalesAmount) as VentasTotales
FROM dbo.FactResellerSales F, dbo.DimProduct P, dbo.DimDate D
WHERE F.ProductKey = P.ProductKey and D.DateKey = F.ShipDateKey
GROUP BY P.ProductLine, D.CalendarYear
UNION
SELECT P.ProductLine, NULL AS D, sum(f.SalesAmount) as VentasTotales
FROM dbo.FactResellerSales F, dbo.DimProduct P, dbo.DimDate D
WHERE F.ProductKey = P.ProductKey and D.DateKey = F.ShipDateKey
GROUP BY P.ProductLine
UNION
SELECT NULL AS P, NULL AS D, sum(f.SalesAmount) as VentasTotales
FROM dbo.FactResellerSales F, dbo.DimProduct P, dbo.DimDate D
WHERE F.ProductKey = P.ProductKey and D.DateKey = F.ShipDateKey
ORDER BY P.ProductLine, D.CalendarYear
