CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)
CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
	EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);

--1)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display the message "Employee record inserted", "Employee record updated", "Employee record deleted"
CREATE OR ALTER TRIGGER TR_INSERT_EMPD
ON EmployeeDetails
AFTER INSERT
AS
 BEGIN
	PRINT 'Employee record inserted'
END;
INSERT INTO EmployeeDetails VALUES(101,'ABC','9876543465','CSE',12000,'2024-12-12')
-----------UPDATE-------
CREATE OR ALTER TRIGGER TR_INSERT_EMPD
ON EmployeeDetails
AFTER UPDATE
AS
 BEGIN
	PRINT 'Employee record updated'
END;
UPDATE EmployeeDetails
SET EmployeeName = 'SIDDHI'
WHERE EmployeeName = 'ABC'

----DELETE---
CREATE OR ALTER TRIGGER TR_DELETE_EMPD
ON EmployeeDetails
AFTER DELETE
AS
 BEGIN
	PRINT 'Employee record deleted'
END;
DELETE FROM EmployeeDetails 
WHERE EmployeeName = 'SIDDHI'


--2)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations into the EmployeeLog table.
CREATE OR ALTER TRIGGER TR_INSERT_EMPLOG
ON EmployeeDetails
AFTER INSERT
AS
 BEGIN
		DECLARE @EID INT,@ENAME VARCHAR(50)
		SELECT @EID = EmployeeID FROM inserted
		SELECT @ENAME = EmployeeName FROM inserted
	INSERT INTO EmployeeLogs VALUES(@EID,@ENAME,'INSERTED',GETDATE())
END;
INSERT INTO EmployeeDetails VALUES(101,'ABC','9876543465','CSE',12000,'2024-12-12')
SELECT* FROM EmployeeLogs

---------UPDATE--------
CREATE OR ALTER TRIGGER TR_UPDATE_EMPLOG
ON EmployeeDetails
AFTER UPDATE
AS
 BEGIN
		DECLARE @EID INT,@ENAME VARCHAR(50)
		SELECT @EID = EmployeeID FROM inserted
		SELECT @ENAME = EmployeeName FROM inserted
	INSERT INTO EmployeeLogs VALUES(@EID,@ENAME,'UPDATED',GETDATE())
END;
UPDATE EmployeeDetails
SET EmployeeName = 'SIDDHI'
WHERE EmployeeName = 'ABC'
SELECT*FROM EmployeeDetails

--------DELETE------
CREATE OR ALTER TRIGGER TR_DELETE_EMPLOG
ON EmployeeDetails
AFTER DELETE
AS
 BEGIN
		DECLARE @EID INT,@ENAME VARCHAR(50)
		SELECT @EID = EmployeeID FROM deleted
		SELECT @ENAME = EmployeeName FROM deleted
	INSERT INTO EmployeeLogs VALUES(@EID,@ENAME,'DELETED',GETDATE())
END;
DELETE FROM EmployeeDetails 
WHERE EmployeeName = 'SIDDHI'
seleCT * FROM EmployeeLogs
--3)	Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees and update a bonus column in the EmployeeDetails table.
CREATE OR ALTER TRIGGER TR_BONUS
ON EmployeeDetails
AFTER INSERT
	AS
	BEGIN
	DECLARE @EID INT,@SAL DECIMAL(10,2)
	SELECT @EID = EmployeeID FROM inserted
	SELECT @SAL = Salary FROM inserted
	
		UPDATE EmployeeDetails
		SET Salary = @SAL+0.1*@SAL
		WHERE @EID = EmployeeID
	END
	INSERT INTO EmployeeDetails VALUES(100,'BIRVA','9876543465','CSE',12000,'2024-12-12')
	SELECT* FROM EmployeeDetails


--4)	Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL during an INSERT operation.
CREATE OR ALTER TRIGGER TR_date
ON EmployeeDetails
AFTER INSERT
	AS
	BEGIN
	DECLARE @DOJ DATETIME,@EID INT
	SELECT @EID = EmployeeID FROM inserted
	SELECT @DOJ = JoiningDate FROM inserted
	
		UPDATE EmployeeDetails
		SET JoiningDate = GETDATE()
		WHERE JoiningDate IS NULL
	END
	INSERT INTO EmployeeDetails VALUES(109,'MANALI','9876543465','CSE',12000,NULL)
	SELECT* FROM EmployeeDetails
--5)	Create a trigger that ensure that ContactNo is valid during insert (Like ContactNo length is 10)
CREATE OR ALTER TRIGGER TR_CONTACT_VALIDATE
ON EmployeeDetails
AFTER INSERT
	AS
	BEGIN
	DECLARE @PHONE VARCHAR(50),@EID INT
	SELECT @EID = EmployeeID FROM inserted
	SELECT @PHONE = ContactNo FROM inserted
	
		IF LEN(@PHONE)! = 10
		BEGIN
		PRINT('PHONE NO MUST BE 10 OF LENGTH')
		DELETE FROM EMPLOYEEDETAILS
		WHERE EmployeeID = @EID
		END

	END
	INSERT INTO EmployeeDetails VALUES(112,'MANALI','98765997','CSE',12000,'2024-11-3')
	SELECT* FROM EmployeeDetails



	--------------------------Instead of----------------

	CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);
CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);

--1.	Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that, log all operations performed on the Movies table into MoviesLog.
CREATE OR ALTER TRIGGER TR_MOVIE_INSERT
ON Movies
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @MID INT,@TITLE VARCHAR(225)
	SELECT @MID = MovieID FROM inserted
	SELECT @TITLE = MovieTitle FROM inserted
	INSERT INTO MoviesLog VALUES(@MID,@TITLE,'INSERTED',GETDATE())
	END
	INSERT INTO Movies VALUES(1,'THE SOCIAL NETWORK',2010,'DRAMA',4,2)
	SELECT * FROM MoviesLog
--2.	Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .
CREATE OR ALTER TRIGGER TR_MOVIE_INSERT2
ON Movies
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @MID INT,@TITLE VARCHAR(225),@RATE DECIMAL(3,1),@GENRE VARCHAR(40),@TIME INT,@YEAR INT
	SELECT @MID = MovieID FROM inserted
	SELECT @TITLE = MovieTitle FROM inserted
	SELECT @YEAR = ReleaseYear FROM inserted
	SELECT @GENRE = GENRE FROM inserted
	SELECT @RATE = Rating FROM inserted
	SELECT @TIME = Duration FROM inserted
	IF @RATE>5.5
	BEGIN
	INSERT INTO Movies VALUES(@MID,@TITLE,@YEAR,@GENRE,@RATE,@TIME)
	END
END
	INSERT INTO Movies VALUES(3,'BHOOT',2011,'HORROR',5.8,2)
	SELECT * FROM Movies
--3.	Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.
CREATE OR ALTER TRIGGER TR_MOVIE_INSERT2
ON Movies
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @MID INT,@TITLE VARCHAR(225),@RATE DECIMAL(3,1),@GENRE VARCHAR(40),@TIME INT,@YEAR INT
	SELECT @MID = MovieID FROM inserted
	SELECT @TITLE = MovieTitle FROM inserted
	SELECT @YEAR = ReleaseYear FROM inserted
	SELECT @GENRE = GENRE FROM inserted
	SELECT @RATE = Rating FROM inserted
	SELECT @TIME = Duration FROM inserted
	IF @RATE>5.5
	BEGIN
	INSERT INTO Movies VALUES(@MID,@TITLE,@YEAR,@GENRE,@RATE,@TIME)
	END
END
	INSERT INTO Movies VALUES(3,'BHOOT',2011,'HORROR',5.8,2)
	SELECT * FROM Movies
--4.	Create trigger that prevents to insert pre-release movies.
CREATE TRIGGER TR_PREVENT_PRERELEASE
ON Movies 
INSTEAD OF INSERT
AS
	BEGIN
		DECLARE @MID INT,@TITLE VARCHAR(225),@RATE DECIMAL(3,1),@GENRE VARCHAR(40),@TIME INT,@YEAR INT
	SELECT @MID = MovieID FROM inserted
	SELECT @TITLE = MovieTitle FROM inserted
	SELECT @YEAR = ReleaseYear FROM inserted
	SELECT @GENRE = GENRE FROM inserted
	SELECT @RATE = Rating FROM inserted
	SELECT @TIME = Duration FROM inserted
		IF @TITLE NOT IN(SELECT MovieTitle FROM Movies)
		BEGIN
			INSERT INTO Movies VALUES(@MID,@TITLE,@YEAR,@GENRE,@RATE,@TIME)
		END
	END
	INSERT INTO Movies VALUES(4,'The social network',2010,'Biography',6.7,1)
	INSERT INTO Movies VALUES(5,'The social network',2010,'Biography',6.7,1)
	select*from Movies



--5.	Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than 120 minutes (2 hours) to prevent unrealistic entries.
CREATE TRIGGER TR_DURATION_LIMIT 
ON Movies
INSTEAD OF UPDATE
AS
	BEGIN
		DECLARE @MID INT,@TITLE VARCHAR(225),@RATE DECIMAL(3,1),@GENRE VARCHAR(40),@TIME INT,@YEAR INT
		SELECT @MID = MovieID FROM inserted
		SELECT @TITLE = MovieTitle FROM inserted
		SELECT @YEAR = ReleaseYear FROM inserted
		SELECT @GENRE = GENRE FROM inserted
		SELECT @RATE = Rating FROM inserted
		SELECT @TIME = Duration FROM inserted
		IF @TIME<2
			BEGIN
				UPDATE Movies
				SET Duration = @TIME
				WHERE MovieID = @MID
			END
		END
UPDATE Movies
SET Duration=4
WHERE MovieID=3
SELECT*FROM Movies

