CREATE TABLE STU_INFO(
	RNO INT,
	NAME VARCHAR(20),
	BRANCH VARCHAR(20)
);
INSERT INTO STU_INFO VALUES
(101,'RAJU','CE'),
(102,'AMIT','CE'),
(103,'SANJAY','ME'),
(104,'NEHA','EC'),
(105,'MEERA','EE'),
(106,'MAHESH','ME');

CREATE TABLE RESULT(
RNO INT,
SPI DECIMAL(3,1)
);

INSERT INTO RESULT VALUES
(101,8.8),
(102,9.2),
(103,7.6),
(104,8.2),
(105,7.0),
(107,8.9);

--Part – A: 
--1. Combine information from student and result table using cross join or Cartesian product.
SELECT* FROM STU_INFO
CROSS JOIN RESULT

--2. Perform inner join on Student and Result tables. 
SELECT* FROM STU_INFO s
INNER JOIN RESULT r
ON s.RNO =r.RNO

--3. Perform the left outer join on Student and Result tables. 
SELECT* FROM STU_INFO s
LEFT OUTER JOIN RESULT r
ON s.RNO =r.RNO

--4. Perform the right outer join on Student and Result tables.
SELECT* FROM STU_INFO s
RIGHT JOIN RESULT r
ON s.RNO =r.RNO

--5. Perform the full outer join on Student and Result tables.
SELECT* FROM STU_INFO s
FULL JOIN RESULT r
ON s.RNO =r.RNO

--6. Display Rno, Name, Branch and SPI of all students. 
SELECT s.RNO,s.NAME, s.BRANCH, r.SPI  FROM STU_INFO s
INNER JOIN RESULT r
ON s.RNO =r.RNO

--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 
SELECT s.RNO,s.NAME, s.BRANCH, r.SPI  FROM STU_INFO s
INNER JOIN RESULT r
ON s.RNO =r.RNO
WHERE BRANCH='CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT s.RNO,s.NAME, s.BRANCH, r.SPI  FROM STU_INFO s
INNER JOIN RESULT r
ON s.RNO =r.RNO
WHERE BRANCH!='EC'

--9. Display average result of each branch.
SELECT AVG(r.SPI), s.BRANCH FROM STU_INFO s
INNER JOIN RESULT r
ON s.RNO =r.RNO
GROUP BY s.BRANCH


--10. Display average result of CE and ME branch.
SELECT AVG(r.SPI), s.BRANCH FROM STU_INFO s
INNER JOIN RESULT r
ON s.RNO =r.RNO
GROUP BY s.BRANCH
HAVING s.BRANCH = 'CE' OR s.BRANCH='ME'

CREATE TABLE EMP_MASTER(
	EMPLOYEENO VARCHAR(20),
	NAME VARCHAR(20),
	MANAGERNO VARCHAR(20)
);
INSERT INTO EMP_MASTER VALUES
('E01','TARUN',NULL),
('E02','ROHAN','E02'),
('E03','PRIYA','E01'),
('E04','MILAN','E03'),
('E05','JAY','E01'),
('E06','ANJANA','E04');



--Part – B: 
--1. Display average result of each branch and sort them in ascending order by SPI.
SELECT AVG(R.SPI),S.BRANCH FROM STU_INFO S
INNER JOIN RESULT R 
ON S.RNO = R.RNO
GROUP BY S.BRANCH
ORDER BY  AVG(R.SPI) 


--2. Display highest SPI from each branch and sort them in descending order. 
SELECT MAX(R.SPI),S.BRANCH FROM STU_INFO S
INNER JOIN RESULT R 
ON S.RNO = R.RNO
GROUP BY S.BRANCH
ORDER BY  MAX(R.SPI) DESC
--Part – C: 
--1. Retrieve the names of employee along with their manager’s name from the Employee table. 
	SELECT E1.NAME,E2.NAME FROM EMP_MASTER E1 
	LEFT JOIN EMP_MASTER E2
	ON E1.MANAGERNO = E2.EMPLOYEENO
	SELECT*FROM EMP_MASTER