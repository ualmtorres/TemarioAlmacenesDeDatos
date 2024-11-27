SELECT P.ProductLine, D.CalendarYear, sum(f.SalesAmount) as VentasTotales
FROM dbo.FactResellerSales F, dbo.DimProduct P, dbo.DimDate D
WHERE F.ProductKey = P.ProductKey and D.DateKey = F.ShipDateKey
GROUP BY ROLLUP(D.CalendarYear, P.ProductLine)
ORDER BY P.ProductLine, D.CalendarYear