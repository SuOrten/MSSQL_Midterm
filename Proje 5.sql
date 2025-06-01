SELECT BusinessEntityID, PhoneNumber
FROM Person.PersonPhone
WHERE LEN(PhoneNumber) < 7;

UPDATE Person.PersonPhone
SET PhoneNumber = 'EksikNumara'
WHERE LEN(PhoneNumber) < 7;


SELECT BusinessEntityID, EmailAddress
FROM Person.EmailAddress
WHERE EmailAddress <> LOWER(EmailAddress);

UPDATE Person.EmailAddress
SET EmailAddress = LOWER(EmailAddress)
WHERE EmailAddress <> LOWER(EmailAddress);

CREATE DATABASE CleanDataDB;

CREATE TABLE CleanedEmailAddress (
    BusinessEntityID INT PRIMARY KEY,
    EmailAddress NVARCHAR(50)
);

INSERT INTO CleanDataDB.dbo.CleanedEmailAddress (BusinessEntityID, EmailAddress)
SELECT BusinessEntityID, LOWER(EmailAddress)
FROM AdventureWorks2022.Person.EmailAddress;
