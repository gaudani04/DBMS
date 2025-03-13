-----------------------Alter Operation----------------------------------- 
--1. Add two more columns City VARCHAR (20) and Pincode INT. 
SELECT* FROM DEPOSIT;

ALTER TABLE DEPOSIT
ADD CITY VARCHAR(20),Pincode INT;

--2. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
ALTER TABLE DEPOSIT
ALTER COLUMN CNAME VARCHAR(35);

--3. Change the data type DECIMAL to INT in amount Column. 
ALTER TABLE DEPOSIT
ALTER COLUMN AMOUNT INT;

--4. Rename Column ActNo to ANO. 
EXEC SP_RENAME 'DEPOSIT.ACTNO','ANO';

--5. Delete Column City from the DEPOSIT table. 
ALTER TABLE DEPOSIT
DROP COLUMN CITY;
SELECT*FROM DEPOSIT;

--6. Change name of table DEPOSIT to DEPOSIT_DETAIL. 
EXEC SP_RENAME 'DEPOSIT','DEPOSIT_DETAIL';
SELECT*FROM DEPOSIT_DETAIL;

--Part – B: 
--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
EXEC SP_RENAME 'DEPOSIT_DETAIL.ADATE','AOPENDATE';
--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN AOPENDATE;
--3. Rename Column CNAME to CustomerName.
EXEC SP_RENAME 'DEPOSIT_DETAIL.CNAME','CustomerName';


------------------------------PART C----------------------

CREATE TABLE STUDENT_DETAIL(
	ENROLLMENT_NO VARCHAR(20),
	NAME VARCHAR(25),
	CPI DECIMAL(5,2),
	BIRTHDATE DATETIME
);
SELECT*FROM STUDENT_DETAIL;

--1.Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null). 
ALTER TABLE STUDENT_DETAIL
ADD CITY VARCHAR (20) NOT NULL,BACKLOG INT;

--2. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35). 
ALTER TABLE STUDENT_DETAIL
ALTER COLUMN NAME VARCHAR(35);

--3. Change the data type DECIMAL to INT in CPI Column. 
ALTER TABLE STUDENT_DETAIL
ALTER COLUMN CPI INT;

--4. Rename Column Enrollment_No to ENO. 
EXEC SP_RENAME 'STUDENT_DETAIL.Enrollment_No','ENO';

--5. Delete Column City from the student_detail table.
ALTER TABLE STUDENT_DETAIL
DROP COLUMN CITY;
--6. Change name of table student_detail to STUDENT_MASTER. 
EXEC SP_RENAME 'STUDENT_DETAIL','STUDENT_MASTER';
SELECT*FROM STUDENT_MASTER;

--DELETE, Truncate, Drop Operation 
-------------------------------Part – A------------------------: 

--1. Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000.
DELETE FROM DEPOSIT_DETAIL
WHERE AMOUNT>=4000;
SELECT*FROM DEPOSIT_DETAIL;

--2. Delete all the accounts CHANDI BRANCH. 
DELETE FROM DEPOSIT_DETAIL
WHERE BNAME='CHANDI';

--3. Delete all the accounts having account number (ANO) is greater than 105. 
DELETE FROM DEPOSIT_DETAIL
WHERE ANO>105;
--4. Delete all the records of Deposit_Detail table. (Use Truncate)
TRUNCATE TABLE DEPOSIT_DETAIL;

--5. Remove Deposit_Detail table. (Use Drop)
DROP TABLE Deposit_Detail;


----------------------PART B--------------------------

CREATE TABLE EMPLOYEE_MASTER(
	EMPNO INT,
	EMPNAME VARCHAR(25),
	JOININGDATE DATETIME,
	SALARY DECIMAL(8,2),
	CITY VARCHAR(20)
);
SELECT*FROM EMPLOYEE_MASTER;


