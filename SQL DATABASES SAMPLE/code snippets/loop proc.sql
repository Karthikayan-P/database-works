USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[GETloop]    Script Date: 4/29/2023 12:24:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GETloop]
AS 
BEGIN
	DECLARE @i INT
WHILE @i<=10
	BEGIN
		SELECT @i
		SET @i = @i + 1
		IF @i>10
		BEGIN
			BREAK
		END
	END
END

EXEC GETloop @i=1