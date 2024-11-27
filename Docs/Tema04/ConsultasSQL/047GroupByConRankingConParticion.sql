USE AdventureWorksDW2019
SELECT     SpanishProductCategoryName, SpanishProductSubcategoryName, 
			SUM(OrderQuantity) AS UnidadesVendidas,
            RANK() OVER (PARTITION BY SpanishProductCategoryName
							ORDER BY SUM(OrderQuantity) DESC) AS RankingParcial						
FROM         DimProduct INNER JOIN
                      FactResellerSales ON DimProduct.ProductKey = FactResellerSales.ProductKey INNER JOIN
                      DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey INNER JOIN
                      DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
GROUP BY	SpanishProductCategoryName, SpanishProductSubcategoryName
ORDER BY SpanishProductCategoryName, RankingParcial