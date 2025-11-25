--Calculate Revenue
--Revenue = UnitPrice * Quantity

USE AdventureWorksDW2022

SELECT SUM(SalesAmount) as Revenue
FROM dbo.FactInternetSales;


--cost
SELECT SUM(TotalProductCost) as Cost
FROM dbo.FactInternetSales;

--profit
SELECT SUM(SalesAmount - TotalProductCost)  as Profit
FROM dbo.FactInternetSales;

--Profit Margin
USE AdventureWorksDW2022
SELECT 
SUM(SalesAmount) as Revenue,
SUM(TotalProductCost) as Cost,
SUM(SalesAmount - TotalProductCost)  as Profit,
Sum(SalesAmount -TotalProductCost) * 1.0/sum(SalesAmount) *100 as ProfitMarginPercent
FROM dbo.FactInternetSales;

create Schema vw Authorization dbo;
GO

CREATE VIEW vw.ProfitMarginTable AS 
SELECT 
    SUM(SalesAmount) AS Revenue,
    SUM(TotalProductCost) AS Cost,
    SUM(SalesAmount - TotalProductCost) AS Profit,
    (SUM(SalesAmount - TotalProductCost) * 1.0 / NULLIF(SUM(SalesAmount), 0)) * 100 
        AS ProfitMarginPercent
FROM dbo.FactInternetSales;

drop view ProfitMarginTable;