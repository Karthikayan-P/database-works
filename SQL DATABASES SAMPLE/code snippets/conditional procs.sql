select * from production.BRANDSS_NEW

create table brand_edit (brand_id int,brand_name nvarchar(50));
values 

----------
create table brand_pick(brand_id int,brand_name nvarchar(50)) 
(select brand_id,brand_name from production.BRANDSS_NEW);


insert into [dbo].[brand_pick] (brand_id,brand_name)  select brand_id,brand_name from production.BRANDSS_NEW


select * from [dbo].[brand_pick]

-------------------------------------
USE [BikeStores]
GO
CREATE PROCEDURE loopUPD
AS
BEGIN 
	DECLARE @COUNTER INT=1
--DECLARE @VALUES NVARCHAR(50)
	WHILE @COUNTER < (SELECT COUNT(*) FROM [dbo].[brand_pick])
	BEGIN
		SELECT @COUNTER
		SET @COUNTER=@COUNTER +1
		
	END
END

EXEC loopUPD
DROP PROCEDURE loopUPD

-----------------------------------------------------
USE [BikeStores]
GO
CREATE PROCEDURE loop_new
AS
BEGIN 
    DECLARE @COUNTER INT = 1
    DECLARE @VALUES NVARCHAR(50)
    
    WHILE @COUNTER <= (SELECT COUNT(*) FROM [dbo].[brand_pick])
    BEGIN
        SELECT @VALUES = brand_name FROM [dbo].[brand_pick] WHERE brand_id = @COUNTER
        
        UPDATE [dbo].[brand_pick] 
        SET brand_name = @VALUES
        WHERE brand_id = @COUNTER	
        
        SET @COUNTER = @COUNTER + 1
    END
END


DROP PROCEDURE loop_new
exec loop_new 

SELECT * FROM DBO.brand_pick

----------------------------------------------------------------------

USE [BikeStores]
GO
CREATE PROCEDURE update_table
AS
BEGIN
    DECLARE @counter INT = 1
    DECLARE @max_count INT = (SELECT COUNT(*) FROM [production].[BRANDSS_NEW])
    
    WHILE @counter <= @max_count
    BEGIN
        DECLARE @column1 INT
        DECLARE @column2 VARCHAR(50)
        
        SELECT @column1 = BRAND_ID, @column2 = BRAND_NAME
        FROM [production].[BRANDSS_NEW] WHERE brand_id = @counter
        
		SET @column1 = @column1 + 1
        SET @column2 = @column1
        
        UPDATE production.NEW_BRANDS
        SET  BRAND_NAME = @column2,BRAND_ID=@column1
        WHERE brand_id = @counter
        
        SET @counter = @counter + 1
    END
END


---------------------------------------------------------
DROP PROCEDURE update_table

select * from [production].[BRANDSS_NEW]

SELECT * FROM production.NEW_BRANDS

SELECT * FROM sys.tables WHERE name = 'NEW_BRANDS'

------------------------
/*view*/

CREATE VIEW vw_customers
AS
SELECT * from [sales].[customers]


select * from vw_customers

/*view joins*/
USE BikeStores
GO
CREATE VIEW VW_CUST_JOINS
AS
SELECT PRD.PRODUCT_NAME,PRD.MODEL_YEAR,PRD.LIST_PRICE,CAT.CATEGORY_ID FROM [PRODUCTION].[PRODUCTS] AS PRD
,[PRODUCTION].[CATEGORIES] AS CAT
WHERE CAT.CATEGORY_ID=PRD.CATEGORY_ID

SELECT * FROM VW_CUST_JOINS

/*FILTERS USING VIEWS*/
CREATE VIEW FILTER_VIEW
AS
SELECT ITM.ORDER_ID, ITM.ITEM_ID, ITM.PRODUCT_ID, ITM.QUANTITY, ITM.LIST_PRICE
FROM  
[sales].[order_items] AS ITM, 
SALES.ORDERS AS ORD
WHERE ITM.LIST_PRICE > 650 AND 
ITM.DISCOUNT=0.05 
AND PRODUCT_ID=10
AND ITM.ORDER_ID=ORD.ORDER_ID

SELECT * FROM FILTER_VIEW
------------------------------------------
USE [BikeStores]

CREATE TABLE #TEMPCUST
(
CUST_ID INT,
LAST_NAME NVARCHAR(50),
EMAIL NVARCHAR(50)
)

SELECT * FROM SALES.CUSTOMERS

