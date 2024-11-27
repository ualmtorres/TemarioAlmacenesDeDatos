USE AdventureWorksDW2019
SELECT     SpanishProductCategoryName, SpanishProductSubcategoryName, 
                      SUM(OrderQuantity) AS UnidadesVendidas
FROM         DimProduct INNER JOIN
                      FactResellerSales ON DimProduct.ProductKey = FactResellerSales.ProductKey INNER JOIN
                      DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey INNER JOIN
                      DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
GROUP BY	SpanishProductCategoryName, SpanishProductSubcategoryName
ORDER BY    SpanishProductCategoryName, SpanishProductSubcategoryName