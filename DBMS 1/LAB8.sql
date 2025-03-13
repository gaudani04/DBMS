CREATE TABLE SALES_DATA(
	REGION VARCHAR(25),
	PRODUCT VARCHAR(25),
	SALES_AMOUNT INT,
	YEAR INT
);
INSERT INTO SALES_DATA VALUES
('NORTH AMERICA','WATCH',1500,2023),
('EUROPE','MOBILE',1200,2023),
('ASIA','WATCH',1800,2023),
('NORTH AMERICA','TV',900,2024),
('EUROPE','WATCH',2000,2024),
('ASIA','MOBILE',1000,2024),
('NORTH AMERICA','MOBILE',1600,2023),
('EUROPE','TV',1500,2023),
('ASIA','TV',1100,2024),
('NORTH AMERICA','WATCH',1700,2024)

SELECT* FROM SALES_DATA;
---------------------------PART A------------------------------------
--Part � A: 
--1. Display Total Sales Amount by Region. 
SELECT REGION,SUM(SALES_AMOUNT) AS TOTAL_SALES FROM SALES_DATA
GROUP BY REGION;

--2. Display Average Sales Amount by Product 
SELECT PRODUCT,AVG(SALES_AMOUNT) AS AVG_SALES FROM SALES_DATA GROUP BY PRODUCT;

--3. Display Maximum Sales Amount by Year 
SELECT YEAR,MAX(SALES_AMOUNT) AS MAX_SALES
FROM SALES_DATA
GROUP BY YEAR

--4. Display Minimum Sales Amount by Region and Year 
SELECT REGION,YEAR,MIN(SALES_AMOUNT) AS MIN_SALES
FROM SALES_DATA
GROUP BY REGION,YEAR

--5. Count of Products Sold by Region 
SELECT REGION, COUNT(PRODUCT)AS PRODUCT_COUNT
FROM SALES_DATA
GROUP BY REGION

--6. Display Sales Amount by Year and Product 
SELECT 
	YEAR,PRODUCT,
	SUM(SALES_AMOUNT)
	FROM SALES_DATA
	GROUP BY YEAR,PRODUCT

--7. Display Regions with Total Sales Greater Than 5000 
SELECT
	REGION,SUM(SALES_AMOUNT)
	FROM SALES_DATA
	GROUP BY REGION
	HAVING SUM(SALES_AMOUNT)>5000

	
	 

--8. Display Products with Average Sales Less Than 10000 
SELECT
	PRODUCT,AVG(SALES_AMOUNT)
	AS AVG_SALES
	FROM SALES_DATA
	GROUP BY PRODUCT
	HAVING AVG(SALES_AMOUNT)<10000

--9. Display Years with Maximum Sales Exceeding 500 
SELECT
	YEAR,MAX(SALES_AMOUNT)
	FROM SALES_DATA
	GROUP BY YEAR
	HAVING MAX(SALES_AMOUNT)>500

--10. Display Regions with at Least 3 Distinct Products Sold.
SELECT
	REGION,PRODUCT,COUNT(DISTINCT PRODUCT)
	AS 
	'COUNT'
	FROM SALES_DATA
	GROUP BY REGION,PRODUCT
	HAVING COUNT(DISTINCT PRODUCT)>=3
	


--11. Display Years with Minimum Sales Less Than 1000 
SELECT
	YEAR,MIN(SALES_AMOUNT) 
	FROM SALES_DATA
	GROUP BY YEAR
	HAVING MIN(SALES_AMOUNT)<1000

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount 
SELECT
	REGION,SUM(SALES_AMOUNT)
	FROM SALES_DATA
	WHERE YEAR=2023
	GROUP BY REGION
	ORDER BY SUM(SALES_AMOUNT) 


	------------------------------PART B------------------------------------
	 
--1. Display Count of Orders by Year and Region, Sorted by Year and Region
SELECT
	YEAR,REGION,
	COUNT(PRODUCT) AS COUNT_ORDER 
	FROM SALES_DATA
	GROUP BY YEAR,REGION
	ORDER BY YEAR,REGION

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region 
SELECT 
	REGION ,MAX(SALES_AMOUNT)
	FROM SALES_DATA
	GROUP BY REGION
	HAVING MAX(SALES_AMOUNT)>1000
	ORDER BY REGION


--3. Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending 
SELECT
	YEAR,SUM(SALES_AMOUNT)
	FROM SALES_DATA
	GROUP BY YEAR
	HAVING SUM(SALES_AMOUNT)<1000 
	ORDER BY YEAR DESC
	
--4. Display Top 3 Regions by Total Sales Amount in Year 2024 
SELECT
	TOP 3 REGION,
	SUM(SALES_AMOUNT)
	FROM SALES_DATA
	WHERE YEAR=2024
	GROUP BY REGION
	

	-----------------------PART C-----------------------
--	1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name 
SELECT
	PRODUCT,AVG(SALES_AMOUNT)
	FROM SALES_DATA
	WHERE SALES_AMOUNT BETWEEN 1000 AND 2000
	GROUP BY PRODUCT
	ORDER BY PRODUCT
--2. Display Years with More Than 5 Orders from Each Region 
SELECT
	YEAR,REGION,COUNT(PRODUCT)
	FROM SALES_DATA
	GROUP BY YEAR,REGION
	HAVING COUNT(PRODUCT)>5

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending. 
SELECT
	REGION,AVG(SALES_AMOUNT)
	FROM SALES_DATA
	WHERE YEAR = 2023
	GROUP BY REGION
	HAVING AVG(SALES_AMOUNT)>1500
	ORDER BY REGION DESC

--4. Find out region wise duplicate product. 
SELECT 
	REGION,PRODUCT, COUNT(*)
	FROM SALES_DATA
	group by REGION,PRODUCT
	HAVING COUNT(*) > 1;

	

--5. Find out region wise highest sales amount. 
SELECT
	REGION,MAX(SALES_AMOUNT)
	AS 
	HIGHEST_AMT
	FROM SALES_DATA
	GROUP BY REGION