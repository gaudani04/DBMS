----------------Part – A--------------
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures. 

--DEPT INSERT
CREATE OR ALTER PROCEDURE PR_INSERTDEPT
@DEPTID INT,
@DEPTNAME VARCHAR(50)
AS
	BEGIN
		INSERT INTO DEPARTMENT(DepartmentID,DepartmentName) 
		VALUES(@DEPTID,@DEPTNAME)
	END;
EXEC PR_INSERTDEPT 1,'ADMIN'
EXEC PR_INSERTDEPT 2,'IT'
EXEC PR_INSERTDEPT 3,'HR'
EXEC PR_INSERTDEPT 4,'ACCOUNT'
SELECT* FROM DEPARTMENT;


--Designation INSERT
CREATE OR ALTER PROCEDURE PR_INSERTDESIG
@DesignationID INT,
@DesignationNAME VARCHAR(50)
AS
	BEGIN
		INSERT INTO DESIGNATION(DesignationID,DesignationName) 
		VALUES(@DesignationID,@DesignationNAME)
	END;

EXEC PR_INSERTDESIG 11,'JOBBER'
EXEC PR_INSERTDESIG 12,'WELDER'
EXEC PR_INSERTDESIG 13,'CLERK'
EXEC PR_INSERTDESIG 14,'MANAGER'
EXEC PR_INSERTDESIG 15,'CEO'

SELECT* FROM DESIGNATION;


----PERSON INSERT----
CREATE OR ALTER PROCEDURE PR_INSERT_PERSON
@FirstName VARCHAR(100),
@LastName VARCHAR(100),
@Salary DECIMAL(8,2),
@JoiningDate DATETIME,
@DepartmentID INT,
@DesignationID INT
AS
	BEGIN
		INSERT INTO PERSON(FirstName,LastName,Salary,JoiningDate,DepartmentID,DesignationID) 
		VALUES(@FirstName,@LastName,@Salary,@JoiningDate,@DepartmentID,@DesignationID)
	END;

EXEC PR_INSERT_PERSON 'RAHUL','ANSU',56000,'1990-01-01',1,12
EXEC PR_INSERT_PERSON 'HARDIK','HINSU',18000,'1990-09-25',2,11
EXEC PR_INSERT_PERSON 'BHAVIN','KAMANI',25000,'1991-05-14 ',NULL,11
EXEC PR_INSERT_PERSON 'BHOOMI','PATEL',39000,'2014-02-20 ',1,13
EXEC PR_INSERT_PERSON 'ROHIT','RAJGOR',17000,'1990-07-23',2,15
EXEC PR_INSERT_PERSON 'PRIYA','MEHTA',25000,'1990-10-18 ',2,NULL
EXEC PR_INSERT_PERSON 'NEHA','TRIVEDI',18000,'2014-02-20 ',3,15

SELECT*FROM PERSON
 
-------UPDATE DEPARTMENT------

CREATE OR ALTER PROCEDURE PR_UPDATE_DEPT
@DEPTID INT,
@DEPTNAME VARCHAR(50)
AS
	BEGIN
		UPDATE DEPARTMENT 
		SET DepartmentID=@DEPTID,DepartmentName=@DEPTNAME
		WHERE DepartmentID = @DEPTID
		
	END
	EXEC PR_UPDATE_DEPT 2,'CSE';
	EXEC PR_UPDATE_DEPT 2,'IT';

SELECT* FROM DEPARTMENT;


-------UPDATE DESIGNATION------

CREATE OR ALTER PROCEDURE PR_UPDATE_DESIGNATION
@DesignationID INT,
@DesignationName VARCHAR(50)
AS
	BEGIN
		UPDATE DESIGNATION 
		SET DesignationID=@DesignationID,DesignationName=@DesignationName
		WHERE DesignationID = @DesignationID
		
	END
	EXEC PR_UPDATE_DESIGNATION 15,'TEACHER';
	EXEC PR_UPDATE_DESIGNATION 15,'CEO';

SELECT* FROM DESIGNATION;


-------UPDATE PERSON------

CREATE OR ALTER PROCEDURE PR_UPDATE_PERSON
@PersonID INT,
@FirstName VARCHAR(100),
@LastName VARCHAR(100),
@Salary DECIMAL(8, 2),
@JoiningDate DATETIME,
@DepartmentID INT,
@DesignationID INT

AS
	BEGIN
		UPDATE PERSON 
		SET 
			FirstName=@FirstName,
			LastName=@LastName,
			Salary=@Salary,
			JoiningDate=@JoiningDate,
			DepartmentID=@DepartmentID,
			DesignationID=@DesignationID

		WHERE PersonID = @PersonID
		
	END
	EXEC PR_UPDATE_PERSON 101,'RAM','ANSU',40000,'1990-01-01',1,12;
	EXEC PR_UPDATE_PERSON 101,'RAHUL','ANSU',56000,'1990-01-01',1,12;

SELECT* FROM PERSON;


