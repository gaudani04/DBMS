CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

CREATE TABLE Village (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

INSERT INTO Village (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);


--1. Display all the villages of Rajkot city. 
SELECT V.NAME FROM Village V
JOIN CITY C 
ON V.CityID = C.CityID
WHERE C.NAME = 'RAJKOT';

--2. Display city along with their villages & pin code. 
SELECT V.NAME,C.Pincode FROM Village V
JOIN CITY C 
ON V.CityID = C.CityID
WHERE 
GROUP BY C.NAME,

--3. Display the city having more than one village.
SELECT C.NAME FROM City C
JOIN Village V
ON C.CityID = V.CityID
GROUP BY C.NAME
HAVING COUNT(V.VID)>1

--4. Display the city having no village.
SELECT C.NAME FROM City C
JOIN Village V
ON C.CityID = V.CityID
GROUP BY C.NAME
HAVING COUNT(V.VID)=0

--5. Count the total number of villages in each city. 
SELECT C.NAME,COUNT(V.VID) FROM City C
JOIN Village V
ON C.CityID = V.CityID
GROUP BY C.Name

--6. Count the number of cities having more than one village.
SELECT COUNT(*) AS CitiesWithMoreThanOneVillage
FROM(
SELECT C.NAME,COUNT(V.VID) AS TOTAL
FROM CITY C
JOIN Village V
ON C.CityID = V.CityID
GROUP BY C.NAME)
AS CITYCOUNT
WHERE TOTAL>1


CREATE TABLE STU_MASTER(
    RNO INT,
    NAME VARCHAR(20),
	BRANCH VARCHAR(20),
	SPI DECIMAL(4,2) CHECK(SPI<10),
	BKLOG INT CHECK(BKLOG>=0)
);
DROP TABLE STU_MASTER
SELECT * FROM STU_MASTER

--4. Try to update SPI of Raju from 8.80 to 12. 
UPDATE STU_MASTER  
SET SPI = 12
WHERE NAME = 'RAJU';

--5. Try to update Bklog of Neha from 0 to -1. 
UPDATE STU_MASTER  
SET BKLOG = -1
WHERE NAME = 'NEHA';