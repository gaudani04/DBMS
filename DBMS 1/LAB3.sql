CREATE TABLE CRICKET(
	Name VARCHAR(50),
	city VARCHAR(50),
	Age INT
);

INSERT INTO CRICKET VALUES('Sachin Tendulkar','Mumbai',30);
INSERT INTO CRICKET VALUES('Rahul Dravid','Bombay',35);
INSERT INTO CRICKET VALUES('M.S. Dhoni','Jharkhand',31);
INSERT INTO CRICKET VALUES('Suresh Raina ','Gujarat',30);

------------------------------PART A-----------------------------------

--1. Create table Worldcup from cricket with all the columns and data.
	SELECT*INTO WORLDCUP FROM CRICKET;

--2. Create table T20 from cricket with first two columns with no data. 
	SELECT *INTO T20 FROM CRICKET WHERE 1=2;
	SELECT*FROM T20;

--3. Create table IPL From Cricket with No Data 
SELECT*INTO IPL FROM CRICKET WHERE 1=2;
	SELECT*FROM IPL;
	SELECT*FROM CRICKET;

	---------------PART B----------------

	CREATE TABLE EMPLOYEE1(
	Name VARCHAR(50),
	city VARCHAR(50),
	Age INT
);

INSERT INTO EMPLOYEE1 VALUES('Jay Patel','Rajkot',30);
INSERT INTO CRICKET VALUES('Rahul Dave','Baroda',35);
INSERT INTO CRICKET VALUES('Jeet Patel','Surat',31);
INSERT INTO CRICKET VALUES('Vijay Raval ','Rajkot',30);

--1. Create table Employee_detail from Employee with all the columns and data.  
SELECT*INTO Employee_detail FROM EMPLOYEE;
SELECT* FROM Employee_detail;
SELECT * FROM EMPLOYEE

--2. Create table Employee_data from Employee with first two columns with no data. 
SELECT Name,city INTO  Employee_data FROM EMPLOYEE WHERE 1=2;
SELECT*FROM Employee_data;

--3. Create table Employee_info from Employee with no Data
SELECT*INTO Employee_info FROM EMPLOYEE WHERE 1=2;


--------------PART C-----------------

--1. Insert the Data into Employee_info from Employee whose CITY is Rajkot 
INSERT INTO Employee_info SELECT*FROM EMPLOYEE WHERE city='Rajkot';
SELECT*FROM Employee_info;
--2. Insert the Data into Employee_info from Employee whose age is more than 32.


--------------------UPDATE PART A------------------------------
SELECT*FROM DEPOSIT;
SELECT*FROM BORROW;
SELECT*FROM BRANCH;

--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table)
UPDATE DEPOSIT
SET AMOUNT=5000 WHERE AMOUNT=3000;

--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)  
UPDATE BORROW
SET BNAME='C.G. ROAD' WHERE BNAME='VRCE';

--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table) 
UPDATE DEPOSIT
SET ACTNO=111,AMOUNT=5000 WHERE CNAME='SANDIP';

--4. Update amount of KRANTI to 7000. (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT=7000 WHERE CNAME='KRANTI';

--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table) 
UPDATE BRANCH
SET BNAME='ANDHERI WEST' WHERE BNAME='ANDHERI';

--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table) 
UPDATE DEPOSIT
SET BNAME='NEHRU PALACE' WHERE CNAME='MEHUL';
SELECT*FROM DEPOSIT;

--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit 
--Table) 
UPDATE DEPOSIT
SET AMOUNT=5000 WHERE ACTNO BETWEEN 103 AND 107;

--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table) 
UPDATE DEPOSIT
SET ADATE='1995-4-1' WHERE CNAME='ANIL';

--9. Update the amount of MINU to 10000. (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT=10000 WHERE CNAME='MINU';

--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT=5000,ADATE='1996-4-1' WHERE CNAME='PRAMOD';

--------------------UPDATE(PART-B)-------------------

--1. Give 10% Increment in Loan Amount. (Use Borrow Table) 
UPDATE BORROW
SET AMOUNT=1.1*AMOUNT;
SELECT*FROM BORROW;

--2. Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table)
UPDATE DEPOSIT
SET AMOUNT=1.2*AMOUNT;
SELECT*FROM DEPOSIT;

-----------------PART C------------------

--1. Update amount of loan no 321 to NULL. (Use Borrow Table) 
UPDATE BORROW
SET AMOUNT=NULL WHERE LOANNO=321;

SELECT*FROM BORROW;


--2. Update branch name of KRANTI to NULL (Use Borrow Table) 
UPDATE BORROW
SET BNAME=NULL WHERE CNAME='KRANTI';

--3. Display the name of borrowers whose amount is NULL. (Use Borrow Table) 
SELECT CNAME FROM BORROW WHERE AMOUNT IS NULL;

--4. Display the Borrowers whose having branch. (Use Borrow Table)
SELECT CNAME FROM BORROW WHERE BNAME IS NULL;

--5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481. 
--(Use Borrow Table) 
UPDATE BORROW
SET AMOUNT=5000,BNAME='VRCE',CNAME='Darshan' WHERE LOANNO=481;

--6. Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less 
--than 2000. 
UPDATE DEPOSIT
SET ADATE='2021-1-1'WHERE AMOUNT<2000;
SELECT*FROM DEPOSIT;

--7. Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is 
--110.
UPDATE DEPOSIT
SET ADATE=NULL,BNAME='ANDHERI' WHERE ACTNO=110;