-------DELETE DEPARTMENT----------

CREATE OR ALTER PROCEDURE PR_DELETE_DEPT
@DEPTID INT
AS
	BEGIN
		DELETE FROM DEPARTMENT
		WHERE DepartmentID = @DEPTID
	END;

EXEC PR_DELETE_DEPT 1;

--Designation DELETE
CREATE OR ALTER PROCEDURE PR_DELETE_DESIGNATION
@DesignationID INT
AS
	BEGIN
		DELETE FROM DESIGNATION
		WHERE DesignationID = @DesignationID
	END;


---DELETE PERSON----
CREATE OR ALTER PROCEDURE PR_DELETE_PERSON
@PERSONID INT
AS
	BEGIN
		DELETE FROM PERSON
		WHERE PERSONID = @PERSONID
	END;

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY 
---Department---
CREATE OR ALTER PROCEDURE PR_SELECTBY_PRKEY_DEPARTMENT
@DEPARTMENTID INT
AS
	BEGIN
		SELECT * FROM DEPARTMENT
		WHERE DepartmentID = @DEPARTMENTID
	END;
EXEC PR_SELECTBY_PRKEY_DEPARTMENT 1;
EXEC PR_SELECTBY_PRKEY_DEPARTMENT 4;
EXEC PR_SELECTBY_PRKEY_DEPARTMENT 2;


----Designation----

CREATE OR ALTER PROCEDURE PR_SELECTBY_PRKEY_DESIGNATION
@DESIGNATIONID INT
AS
	BEGIN
		SELECT * FROM DESIGNATION
		WHERE DesignationID = @DESIGNATIONID
	END;
EXEC PR_SELECTBY_PRKEY_DESIGNATION 11;


-----person-------

CREATE OR ALTER PROCEDURE PR_SELECTBY_PRKEY_PERSON
@PID INT
AS
	BEGIN
		SELECT * FROM PERSON
		WHERE PersonID = @PID
	END;
EXEC PR_SELECTBY_PRKEY_PERSON 101;

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take 
--columns on select list)
CREATE OR ALTER PROCEDURE PR_SELECTALL_DEPARTMENT
AS
	BEGIN
		SELECT * FROM DEPARTMENT
	END;
	EXEC PR_SELECTALL_DEPARTMENT


CREATE OR ALTER PROCEDURE PR_SELECTALL_DESIGNATION
AS
	BEGIN
		SELECT * FROM DESIGNATION
	END;
	EXEC PR_SELECTALL_DESIGNATION


CREATE OR ALTER PROCEDURE PR_SELECTALL_PERSON
AS
	BEGIN
		SELECT P.*,D.DepartmentName,DE.DesignationName FROM PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		JOIN DESIGNATION DE
		ON DE.DesignationID = P.DesignationID
	END;
	EXEC PR_SELECTALL_PERSON;

	--4. Create a Procedure that shows details of the first 3 persons. 
	CREATE OR ALTER PROCEDURE PR_TOP3_PERSON
	AS
	BEGIN
		SELECT TOP 3* FROM PERSON
	END;
	EXEC PR_TOP3_PERSON;

--	Part – B 
--5. Create a Procedure that takes the department name as input and returns a table with all workers 
--working in that department.
CREATE OR ALTER PROCEDURE PR_WORKERS
@DEPTNAME VARCHAR(50)
AS
	BEGIN
		SELECT P.FIRSTNAME AS FIRSTNAME,P.LASTNAME AS LASTNAME,D.DepartmentName
		FROM PERSON P
		JOIN
		DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		WHERE D.DepartmentName = @DEPTNAME
	END
EXEC PR_WORKERS 'IT'
		
--6. Create Procedure that takes department name & designation name as input and returns a table with 
--worker’s first name, salary, joining date & department name.
CREATE OR ALTER PROCEDURE PR_WORKERS_DETAILS
@DEPTNAME VARCHAR(50),
@DESIGNAME VARCHAR(50)
AS
	BEGIN
		SELECT P.FIRSTNAME AS FIRSTNAME,P.SALARY AS SALARY,P.JoiningDate AS JOINING_DATE,D.DepartmentName
		FROM PERSON P
		JOIN
		DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		JOIN
		DESIGNATION DE
		ON DE.DesignationID = P.DesignationID
		WHERE D.DepartmentName = @DEPTNAME and DE.DesignationName = @DESIGNAME

	END
	exec PR_WORKERS_DETAILS 'ADMIN','WELDER'
	exec PR_WORKERS_DETAILS 'IT','JOBBER'

--7. Create a Procedure that takes the first name as an input parameter and display all the details of the 
--worker with their department & designation name.
CREATE OR ALTER PROCEDURE PR_WORKERS
@FNAME VARCHAR(50)
AS
	BEGIN
		SELECT P.*,D.DepartmentName,DE.DesignationName
		FROM PERSON P
		JOIN
		DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		JOIN
		DESIGNATION DE
		ON DE.DesignationID = P.DesignationID
		WHERE P.FirstName = @FNAME 
	END
	EXEC PR_WORKERS 'BHOOMI'

