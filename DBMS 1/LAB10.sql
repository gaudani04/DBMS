CREATE TABLE STUDENT_INFO(
	RNO INT,
	NAME VARCHAR(25),
	BRANCH VARCHAR(25),
	SPI DECIMAL(4,2),
	BKLOG INT
);

INSERT INTO STUDENT_INFO VALUES
(101,'RAJU','CE',8.80,0),
(102,'AMIT','CE',2.20,3),
(103,'SANJAY','ME',1.50,6),
(104,'NEHA','EC',7.65,1),
(105,'MEERA','EE',5.52,2),
(106,'MAHESH','EC',4.50,3);

SELECT*FROM STUDENT_INFO
--------------------------------------------------------PART A-----------------------------------------------------
--1. Create a view Personal with all columns. 
CREATE VIEW PERSONAL
AS
SELECT*FROM STUDENT_INFO;

SELECT* FROM PERSONAL;
--2. Create a view Student_Details having columns Name, Branch & SPI.  
CREATE VIEW STUDENT_DETAILS
AS
SELECT NAME,BRANCH,SPI
FROM STUDENT_INFO; 
SELECT* FROM STUDENT_DETAILS;

--3. Create a view AcademicData having columns RNo, Name, Branch. 
CREATE VIEW ACADEMICDATA
AS
SELECT RNO,NAME,BRANCH
FROM STUDENT_INFO; 
SELECT* FROM ACADEMICDATA;

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2. 
CREATE VIEW STUDENT_BKLOG
AS
SELECT* 
FROM STUDENT_INFO
WHERE BKLOG>2;

SELECT* FROM STUDENT_BKLOG

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four 
--letters. 

CREATE VIEW STUDENT_PATTERN
AS
SELECT RNO,NAME,BRANCH 
FROM STUDENT_INFO
WHERE NAME LIKE '____';
SELECT* FROM STUDENT_PATTERN

--6. Insert a new record to AcademicData view. (107, Meet, ME)  
INSERT INTO ACADEMICDATA
VALUES(107,'MEET','ME')
SELECT*FROM ACADEMICDATA

--7. Update the branch of Amit from CE to ME in Student_Details view. 
UPDATE STUDENT_DETAILS
SET BRANCH='ME'
WHERE NAME = 'AMIT'
SELECT * FROM STUDENT_DETAILS;

--8. Delete a student whose roll number is 104 from AcademicData view.
DELETE FROM ACADEMICDATA
WHERE RNO = 104

SELECT*FROM ACADEMICDATA


--Part � B: 
--1. Create a view that displays information of all students whose SPI is above 8.5 
CREATE VIEW ALL_INFO
AS
SELECT* FROM STUDENT_INFO
WHERE SPI>8.5
SELECT*FROM ALL_INFO

--2. Create a view that displays 0 backlog students. 
CREATE VIEW NULL_BKLOG
AS
SELECT* FROM STUDENT_INFO
WHERE BKLOG = 0;
SELECT* FROM NULL_BKLOG
--3. Create a view Computerview that displays CE branch data only.
CREATE VIEW Computerview
AS
SELECT* FROM STUDENT_INFO
WHERE BRANCH='CE'
SELECT*FROM Computerview

--Part � C: 
--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
CREATE VIEW RESULT_EC
AS
SELECT NAME,SPI 
FROM STUDENT_INFO
WHERE SPI<5 AND BRANCH='EC'

SELECT * FROM Result_EC

--2. Update the result of student MAHESH to 4.90 in Result_EC view. 
UPDATE Result_EC
SET SPI = 4.90
WHERE NAME='MAHESH'

--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with �M� and having 
--bklogs more than 5. 
CREATE VIEW Stu_Bklog
AS
SELECT RNO,NAME,BKLOG
FROM STUDENT_INFO
WHERE NAME LIKE 'M%' AND BKLOG>5

--4. Drop Computerview form the database. 
DROP VIEW Computerview;