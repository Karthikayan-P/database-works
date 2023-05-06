select * from production.brands;
select * from[production].[categories];
select * from [production].[products];
select * from [production].[stocks];
select * from [sales].[order_items];
select * from [sales].[orders];
select * from [sales].[staffs];
select * from [sales].[stores];

/*JOINS*/

SELECT PB.BRAND_ID, PC.CATEGORY_NAME, PP.product_name, PP.model_year,PS.QUANTITY 
FROM
PRODUCTION.BRANDS AS PB,
PRODUCTION.CATEGORIES AS PC,
PRODUCTION.PRODUCTS AS PP,
PRODUCTION.STOCKS AS PS
WHERE PB.brand_id=PP.BRAND_ID AND 
PC.CATEGORY_ID=PP.CATEGORY_ID AND 
PP.PRODUCT_ID=PS.PRODUCT_ID 

/*LEFT JOIN*/

SELECT PB.BRAND_ID, PC.CATEGORY_NAME, PP.product_name, PP.model_year
FROM PRODUCTION.BRANDS AS PB 
LEFT JOIN PRODUCTION.PRODUCTS AS PP
ON PB.brand_id=PP.BRAND_ID
LEFT JOIN PRODUCTION.CATEGORIES AS PC
ON PC.CATEGORY_ID=PP.CATEGORY_ID

/* RIGHT JOIN*/

SELECT PB.BRAND_ID, PC.CATEGORY_NAME, PP.product_name, PP.model_year
FROM PRODUCTION.BRANDS AS PB 
LEFT JOIN PRODUCTION.PRODUCTS AS PP
ON PB.brand_id=PP.BRAND_ID
LEFT JOIN PRODUCTION.CATEGORIES AS PC
ON PC.CATEGORY_ID=PP.CATEGORY_ID

/* FULL JOIN */
SELECT PB.BRAND_ID, PC.CATEGORY_NAME, PP.product_name, PP.model_year
FROM PRODUCTION.BRANDS AS PB 
FULL JOIN PRODUCTION.PRODUCTS AS PP
ON PB.brand_id=PP.BRAND_ID
FULL JOIN PRODUCTION.CATEGORIES AS PC
ON PC.CATEGORY_ID=PP.CATEGORY_ID
------------------------------------------------------
CREATE TABLE PRODUCTION.BRANDSS_NEW(
BRAND_ID INT,
BRAND_NAME NVARCHAR(50)
)

SELECT * FROM PRODUCTION.BRANDSS_NEW

TRUNCATE TABLE production.BRANDSS_NEW

INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(1,'KS');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(2,'KSK');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(3,'ARC');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(4,'PRINCE');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(5,'WARRIOR');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(6,'SET TOP');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(7,'MAVI');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(8,'BOAT');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(9,'ZEUS');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(10,'KRATOS');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(11,'NOISE');
INSERT INTO production.BRANDSS_NEW(BRAND_ID,BRAND_NAME) VALUES(12,'DOISE');

--------------------------------------------------

SET IDENTITY_INSERT production.brands ON;  

/* UPDATE FOR SAME COLUMN NAME FROM ANOTHER TABLE */ 
CREATE PROCEDURE NEWbrand
AS
BEGIN
    UPDATE PB
    SET PB.BRAND_NAME = PBS.BRAND_NAME
    FROM [PRODUCTION].[BRANDS] AS PB
    INNER JOIN [PRODUCTION].[BRANDSS_NEW] AS PBS
    ON PB.brand_id = PBS.BRAND_ID;
END

EXEC NEWbrand

SELECT * FROM production.BRANDS

-----------------------------------------
/*FILTERS SELECT*/

select * from [sales].[order_items];
select * from [sales].[orders];
SELECT * FROM SALES.staffs;
------------------------------------------------------
use [BikeStores]
go
CREATE PROCEDURE FILorder
    @ORDERID INT,
    @EMAIL NVARCHAR(50),
    @SHIP_DATE DATETIME
AS
BEGIN
    SELECT *
    FROM SALES.order_items AS ORD INNER JOIN SALES.orders AS ORS ON ORD.order_id=ORS.order_id
	INNER JOIN SALES.staffs AS STS ON ORS.staff_id=STS.staff_id
    WHERE ORD.order_id = @ORDERID
    AND email LIKE '%' + @EMAIL + '%'
    AND SHIPPED_DATE < @SHIP_DATE
END

drop procedure FILorder




SELECT * FROM SALES.orders;

SELECT convert(varchar(max), SHIPPED_DATE,  13) SHIPPED_DATE, 
       format(SHIPPED_DATE, 'dd-MM-yyyy') FORMAT_DATE FROM SALES.ORDERS;

----------------------------------
/* return all rows if not giving any values for*/


select * from sales.stores

CREATE PROCEDURE Getstores
    @store_name nvarchar(50) = NULL,
    @City nvarchar(50) = NULL
AS
BEGIN
    SELECT * FROM sales.stores
    WHERE (@store_Name IS NULL OR store_name = @store_name)
    AND (@City IS NULL OR city = @City)
END

exec Getstores

-----------------------------------------
CREATE PROCEDURE getdata
@PD_NAME nvarchar(50)=NULL,
@PRICE FLOAT=NULL
as
begin
	SELECT * FROM  PRODUCTION.PRODUCTS AS PP
	WHERE (@PD_NAME IS NULL OR PP.product_name LIKE '%' + @PD_NAME +'%')AND 
	(@PRICE IS NULL or PP.list_price > @PRICE);
END

exec getdata

drop procedure getdata

SELECT * FROM  PRODUCTION.PRODUCTS

----------------------------------------------
 /* procedure using if*/

 CREATE PROCEDURE getINP
 @input INT
 AS 
 BEGIN 
 IF @input > 10 
	BEGIN
		PRINT 'THE VALUE IS HIGHER'
	END
ELSE
	BEGIN
		PRINT 'THE VALUE IS LESSER'
	END
END

EXEC getINP @input=9
-------------------------------------
/* procedure using case */

SELECT * FROM production.categories

CREATE PROCEDURE Getproc
    @input int
AS
BEGIN
    SELECT
        CASE 
            WHEN CATEGORY_ID = @INPUT THEN category_name
            ELSE 'THE VALUE IS NOT PRESENT'
        END
    FROM PRODUCTION.CATEGORIES
END

