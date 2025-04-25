
CREATE LOGIN ReadOnlyUser WITH PASSWORD = 'Helloiamhere';


USE AdventureWorks2022;
CREATE USER ReadOnlyUser FOR LOGIN ReadOnlyUser;



GRANT SELECT ON Person.EmailAddress TO ReadOnlyUser;


EXECUTE AS USER = 'ReadOnlyUser';


SELECT TOP 5 * FROM Person.EmailAddress;


UPDATE Person.EmailAddress
SET EmailAddress = 'fail@test.com'
WHERE BusinessEntityID = 1;


REVERT;


USE AdventureWorks2022;
DROP USER ReadOnlyUser;

DROP LOGIN ReadOnlyUser;
