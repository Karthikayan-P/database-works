USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[getINP]    Script Date: 4/28/2023 7:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER PROCEDURE [dbo].[getINP]
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