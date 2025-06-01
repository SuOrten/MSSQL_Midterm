SELECT name, state_desc FROM sys.databases WHERE name = 'AdventureWorksClean';
-- Çýktý: RESTORING

SELECT name, state_desc FROM sys.databases WHERE name = 'AdventureWorksClean';

ALTER DATABASE AdventureWorksClean SET QUERY_STORE = OFF;

USE master;
DROP DATABASE IF EXISTS AdventureWorksClean;

ALTER DATABASE AdventureWorksClean SET PARTNER OFF;



USE master;
DROP DATABASE IF EXISTS AdventureWorksClean;



-- Mirror DB'yi yükle
RESTORE DATABASE AdventureWorksClean
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2\MSSQL\Backup\AWC_Mirror.bak'
WITH 
    MOVE 'AdventureWorksClean' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2\MSSQL\DATA\AdventureWorksClean_Mirror.mdf',
    MOVE 'AdventureWorksClean_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2\MSSQL\DATA\AdventureWorksClean_Mirror_log.ldf',
    NORECOVERY;

-- Ardýndan log'u uygula
RESTORE LOG AdventureWorksClean
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2\MSSQL\Backup\AWC_Mirror.trn'
WITH NORECOVERY;


SELECT 
    e.name AS endpoint_name,
    e.state_desc,
    t.port,
    e.type_desc
FROM sys.endpoints AS e
JOIN sys.tcp_endpoints AS t ON e.endpoint_id = t.endpoint_id
WHERE e.type_desc = 'DATABASE_MIRRORING';

