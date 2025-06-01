BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL\MSSQL\Backup\AW_FullBackup_Job.bak'
WITH INIT, NAME = 'AdventureWorks2022 Otomatik Yedekleme';

USE AdventureWorks2022;
GO

CREATE TABLE BackupLog (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    BackupTime DATETIME DEFAULT GETDATE(),
    DatabaseName NVARCHAR(100),
    BackupPath NVARCHAR(255),
    Status NVARCHAR(20)
);

BEGIN TRY
    BACKUP DATABASE AdventureWorks2022
    TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL\MSSQL\Backup\AW_FullBackup_Scripted.bak'
    WITH INIT;

    INSERT INTO BackupLog (DatabaseName, BackupPath, Status)
    VALUES (
        'AdventureWorks2022',
        'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL\MSSQL\Backup\AW_FullBackup_Scripted.bak',
        'Success'
    );
END TRY
BEGIN CATCH
    INSERT INTO BackupLog (DatabaseName, BackupPath, Status)
    VALUES (
        'AdventureWorks2022',
        'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLEVAL\MSSQL\Backup\AW_FullBackup_Scripted.bak',
        'Failed'
    );
END CATCH;


SELECT * FROM BackupLog ORDER BY BackupTime DESC;

