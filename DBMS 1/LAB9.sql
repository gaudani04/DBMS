CREATE TABLE Stu_Detail (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE Academic (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE Department (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

SELECT*FROM Stu_Detail;
SELECT*FROM Academic;
SELECT*FROM Department;



--Part – A: 
--1. Display details of students who are from computer department.
SELECT*FROM Stu_Detail
 WHERE DID = (SELECT DID FROM Department WHERE DNAME = 'COMPUTER')

--2. Displays name of students whose SPI is more than 8.
SELECT NAME FROM Stu_Detail
WHERE RNO IN (SELECT RNO FROM Academic WHERE SPI>8)

--3. Display details of students of computer department who belongs to Rajkot city. 
SELECT* FROM Stu_Detail 
WHERE 
	DID IN( SELECT DID FROM Department WHERE DNAME = 'COMPUTER') AND CITY='RAJKOT' 

 


--4. Find total number of students of electrical department.
SELECT COUNT(Rno) FROM Stu_Detail
WHERE DID =(SELECT DID FROM Department WHERE DNAME = 'ELECTRICAL')

--5. Display name of student who is having maximum SPI. 
SELECT NAME FROM Stu_Detail
WHERE Rno IN(SELECT TOP 1 Rno ORDER BY DESC);

--6. Display details of students having more than 1 backlog.
SELECT * FROM Stu_Detail
WHERE RNO IN(SELECT Rno FROM Academic WHERE Bklog>1)

--Part – B: 
--1. Display name of students who are either from computer department or from mechanical department. 
SELECT NAME FROM Stu_Detail
WHERE DID IN (SELECT DID FROM Department WHERE DName IN ('MECHANICAL','COMPUTER'))

--2. Display name of students who are in same department as 102 studying in.
SELECT NAME FROM Stu_Detail
WHERE DID = (SELECT DID FROM Stu_Detail WHERE Rno='102') AND Rno<>'102'

--Part – C: 
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT NAME FROM Stu_Detail
 WHERE SPI 
WHERE RNO = (SELECT RNO FROM Stu_Detail WHERE DID = 
 (SELECT DID FROM Department WHERE DName='ELECTRICAL'))
--2. Display name of student who is having second highest SPI.
SELECT NAME FROM Stu_Detail

WHERE SPI<(SELECT RNO FROM Academic SPI<MAX(SPI))
--3. Display city names whose students branch wise SPI is 9.2 