---PersonInfo---
CREATE TABLE PersonInfo ( 
PersonID INT PRIMARY KEY, 
PersonName VARCHAR(100) NOT NULL, 
Salary DECIMAL(8,2) NOT NULL, 
JoiningDate DATETIME NULL, 
City VARCHAR(100) NOT NULL, 
Age INT NULL, 
BirthDate DATETIME NOT NULL 
);



-- Creating PersonLog Table 
CREATE TABLE PersonLog ( 
PLogID INT PRIMARY KEY IDENTITY(1,1), 
PersonID INT NOT NULL, 
PersonName VARCHAR(250) NOT NULL, 
Operation VARCHAR(50) NOT NULL, 
UpdateDate DATETIME NOT NULL, 
);
DROP TABLE PersonLog

--Part – A 
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display 
--a message “Record is Affected.”  
CREATE OR ALTER TRIGGER TR_PERSONINFO
ON PersonInfo
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
	PRINT 'Record is Affected'
END
INSERT INTO PersonInfo VALUES(2,'SID',7000,'2024-04-02','AHMEDABAD',20,'2006-01-04')

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, 
--log all operations performed on the person table into PersonLog. 
CREATE OR ALTER TRIGGER TR_AFTER_INSERT_PINFO
ON PersonInfo
AFTER INSERT
AS
BEGIN
		declare @personID int,@Person_Name varchar(30)
		select @personID = PersonID from inserted
		select @Person_Name = PersonName from inserted

		Insert into PersonLog values(@personID,@Person_Name,'Inserted',GETDATE())

END
INSERT INTO PersonInfo VALUES(4,'SID',7000,'2024-04-02','AHMEDABAD',20,'2006-01-04')
select*from PersonInfo

---Update
CREATE OR ALTER TRIGGER TR_AFTER_INSERT_PINFO
ON PersonInfo
AFTER Update
AS
BEGIN
		declare @personID int,@Person_Name varchar(30)
		select @personID = PersonID from inserted
		select @Person_Name = PersonName from inserted

		Insert into PersonLog values(@personID,@Person_Name,'Updated',GETDATE())

END
Update PersonInfo
set PersonName = 'Bhoomi'
where PersonID = 1
SELECT* FROM PersonLog

---Deleted

CREATE OR ALTER TRIGGER TR_AFTER_Delete_PINFO
ON PersonInfo
AFTER delete
AS
BEGIN
		declare @personID int,@Person_Name varchar(30)
		select @personID = PersonID from deleted
		select @Person_Name = PersonName from deleted

		Insert into PersonLog values(@personID,@Person_Name,'Deleted',GETDATE())

END
delete from PersonInfo
where PersonID = 3


SELECT* FROM PersonLog
--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo 
--table. For that, log all operations performed on the person table into PersonLog.
CREATE OR ALTER TRIGGER TR_INSTEAD_INSERT
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
		declare @personID int,@Person_Name varchar(30)
		select @personID = PersonID from inserted
		select @Person_Name = PersonName from inserted

		Insert into PersonLog values(@personID,@Person_Name,'Inserted',GETDATE())

END
INSERT INTO PersonInfo VALUES(6,'Birva',44000,'2023-04-02','Rajkot',20,'2005-04-04')
select* from PersonLog
select* from PersonInfo

-----update

CREATE OR ALTER TRIGGER TR_INSTEAD_UPDATE
ON PersonInfo
INSTEAD OF UPDATE
AS
BEGIN
		declare @personID int,@Person_Name varchar(30)
		select @personID = PersonID from inserted
		select @Person_Name = PersonName from inserted

		Insert into PersonLog values(@personID,@Person_Name,'UPDATED',GETDATE())

END
Update PersonInfo
set PersonName = 'SEJAL'
where PersonID = 2
SELECT* FROM PersonLog
select* from PersonInfo

---DELETE
CREATE OR ALTER TRIGGER TR_INSTEAD_DELETE
ON PersonInfo
INSTEAD OF delete
AS
BEGIN
		declare @personID int,@Person_Name varchar(30)
		select @personID = PersonID from deleted
		select @Person_Name = PersonName from deleted

		Insert into PersonLog values(@personID,@Person_Name,'Deleted',GETDATE())

END
delete from PersonInfo
where PersonID = 1

SELECT* FROM PersonLog
--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into 
--uppercase whenever the record is inserted. 
CREATE OR ALTER TRIGGER TR_NAME_UPPER
ON PersonInfo
AFTER INSERT
AS 
BEGIN
	DECLARE @personID INT,@Person_Name VARCHAR(30)
	select @personID = PersonID from inserted
		select @Person_Name = PersonName from inserted

		Update PersonInfo
		set PersonName = UPPER(@Person_Name)
		where PersonID = @personID
END

drop trigger TR_INSTEAD_INSERT
INSERT INTO PersonInfo VALUES(12,'man',56000,'2022-04-02','Rajkot',21,'2004-04-04')
SELECT*FROM PersonInfo

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table. 
CREATE OR ALTER TRIGGER TR_PREVENT_DUP
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO PersonInfo(PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
	SELECT PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate
	FROM inserted
	WHERE PersonName NOT IN(SELECT PersonName FROM PersonInfo)
END
INSERT INTO PersonInfo VALUES(13,'man',56000,'2022-04-02','Rajkot',21,'2004-04-04')
INSERT INTO PersonInfo VALUES(14,'MON',56000,'2022-04-02','Rajkot',21,'2004-04-04')
SELECT*FROM PersonInfo
DROP TRIGGER TR_PREVENT_DUP

--6. Create trigger that prevent Age below 18 years. 
CREATE OR ALTER TRIGGER TR_PREVENT_AGE
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO PersonInfo(PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
	SELECT PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate
	FROM inserted
	WHERE AGE>18
END
INSERT INTO PersonInfo VALUES(13,'MON',56000,'2022-04-02','Rajkot',24,'2004-04-04')
INSERT INTO PersonInfo VALUES(17,'MON',56000,'2022-04-02','Rajkot',14,'2004-04-04')
DROP TRIGGER TR_PREVENT_AGE

--Part – B 
--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update 
--that age in Person table. 
CREATE OR ALTER TRIGGER TR_AGE_CALCULATE
ON PersonInfo
AFTER INSERT
AS
	BEGIN
		DECLARE @PID INT,@BDATE Datetime,@AGE INT
		SELECT @PID = PersonID,@BDATE = BirthDate,@age = AGE
		FROM INSERTED

		UPDATE PersonInfo
		SET AGE = DATEDIFF(Y,@BDATE,GETDATE())
		WHERE PersonID = @PID
		END

--8. Create a Trigger to Limit Salary Decrease by a 10%.