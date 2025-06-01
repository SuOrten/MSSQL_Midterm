USE AdventureWorks2022;
GO

CREATE TABLE SchemaChangeLog (
    ChangeID INT IDENTITY(1,1) PRIMARY KEY,
    ChangeTime DATETIME DEFAULT GETDATE(),
    EventType NVARCHAR(100),
    ObjectName NVARCHAR(100),
    Command NVARCHAR(MAX),
    LoginName NVARCHAR(100)
);

CREATE TRIGGER trg_SchemaChange
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    INSERT INTO AdventureWorks2022.dbo.SchemaChangeLog (EventType, ObjectName, Command, LoginName)
    SELECT 
        EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)'),
        EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(100)'),
        EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'),
        SYSTEM_USER;
END;

CREATE TABLE TestSürüm (
    ID INT PRIMARY KEY,
    Notlar NVARCHAR(100)
);

SELECT * FROM AdventureWorks2022.dbo.SchemaChangeLog;
