SELECT 
(CASE GROUPING(P.ProductLine) WHEN 1 THEN 'Todos los productos' ELSE ISNULL(P.ProductLine, 'ND') END) AS ProductLine, 
(CASE GROUPING(D.CalendarYear) WHEN 1 THEN 'Todos los años' ELSE ISNULL(D.CalendarYear, 'ND') END) AS CalendarYear,
SUM(F.SalesAmount) AS TotalVentas
FROM dbo.FactResellerSales F, dbo.DimProduct P, dbo.DimDate D
WHERE F.ProductKey = P.ProductKey and D.DateKey = F.ShipDateKey
GROUP BY ROLLUP(D.CalendarYear, P.ProductLine)
ORDER BY D.CalendarYear, P.ProductLine