INSERT INTO #TEMPCUST (CUST_ID, LAST_NAME, EMAIL)
SELECT CUSTOMER_ID,FIRST_NAME,EMAIL FROM SALES.CUSTOMERS

SELECT * FROM #TEMPCUST

/*REMOVE DUPLICATES*/


select * from production.brands

drop table production.brands_temp

create table production.brands_temp(brand_id int primary key, brand_name nvarchar(20))

INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(1,'Electra')
INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(2,'Haro')
INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(3,'Heller')
INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(4,'Pure Cycles')
INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(5,'Ritchey')
INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(6,'Strider')
INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(7,'Sun Bicycles')
INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(8,'Surly')
INSERT INTO production.brands_temp(brand_id,brand_name) VALUES(9,'Trek')

select * from production.brands_temp
-------------------------------------------------------------------

USE[BikeStores]
GO
CREATE PROCEDURE remove_duplicate
as
BEGIN
    SET NOCOUNT ON;
    DELETE FROM [production].[brands_temp]
    WHERE brand_id NOT IN (
        SELECT MAX(brand_id)
        FROM [production].[brands_temp]
        GROUP BY /*brand_id,*/ brand_name
        HAVING COUNT(*) > 1
    )
END;

Drop procedure remove_duplicate
exec remove_duplicate

SELECT brand_name, COUNT(*) FROM [production].[brands_temp] GROUP BY brand_name HAVING COUNT(*) > 1

select * from production.brands_temp

---------------------

/*in,out,inout parameters*/
USE [BikeStores]
GO
CREATE PROCEDURE inparam
@INPUT INT
AS
BEGIN
SELECT * FROM [sales].[customers] WHERE CUSTOMER_ID=@INPUT;
END;

EXEC inparam @INPUT=3

-------
USE [BikeStores]
GO
CREATE PROCEDURE OUTPARAM
	@INPUT INT,
	@OUTPUT INT OUT
AS
BEGIN
	SELECT * FROM [SALES].[CUSTOMERS] WHERE CUSTOMER_ID=@INPUT;
	SET @OUTPUT=123;
END;


/*DECLARE @OUTPUT INT
DECLARE @OUTPUT_PARAM INT

EXEC OUTPARAM @INPUT=2, @OUTPUT_PARAM=@OUTPUT OUTPUT

SELECT @OUTPUT AS OutputParameter;*/

DECLARE @OUTPUT INT


EXEC OUTPARAM @INPUT=2, @OUTPUT=123

SELECT @OUTPUT AS OutputParameter;

--------------------------
/*IN OUT PARAMETER*/

CREATE PROCEDURE INOUTPARAM
    @InputParam INT,
    @OutputParam INT OUT
AS
BEGIN
   
    SET @OutputParam = @InputParam * 2;

    SELECT * FROM SALES.ORDER_ITEMS WHERE PRODUCT_ID = @InputParam;
END

DECLARE @OutputParam INT;

EXEC INOUTPARAM
    @InputParam = 10,
    @OutputParam = @OutputParam OUTPUT;

SELECT @OutputParam AS OutputParameter;

---------------------------------------------------------

use [BikeStores]

create table Employees  
(  
   ID int,  
   Name nvarchar(50),  
   Gender char(10),  
   Salary int  
)  

insert into Employees values(1,'Farhan Ahmed','Male',60000)  
insert into Employees values(5,'Monika','Female',25000)  
insert into Employees values(2,'Abdul Raheem','Male',30000)  
insert into Employees values(4,'Rahul Sharma','Male',60000)  
insert into Employees values(1,'Farhan Ahmed','Male',60000)  
insert into Employees values(2,'Abdul Raheem','Male',30000)  
insert into Employees values(5,'Monika','Female',25000)  
insert into Employees values(4,'Rahul Sharma','Male',60000)  
insert into Employees values(1,'Farhan Ahmed','Male',60000)  
insert into Employees values(3,'Priya','Female',20000)  
insert into Employees values(5,'Monika','Female',25000)  
insert into Employees values(4,'Rahul Sharma','Male',60000)  
insert into Employees values(5,'Monika','Female',25000)  
insert into Employees values(2,'Abdul Raheem','Male',30000)  
insert into Employees values(1,'Farhan Ahmed','Male',60000)  
insert into Employees values(4,'Rahul Sharma','Male',60000)  

select * from dbo.Employees;

with cte (ID,name,gender,salary) AS (
select ID,name,gender,salary, ROW_NUMBER() OVER(PARTITION BY NAME,GENDER,SALARY ORDER BY NAME,GENDER,SALARY) rows_num
from dbo.Employees
)