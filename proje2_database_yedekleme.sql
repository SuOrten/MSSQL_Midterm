--FULL recovery mode
ALTER DATABASE AdventureWorks2022 SET RECOVERY FULL;


--Transaction Log Backup
BACKUP LOG AdventureWorks2022
TO DISK = 'C:\Backups\AdventureWorks2022_Log.trn'
WITH NAME = 'Transaction Log Backup of AdventureWorks2022';


