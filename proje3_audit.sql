USE AdventureWorks2022;
SELECT * FROM HumanResources.EmployeeDepartmentHistory WHERE DepartmentID = 1;


SELECT *
FROM sys.fn_get_audit_file('C:\AuditLogs\*.sqlaudit', NULL, NULL);
