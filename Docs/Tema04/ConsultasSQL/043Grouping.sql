SELECT P.ProductLine, D.CalendarYear, sum(F.SalesAmount), 
GROUPING(P.ProductLine) AS P, GROUPING(D.CalendarYear) as A
FROM dbo.FactResellerSales F, dbo.DimProduct P, dbo.DimDate D
WHERE F.Productkey = P.ProductKey and D.DateKey = F.ShipDateKey
GROUP BY ROLLUP(D.CalendarYear, P.ProductLine)
ORDER BY D.CalendarYear, P.ProductLine