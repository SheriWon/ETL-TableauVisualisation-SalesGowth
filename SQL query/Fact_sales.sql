-- Cleansed FACT_InternetSales Table --
SELECT 
  [ProductKey], 
  [OrderDateKey],
  [SalesOrderNumber] ,
  [OrderQuantity],
  [UnitPrice],
  [TotalProductCost],
  [SalesAmount] ,
  [City],
  [StateProvinceCode],
  [EnglishCountryRegionName]
FROM 
  [AdventureWorksDW2022].[dbo].[FactInternetSales] a
INNER JOIN [AdventureWorksDW2022].[dbo].[DimGeography] b
ON a.SalesTerritoryKey = b.SalesTerritoryKey                   -- To get city and country from DimGeography table
WHERE 
  LEFT(OrderDateKey, 4) >= YEAR(DATEADD(YEAR, -5, GETDATE()))  -- Ensures we always only bring two years of data from extraction.
