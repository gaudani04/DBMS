CREATE TABLE STUDENT(
	StudentID INT,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	Website VARCHAR(50),
	City VARCHAR(25),
	Address VARCHAR(100)
);

	INSERT INTO STUDENT VALUES
	(1011,'KEYUR','PATEL','TECHONTHENET.COM','RAJKOT','A-303''VASANT KUNJ'', RAJKOT'),
	(1022,'HARDIK','SHAH','DIGMINECRAFT.COM','AHMEDABAD','"RAM KRUPA", RAIYA ROAD'),
	(1033,'KAJAL','TRIVEDI','BIGACTIVITIES.COM','BARODA','RAJ BHAVAN PLOT, NEAR GARDEN'),
	(1044,'BHOOMI','GAJERA','CHECKYOURMATH.COM','AHMEDABAD','"JIG''S HOME",NAROL'),
	(1055,'HARMIT','MITEL','@ME.DARSHAN.COM','RAJKOT','B-55, RAJ RESIDENCY'),
	(1055,'ASHOK','JANI',NULL,'BARODA','A502, CLUB HOUSE BUILDING');

	SELECT*FROM STUDENT;


	--From the above given tables perform the following queries (LIKE Operation):
	
--1. Display the name of students whose name starts with �k�. 
SELECT FirstName FROM STUDENT WHERE FirstName LIKE 'K%'; 

--2. Display the name of students whose name consists of five characters.
SELECT FirstName FROM STUDENT WHERE FirstName LIKE '_____';

--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters. 
SELECT FirstName,LastName FROM STUDENT WHERE CITY LIKE '_____A';

--4. Display all the students whose last name ends with �tel�. 
SELECT* FROM STUDENT WHERE LastName LIKE '%TEL';

--5. Display all the students whose first name starts with �ha� & ends with�t�. 
SELECT*FROM STUDENT WHERE FirstName LIKE 'HA%T';

--6. Display all the students whose first name starts with �k� and third character is �y�. 
SELECT* FROM STUDENT WHERE FirstName LIKE 'K_Y%';

--7. Display the name of students having no website and name consists of five characters. 
SELECT*FROM STUDENT WHERE Website IS NULL AND FirstName LIKE '_____';

--8. Display all the students whose last name consist of �jer�.   
SELECT*FROM STUDENT WHERE LastName LIKE 'JER';

--9. Display all the students whose city name starts with either �r� or �b�. 
SELECT*FROM STUDENT WHERE CITY LIKE '[R,B]%';

--10. Display all the name students having websites.
SELECT* FROM STUDENT WHERE Website IS NOT NULL;

--11. Display all the students whose name starts from alphabet A to H.
SELECT* FROM STUDENT WHERE FirstName LIKE '[A-H]%';

--12. Display all the students whose name�s second character is vowel. 
SELECT* FROM STUDENT WHERE FirstName LIKE '_[A,E,I,O,U]%';

--13. Display the name of students having no website and name consists of minimum five characters. 
SELECT* FROM STUDENT WHERE Website IS NULL AND FirstName LIKE '_____%';

--14. Display all the students whose last name starts with �Pat�.   
SELECT* FROM STUDENT WHERE LastName LIKE 'PAT%';

--15. Display all the students whose city name does not starts with �b�. 
SELECT*FROM STUDENT WHERE CITY NOT LIKE 'B%';

--------------------PART B----------------------------------------


--1. Display all the students whose name starts from alphabet A or H. 
SELECT* FROM STUDENT WHERE FirstName LIKE '[A,H]%';
--2. Display all the students whose name�s second character is vowel and of and start with H.
SELECT* FROM STUDENT WHERE FirstName LIKE 'H[A,E,I,O,U]%';

--3. Display all the students whose last name does not ends with �a�.
SELECT* FROM STUDENT WHERE LastName NOT LIKE '%A';

--4. Display all the students whose first name starts with consonant.
SELECT* FROM STUDENT WHERE FirstName NOT LIKE '[A,E,I,O,U]%';

--5. Display all the students whose website contains .net 
SELECT* FROM STUDENT WHERE Website LIKE '%.COM%';
SELECT* FROM STUDENT WHERE Website LIKE '@';
	