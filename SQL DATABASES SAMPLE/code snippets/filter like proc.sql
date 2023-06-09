USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[getdata]    Script Date: 4/28/2023 7:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[getdata]
@PD_NAME nvarchar(50)=NULL,
@PRICE FLOAT=NULL
as
begin
	SELECT * FROM  PRODUCTION.PRODUCTS AS PP
	WHERE (@PD_NAME IS NULL OR PP.product_name LIKE '%' + @PD_NAME +'%')AND 
	(@PRICE IS NULL or PP.list_price > @PRICE);
END