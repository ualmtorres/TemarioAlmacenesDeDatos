USE AdventureWorks2019
GO

IF	OBJECT_ID('VISTAINDEXADA') IS NOT NULL
	DROP VIEW VISTAINDEXADA
GO
		
CREATE VIEW VISTAINDEXADA 
WITH SCHEMABINDING AS 
select p.Name,
	SUM(sod.LineTotal) AS Ventas,
	COUNT_BIG(*) AS Count
from Sales.SalesOrderDetail sod inner join 
	Production.Product p on sod.ProductID = p.ProductID
GROUP BY p.Name
GO

IF EXISTS (
	SELECT	*
	FROM	sys.indexes
	WHERE	object_id = OBJECT_ID('VistaIndexada')
	)
	DROP INDEX INDICECLUSTERED ON VISTAINDEXADA
GO

CREATE UNIQUE CLUSTERED INDEX INDICECLUSTERED ON VISTAINDEXADA(Name)
go