--8. Create Procedure which displays department wise maximum, minimum & total salaries.
CREATE OR ALTER PROCEDURE PR_DEPTWISE_MAX_MIN_TOTAL
AS 
	BEGIN
		SELECT MAX(P.SALARY) AS MAXIMUM ,MIN(P.SALARY) AS MINIMUM ,SUM(P.SALARY) AS TOTAL,D.DepartmentName
		FROM PERSON P
		JOIN DEPARTMENT D 
		ON P.DepartmentID = D.DepartmentID
		GROUP BY D.DepartmentName
	END
	EXEC PR_DEPTWISE_MAX_MIN_TOTAL

--9. Create Procedure which displays designation wise average & total salaries.
CREATE OR ALTER PROCEDURE PR_DESIGNATION_AVG_TOTAL
AS 
	BEGIN
		SELECT D.DesignationName,AVG(P.SALARY) AS AVERAGE,SUM(P.SALARY) AS TOTAL
		FROM PERSON P
		JOIN DESIGNATION D 
		ON P.DesignationID = D.DesignationID
		GROUP BY D.DesignationName
	END

EXEC PR_DESIGNATION_AVG_TOTAL

--Part – C 
--10. Create Procedure that Accepts Department Name and Returns Person Count.
CREATE OR ALTER PROCEDURE PR_DEPT_PERSON_CNT
@DEPTNAME VARCHAR(50)
AS 
	BEGIN
		SELECT COUNT(P.DepartmentID) FROM 
		PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		WHERE D.DepartmentName = @DEPTNAME
		GROUP  BY P.DepartmentID
	END
	EXEC PR_DEPT_PERSON_CNT 'ADMIN'
	EXEC PR_DEPT_PERSON_CNT 'HR'
	EXEC PR_DEPT_PERSON_CNT 'ACCOUNT'
--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than 
--input salary value along with their department and designation details. 
CREATE OR ALTER PROCEDURE PR_GREATER_SALARY
@SALARY INT
AS
	BEGIN
		SELECT P.*,D.DepartmentName,DE.designationName
		FROM PERSON P
		JOIN DEPARTMENT D
		ON D.DepartmentID = P.DepartmentID
		JOIN DESIGNATION DE
		ON P.DesignationID = DE.DesignationID
		WHERE P.Salary>@SALARY
	END;
	EXEC PR_GREATER_SALARY 50000;



--12. Create a procedure to find the department(s) with the highest total salary among all departments. 
CREATE OR ALTER PROCEDURE PR_HIGHEST_TOTAL_SALARY
AS
	BEGIN
		SELECT TOP 1 D.DepartmentName,SUM(P.SALARY) AS TOTAL
		FROM PERSON P
		JOIN DEPARTMENT D
		ON D.DepartmentID = P.DepartmentID
		GROUP BY D.DepartmentName
		ORDER BY TOTAL DESC
	END;
	EXEC PR_HIGHEST_TOTAL_SALARY

--13. Create a procedure that takes a designation name as input and returns a list of all workers under that 
--designation who joined within the last 10 years, along with their department. 
CREATE OR ALTER PROCEDURE PR_LIST_OF_WORKERS
@DENAME VARCHAR(50)
AS
	BEGIN
		SELECT P.*,DE.DesignationName,D.DepartmentName
		from PERSON P
		join DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		JOIN DESIGNATION DE
		ON DE.DesignationID = P.DesignationID
		WHERE DATEDIFF(YEAR,GETDATE(),P.JoiningDate)<=10 
		AND DE.DesignationName = @DENAME
	END;
	EXEC PR_LIST_OF_WORKERS 'JOBBER'
	EXEC PR_LIST_OF_WORKERS 'WELDER'
	EXEC PR_LIST_OF_WORKERS 'MANAGER'

--14. Create a procedure to list the number of workers in each department who do not have a designation 
--assigned. 
CREATE OR ALTER PROCEDURE PR_DONOT_HAVE_DESIGNATION
AS
	BEGIN
		SELECT D.DepartmentName, COUNT(*)
		FROM PERSON P
		JOIN 
		DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		WHERE P.DesignationID IS NULL
		GROUP BY D.DepartmentName
	END
	EXEC PR_DONOT_HAVE_DESIGNATION

--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 
--12000
CREATE OR ALTER PROCEDURE PR_AVG_SAL_ABOVE_12K
AS 
	BEGIN
		SELECT * FROM PERSON
		WHERE DepartmentID IN (
			SELECT D.DepartmentID FROM DEPARTMENT D
			JOIN PERSON P
			ON P.DepartmentID = D.DepartmentID
			GROUP BY D.DepartmentID
			HAVING AVG(P.SALARY)>12000)
	END
EXEC PR_AVG_SAL_ABOVE_12K;


