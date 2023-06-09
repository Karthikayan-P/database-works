USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[FILorder]    Script Date: 4/28/2023 2:28:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FILorder]
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

EXEC FILorder @ORDERID = 1, @EMAIL = 'i', @SHIP_DATE = '2016-01-05'