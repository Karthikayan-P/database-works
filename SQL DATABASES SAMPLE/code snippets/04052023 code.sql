/*with cte*/

with cte AS (
select ID,name,gender,salary, ROW_NUMBER() OVER(PARTITION BY NAME,GENDER,SALARY ORDER BY NAME,GENDER,SALARY) as rows_num
from dbo.Employees
)
delete from cte where rows_num >1

select * from dbo.employees

rollback

---------------------------------------
/*out parameter*/
use[BikeStores]
go
CREATE PROCEDURE  outparams
	@INPUT INT,
	@OUTPUT NVARCHAR(50) OUT
as
BEGIN
	SELECT * FROM SALES.orders WHERE STAFF_ID=@INPUT
	SET @OUTPUT='OUTPUT FETCH'
END;

DECLARE @OUTPUT NVARCHAR(50)
EXEC outparams @INPUT=6,@OUTPUT=@OUTPUT OUT
SELECT @OUTPUT


SELECT * FROM [dbo].[Employees]
------------------------------
/* USER DEFINED TABLES*/

CREATE TYPE UT_EMPLOYEE AS TABLE
(
	ID INT,
	NAME NVARCHAR(MAX),
	GENDER NVARCHAR(10),
	SALARY INT
)

----
CREATE PROCEDURE Insert_Employee(@Employee_Details [UT_Employee] READONLY)  
AS  
BEGIN  
  
INSERT INTO dbo.Employees
(  
ID, 
NAME, 
GENDER,
SALARY
)  
SELECT * FROM @Employee_Details  
END 

DROP PROCEDURE Insert_Employee

DECLARE @TAB AS [UT_EMPLOYEE]

INSERT INTO @TAB

SELECT 6,'Karthik','Male',25000 UNION ALL
SELECT 7,'Shankari','Female',25000 UNION ALL
SELECT 8,'Piya','Female',24000

EXEC Insert_Employee @TAB

SELECT * FROM DBO.EMPLOYEES ORDER BY ID ASC

DELETE FROM DBO.EMPLOYEES WHERE ID IN (6,7,8)

----------------------------------
select * from production.brands_temp

CREATE TYPE UT_BRANDS AS TABLE
(
BRAND_ID INT,
BRAND_NAME NVARCHAR(50)
)
---
CREATE PROCEDURE BRANDS_USER_PROC(@BRANDS [UT_BRANDS] READONLY)
AS
BEGIN 
    UPDATE production.brands_temp
    SET BRAND_NAME='SUDAR MANI'
    WHERE BRAND_ID=19
END;
-----
DECLARE @BR AS [UT_BRANDS]

INSERT INTO @BR (BRAND_ID, BRAND_NAME)
VALUES (17, 'JC'), (18, 'MIKE'), (19, 'SUDAR MANI');

EXEC BRANDS_USER_PROC @BR;

SELECT * FROM production.brands_temp
--------------------------------------------
CREATE TYPE DEL_BRANDS AS TABLE
(
BRAND_ID INT
)
---
CREATE PROCEDURE BRANDS_USER_PROC_DEL(@BRANDS [DEL_BRANDS] READONLY)
AS
BEGIN 
    DELETE FROM production.brands_temp
    WHERE BRAND_ID in (select brand_id from @brands)
END;
-----
DECLARE @BR AS DEL_BRANDS

INSERT INTO @BR (BRAND_ID)
VALUES (19)

EXEC BRANDS_USER_PROC_DEL @BR;

SELECT * FROM production.brands_temp
----------------------------------------


