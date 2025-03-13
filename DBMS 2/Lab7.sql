CREATE TABLE Customers ( 
Customer_id INT PRIMARY KEY,                 
Customer_Name VARCHAR(250) NOT NULL,         
Email VARCHAR(50) UNIQUE                     
); 

-- Create the Orders table 
CREATE TABLE Orders ( 
Order_id INT PRIMARY KEY,                    
Customer_id INT,                             
Order_date DATE NOT NULL,                    
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)  
);

--Part – A 
--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error. 
BEGIN TRY
	DECLARE @N1 INT= 1 ,@N2 INT = 0 , @RES INT
	SET @RES = @N1/@N2
	PRINT @RES
END TRY
BEGIN CATCH
	PRINT 'Error occurs that is - Divide by zero error'
END CATCH




--2. Try to convert string to integer and handle the error using try…catch block.
BEGIN TRY
	DECLARE @STR1 VARCHAR(10) = '1AB'
	PRINT CAST(@STR1 AS INT) 

END TRY
BEGIN CATCH
	PRINT 'Error occurs that is - UNABLE TO CONVERT STRING TO INT'
END CATCH
--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle 
--exception with all error functions if any one enters string value in numbers otherwise print result.
CREATE OR ALTER PROCEDURE PR_SUM_ERROR_HANDLE
@N1 VARCHAR(10),@N2  VARCHAR(10)
AS
	BEGIN
		BEGIN TRY
		DECLARE @SUM INT
		SET @SUM = CAST(@N1 AS INTEGER)+CAST(@N2 AS INTEGER)
		PRINT 'SUM IS '+CAST(@SUM AS VARCHAR)
		END TRY
	BEGIN CATCH
		PRINT 'ERROR_NUMBER:' +CAST(ERROR_NUMBER() AS VARCHAR(10))
		PRINT 'ERROR_STATE:' +CAST(ERROR_STATE() AS VARCHAR(10))
		PRINT 'ERROR_SEVERITY:' +CAST(ERROR_SEVERITY() AS VARCHAR(10))
		PRINT 'ERROR_MESSAGE:' +CAST(ERROR_MESSAGE() AS VARCHAR(10))
	END CATCH
	END

	EXEC PR_SUM_ERROR_HANDLE 1,9
--4. Handle a Primary Key Violation while inserting data into customers table and print the error details 
--such as the error message, error number, severity, and state.
CREATE OR ALTER PROCEDURE PR_INSERT_ERROR_HANDLE
@Customer_id INT,@Customer_Name VARCHAR(250),@Email VARCHAR(50)
AS
	BEGIN
		BEGIN TRY
		INSERT INTO Customers VALUES(@Customer_id,@Customer_Name,@Email)
		END TRY
	BEGIN CATCH
		PRINT 'ERROR_NUMBER:' +CAST(ERROR_NUMBER() AS VARCHAR(10))
		PRINT 'ERROR_STATE:' +CAST(ERROR_STATE() AS VARCHAR(10))
		PRINT 'ERROR_SEVERITY:' +CAST(ERROR_SEVERITY() AS VARCHAR(10))
		PRINT 'ERROR_MESSAGE:' +CAST(ERROR_MESSAGE() AS VARCHAR(10))
	END CATCH
	END
	exec PR_INSERT_ERROR_HANDLE 101,'SIDDHI','sid@gmail.com'
	exec PR_INSERT_ERROR_HANDLE 101,'SIDDHI','sid@gmail.com'
	
--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws 
--Error like no Customer_id is available in database.
CREATE OR ALTER PROCEDURE PR_CID_ERROR_HANDLE
@Customer_id INT
AS
	BEGIN
		BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM Customers where Customer_id = @Customer_id)
		THROW 50001,'no Customer_id is available in database',200
		
		ELSE 
		BEGIN
			PRINT('AVAILABLE')
			END
		END TRY
	BEGIN CATCH
		PRINT 'ERROR_NUMBER:' +CAST(ERROR_NUMBER() AS VARCHAR(10))
		PRINT 'ERROR_STATE:' +CAST(ERROR_STATE() AS VARCHAR(10))
		PRINT 'ERROR_SEVERITY:' +CAST(ERROR_SEVERITY() AS VARCHAR(10))
		PRINT 'ERROR_MESSAGE:' +CAST(ERROR_MESSAGE() AS VARCHAR(10))
	END CATCH
	END
	exec PR_CID_ERROR_HANDLE 1
	

--	Part – B 
--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error 
--message. 
CREATE OR ALTER PROCEDURE PR_INSERT_INTO_ORDER_ERROR_HANDLE
@Order_id INT,@Customer_id INT,@Order_date DATE
AS
	BEGIN
		BEGIN TRY
		INSERT INTO Orders VALUES(@Order_id,@Customer_id,@Order_date)
		END TRY
	BEGIN CATCH
		PRINT 'Foreign Key Violation ERROR'
		
	END CATCH
	END
	Declare @date DATE = GETDATE();
	PRINT @date
	exec PR_INSERT_INTO_ORDER_ERROR_HANDLE 1,999,@date;
----


--7. Throw custom exception that throws error if the data is invalid. 

CREATE OR ALTER PROCEDURE PR_INVALID_ERROR_HANDLE
@Order_id INT,@Customer_id INT,@Order_date DATE
AS
	BEGIN
		BEGIN TRY
		IF @Customer_id > 0
		INSERT INTO Orders VALUES(@Order_id,@Customer_id,@Order_date)
		
		ELSE
		THROW 56000,'NEGATIVE DATA',2
		END TRY

	BEGIN CATCH
		PRINT 'Foreign Key Violation ERROR: NEGATIVE DATA'	
	END CATCH
	END
	
	exec PR_INVALID_ERROR_HANDLE 2,-1,'03-02-2003';

--8. Create a Procedure to Update Customer’s Email with Error Handling

CREATE OR ALTER PROCEDURE PR_UPDATE
@Customer_id INT,@Customer_Name VARCHAR(250),@Email VARCHAR(50)
AS
	BEGIN
		BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM Customers WHERE Email = @Email)
		UPDATE Customers
		SET EMAIL = @Email
		WHERE Customer_id = @Customer_id
		ELSE 
		THROW 57000,'ALREADY EXIST',4
		END TRY
	BEGIN CATCH
		PRINT 'ERROR_NUMBER:' +CAST(ERROR_NUMBER() AS VARCHAR(10))
		PRINT 'ERROR_STATE:' +CAST(ERROR_STATE() AS VARCHAR(10))
		PRINT 'ERROR_SEVERITY:' +CAST(ERROR_SEVERITY() AS VARCHAR(10))
		PRINT 'ERROR_MESSAGE:' +CAST(ERROR_MESSAGE() AS VARCHAR(10))
	END CATCH
	END
	exec PR_UPDATE 101,'SIDDHI','Sidd3@gmail.com'
	SELECT * FROM Customers
	
