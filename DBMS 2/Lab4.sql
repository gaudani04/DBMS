--Part – A 
--1. Write a function to print "hello world".
CREATE FUNCTION FN_printHello()
	RETURNS VARCHAR(50)
	AS
	BEGIN
		RETURN 'HELLO WORLD'
	END
	SELECT DBO.FN_printHello()


--2. Write a function which returns addition of two numbers. 
CREATE FUNCTION FN_SUM(@N1 INT,@N2 INT)
	RETURNS INT
	AS
	BEGIN
		DECLARE @SUM INT
		SET @SUM = @N1+@N2
		RETURN @SUM
	END
	SELECT DBO.FN_SUM(2,5)
--3. Write a function to check whether the given number is ODD or EVEN. 
CREATE FUNCTION FN_ODDEVEN(@N1 INT)
	RETURNS VARCHAR(30)
	AS
	BEGIN
		IF @N1%2=0
			RETURN 'EVEN'
		RETURN 'ODD'
	END
	SELECT DBO.FN_ODDEVEN(3)

--4. Write a function which returns a table with details of a person whose first name starts with B. 
CREATE FUNCTION FN_PERSON()
RETURNS TABLE
AS
 RETURN 
	SELECT* FROM PERSON 
	WHERE FirstName LIKE 'B%'
SELECT*FROM DBO.FN_PERSON()

--5. Write a function which returns a table with unique first names from the person table. 
CREATE FUNCTION FN_PERSON_UNIQUE()
RETURNS TABLE
AS
 RETURN 
	SELECT DISTINCT FirstName FROM PERSON
SELECT*FROM DBO.FN_PERSON_UNIQUE()

--6. Write a function to print number from 1 to N. (Using while loop) 
CREATE OR ALTER FUNCTION FN_1TON(@n INT)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @i INT,@ST VARCHAR(30)
	SET @i=1
	SET @ST = ''
	WHILE @i<=@n
	BEGIN
	 SET @ST = @ST+CAST(@i AS VARCHAR(30))+' '
	SET @i = @i+1
	
	END
	RETURN @ST
END
select dbo.FN_1TON(5)

--7. Write a function to find the factorial of a given integer. 
CREATE OR ALTER FUNCTION FN_FACT(@N INT)
RETURNS INT
AS
BEGIN
	DECLARE @FACT INT
	SET @FACT = 1
	WHILE @N>0
		BEGIN 
			SET @FACT = @FACT*@N
			SET @N = @N-1
			
		END
		RETURN @FACT
	END
SELECT DBO.FN_FACT(5)
			

--Part – B 
--8. Write a function to compare two integers and return the comparison result. (Using Case statement) 
CREATE OR ALTER FUNCTION FN_COMPARE(@A INT,@B INT)
RETURNS VARCHAR(30)
AS
	BEGIN
		RETURN CASE
		WHEN @A>@B THEN CAST(@A AS VARCHAR(10))+' IS GREATER'
		WHEN @A<@B THEN CAST(@B AS VARCHAR(10))+' IS GREATER'
		ELSE 'SAME'
	END
END
SELECT DBO.FN_COMPARE(0,0)

--9. Write a function to print the sum of even numbers between 1 to 20. 
CREATE OR ALTER FUNCTION FN_SUM_EVEN(@N INT)
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT
	SET @SUM=0
	WHILE @N>0
		BEGIN 
			SET @SUM+=@N
			 SET @N = @N-1
			
		END
		RETURN @SUM
	END
SELECT DBO.FN_SUM_EVEN(10)

--10. Write a function that checks if a given string is a palindrome 
CREATE OR ALTER FUNCTION FN_PALINDROM(@ST VARCHAR(30))
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @VAR VARCHAR(30)
	SET @VAR = REVERSE(@ST)
	IF @VAR = @ST
	RETURN 'YES'
	RETURN 'NO'
	END
SELECT DBO.FN_PALINDROM('SIDDIS')

--Part – C 
--11. Write a function to check whether a given number is prime or not. 
CREATE OR ALTER FUNCTION FN_PRIME(@N INT)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @I INT
	SET @I=2
	WHILE @I<@N
		BEGIN
		IF @N%@I=0
			RETURN 'NOT PRIME'
		SET @I+=1
		END
			RETURN 'PRIME'
END
SELECT DBO.FN_PRIME(7)
--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 


--13. Write a function which accepts two parameters year & month in integer and returns total days each 
--year. 

--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons. 
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.
