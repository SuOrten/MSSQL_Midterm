DECLARE @userInput NVARCHAR(100) = '1 OR 1=1 --';


DECLARE @sql NVARCHAR(MAX);
SET @sql = 'SELECT * FROM HumanResources.EmployeeDepartmentHistory WHERE DepartmentID = ' + @userInput;


EXEC(@sql);



DECLARE @safeInput NVARCHAR(100) = '1 OR 1=1 --';


EXEC sp_executesql
    N'SELECT * FROM HumanResources.EmployeeDepartmentHistory WHERE DepartmentID = @deptId',
    N'@deptId NVARCHAR(100)',
    @safeInput;