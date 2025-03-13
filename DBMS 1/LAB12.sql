SELECT*FROM PERSON;
SELECT* FROM DEPT;

--Part – A: 
--1. Find all persons with their department name & code.
SELECT P.PERSON_NAME,D.DEPARTMENT_NAME, D.DEPARTMENT_CODE
FROM DEPT D 
JOIN PERSON P
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID;
--2. Find the person's name whose department is in C-Block. 
SELECT P.PERSON_NAME FROM PERSON P
JOIN DEPT D 
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.LOCATION = 'C-BLOCK'
--3. Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT P.PERSON_NAME , P.SALARY , D.DEPARTMENT_NAME
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE P.CITY = 'JAMNAGAR'

--4. Retrieve person name, salary & department name who does not belong to Rajkot city. 
SELECT P.PERSON_NAME , P.SALARY , D.DEPARTMENT_NAME
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE P.CITY <> 'RAJKOT'

--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001. 
SELECT P.PERSON_NAME FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME = 'CIVIL' AND P.JOINING_DATE>'1-AUG-2001'

--6. Find details of all persons who belong to the computer department.
SELECT * FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME = 'COMPUTER';

--7. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 
SELECT P.PERSON_NAME ,D.DEPARTMENT_NAME
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DATEDIFF(DAY,P.JOINING_DATE,GETDATE())>365

--8. Find department wise person counts. 
SELECT D.DEPARTMENT_NAME , COUNT(P.PERSON_ID) FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME 

--9. Give department wise maximum & minimum salary with department name. 
SELECT D.DEPARTMENT_NAME,MAX(P.SALARY) AS MAXI , MIN(P.SALARY) AS MINI 
FROM PERSON P JOIN
DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME

--10. Find city wise total, average, maximum and minimum salary.
SELECT P.CITY,MAX(P.SALARY) AS MAXI , MIN(P.SALARY) AS MINI ,SUM(P.SALARY) AS TOTAL,AVG(P.SALARY) AS AVR
FROM PERSON P JOIN
DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY P.CITY
--11. Find the average salary of a person who belongs to Ahmedabad city. 
SELECT AVG(P.SALARY) FROM PERSON P
JOIN DEPT D
ON D.DEPARTMENT_ID = P.DEPARTMENT_ID
WHERE P.CITY = 'AHMEDABAD'

--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column)
SELECT P.PERSON_NAME +' lives in '+P.CITY+' and works in '+D.DEPARTMENT_NAME+' department '
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID

--Part – B: 
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 
SELECT P.PERSON_NAME +' EARNS '+CAST(P.SALARY AS VARCHAR)+' FROM '+D.DEPARTMENT_NAME +' DEPARTMENT MONTHLY'
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID

--2. Find city & department wise total, average & maximum salaries. 
SELECT P.CITY,D.DEPARTMENT_NAME,AVG(P.SALARY) AS AVERAGE_SAL,SUM(P.SALARY) AS TOTAL,MAX(P.SALARY) AS MAXIMUM_SAL
FROM PERSON P
JOIN DEPT D
ON D.DEPARTMENT_ID = P.DEPARTMENT_ID
GROUP BY P.CITY,D.DEPARTMENT_NAME

--3. Find all persons who do not belong to any department. 
SELECT P.PERSON_NAME FROM PERSON P 
LEFT JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID IS NULL

--4. Find all departments whose total salary is exceeding 100000. 
SELECT D.DEPARTMENT_NAME,SUM(P.SALARY) FROM PERSON P 
LEFT JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING SUM(P.SALARY)>100000

--Part – C: 
--1. List all departments who have no person. 
SELECT D.DEPARTMENT_NAME ,COUNT(P.PERSON_ID)
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT(P.PERSON_ID) = 0;
--2. List out department names in which more than two persons are working.
SELECT D.DEPARTMENT_NAME FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT(P.PERSON_ID)>2
--3. Give a 10% increment in the computer department employee’s salary. (Use Update) 
UPDATE PERSON 
SET SALARY = SALARY*1.1
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME = 'COMPUTER'
SELECT* FROM PERSON