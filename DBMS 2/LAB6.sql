--Part - A 

CREATE TABLE Products ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
);

INSERT INTO Products (Product_id, Product_Name, Price) VALUES 
(1, 'Smartphone', 35000), 
(2, 'Laptop', 65000), 
(3, 'Headphones', 5500), 
(4, 'Television', 85000), 
(5, 'Gaming Console', 32000);
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
declare @pro_id int,@pro_name varchar(50),@price decimal(10,2);
Declare Product_Cursor cursor
for select* from Products

open Product_Cursor;

fetch next from Product_Cursor into @pro_id,@pro_name,@price

while @@FETCH_STATUS = 0
begin
	print(cast(@pro_id as varchar(50))+':'+@pro_name+':'+ cast(@price as varchar(30)))
	fetch next from Product_Cursor into @pro_id,@pro_name,@price
end
close Product_Cursor
deallocate Product_Cursor



--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. 
--(Example: 1_Smartphone) 
declare @pro_id int,@pro_name varchar(50);
Declare Product_Cursor_Fetch cursor
for select Product_id,Product_name from Products

open Product_Cursor_Fetch;

fetch next from Product_Cursor_Fetch into @pro_id,@pro_name

while @@FETCH_STATUS = 0
begin
	print(cast(@pro_id as varchar(50))+'_'+@pro_name)
	fetch next from Product_Cursor_Fetch into @pro_id,@pro_name
end
close Product_Cursor_Fetch
deallocate Product_Cursor_Fetch


--3. Create a Cursor to Find and Display Products Above Price 30,000. 
declare @pro_id int,@pro_name varchar(50),@pro_price decimal(10,2);
Declare Product_Cursor_price cursor
for 
select * from Products
where Price>30000

open Product_Cursor_price;

fetch next from Product_Cursor_price into @pro_id,@pro_name,@pro_price

while @@FETCH_STATUS = 0
begin
	print(cast(@pro_id as varchar(50))+'_'+@pro_name)
	fetch next from Product_Cursor_price into @pro_id,@pro_name,@pro_price
end
close Product_Cursor_price
deallocate Product_Cursor_price

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table. 

declare @pro_id int;
Declare Product_Cursor_delete cursor
for 
select Product_id from Products

open Product_Cursor_delete;

fetch next from Product_Cursor_delete into @pro_id

while @@FETCH_STATUS = 0
begin
	delete from Products
	where Product_id= @pro_id
	fetch next from Product_Cursor_delete into @pro_id
end
close Product_Cursor_delete
deallocate Product_Cursor_delete
select*from Products

--Part – B 
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases 
--the price by 10%. 
declare @pro_id int,@pro_name varchar(30),@pro_price decimal(10,2);
Declare Product_CursorUpdate cursor
for 
select * from Products

open Product_CursorUpdate;

fetch next from Product_CursorUpdate into @pro_id,@pro_name,@pro_price

while @@FETCH_STATUS = 0
begin
	update Products 
	set Price = @pro_price*1.1
	where Product_id= @pro_id
	print(cast(@pro_id as varchar(50))+':'+@pro_name+':'+ cast(@pro_price as varchar(30)))
	fetch next from Product_CursorUpdate into @pro_id,@pro_name,@pro_price
end
close Product_CursorUpdate
deallocate Product_CursorUpdate
select*from Products

--6. Create a Cursor to Rounds the price of each product to the nearest whole number.

declare @pro_id int,@pro_name varchar(30),@pro_price decimal(10,2);
Declare Product_CursorRound cursor
for 
select * from Products

open Product_CursorRound;

fetch next from Product_CursorRound into @pro_id,@pro_name,@pro_price

while @@FETCH_STATUS = 0
begin
	update Products 
	set Price = Round(@pro_price,2)
	where Product_id= @pro_id
	print(cast(@pro_id as varchar(50))+':'+@pro_name+':'+ cast(@pro_price as varchar(30)))
	fetch next from Product_CursorRound into @pro_id,@pro_name,@pro_price
end
close Product_CursorRound
deallocate Product_CursorRound

--Part – C 
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table) 
CREATE TABLE NewProducts ( 
P_id INT PRIMARY KEY, 
P_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
);
declare @pro_id int,@pro_name varchar(30),@pro_price decimal(10,2);
Declare NewProduct_Cursor cursor
for 
select * from Products
where Product_Name= 'Laptop'

open NewProduct_Cursor;

fetch next from NewProduct_Cursor into @pro_id,@pro_name,@pro_price

while @@FETCH_STATUS = 0
begin
	insert into NewProducts 
	values(@pro_id,@pro_name,@pro_price)
	
	fetch next from NewProduct_Cursor into @pro_id,@pro_name,@pro_price
end
close NewProduct_Cursor
deallocate NewProduct_Cursor

--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products 
--with a price above 50000 to an archive table, removing them from the original Products table. 
CREATE TABLE ArchivedProducts ( 
P_id INT PRIMARY KEY, 
P_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
);
declare @pro_id int,@pro_name varchar(30),@pro_price decimal(10,2);
Declare NewProduct2_Cursor cursor
for 
select * from Products
where Price>50000

open NewProduct2_Cursor;

fetch next from NewProduct2_Cursor into @pro_id,@pro_name,@pro_price

while @@FETCH_STATUS = 0
begin
	insert into ArchivedProducts 
	values(@pro_id,@pro_name,@pro_price)
	
	fetch next from NewProduct_Cursor into @pro_id,@pro_name,@pro_price
end
close NewProduct_Cursor
deallocate NewProduct_Cursor