SELECT 
    mid.database_id,
    mid.object_id,
    OBJECT_NAME(mid.object_id, mid.database_id) AS table_name,
    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns
FROM sys.dm_db_missing_index_details mid
WHERE OBJECT_NAME(mid.object_id, mid.database_id) LIKE 'Customer%' 
   OR OBJECT_NAME(mid.object_id, mid.database_id) LIKE 'Sales%'
ORDER BY mid.database_id;

--------------------------------------***************
SET STATISTICS TIME ON;

SELECT CustomerID, TerritoryID, AccountNumber
FROM Sales.Customer
WHERE TerritoryID BETWEEN 1 AND 10;

SET STATISTICS TIME OFF;
---------------------------------------**************
DROP INDEX IF EXISTS IX_Customer_TerritoryID ON Sales.Customer;
---------------------------------------***************
CREATE NONCLUSTERED INDEX IX_Customer_TerritoryID ON Sales.Customer (TerritoryID);
---------------------------------------***************
SET STATISTICS TIME ON;

SELECT CustomerID, TerritoryID, AccountNumber
FROM Sales.Customer
WHERE TerritoryID BETWEEN 1 AND 10;

SET STATISTICS TIME ON;

