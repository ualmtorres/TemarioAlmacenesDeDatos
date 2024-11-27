SELECT p.ProductLine, t.CalendarYear, sum(f.SalesAmount) as VentasTotales
FROM dbo.FactResellerSales F, dbo.DimProduct P, dbo.DimDate T
WHERE F.ProductKey = P.ProductKey and T.DateKey = F.ShipDateKey
GROUP BY T.CalendarYear, P.ProductLine
ORDER BY P.ProductLine, T.CalendarYear