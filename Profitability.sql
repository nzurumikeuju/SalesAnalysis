--Calculate Revenue
--Revenue = UnitPrice * Quantity

USE AdventureWorksDW2022

SELECT SUM(SalesAmount) as Revenue
FROM dbo.FactInternetSales;