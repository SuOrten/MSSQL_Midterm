USE master;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'abc123!';

CREATE CERTIFICATE TDECert
WITH SUBJECT = 'TDE Certificate for AdventureWorks2022';


USE AdventureWorks2022;
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE TDECert;


ALTER DATABASE AdventureWorks2022 SET ENCRYPTION ON;


SELECT name, is_encrypted
FROM sys.databases
WHERE name = 'AdventureWorks2022';


-------------Not working
BACKUP CERTIFICATE TDECert
TO FILE = 'C:\Backups\TDECert.cer'
WITH PRIVATE KEY (
    FILE = 'C:\Backups\TDECert_PrivateKey.pvk',
    ENCRYPTION BY PASSWORD = 'BackupKeyPassword!'
);

USE master;
GO

-- Sertifika mevcut mu kontrol et
SELECT name FROM sys.certificates WHERE name = 'TDECert';

SELECT IS_SRVROLEMEMBER('sysadmin');

