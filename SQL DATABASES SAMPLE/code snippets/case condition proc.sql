USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[Getproc]    Script Date: 4/28/2023 5:23:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Getproc]
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


exec Getproc @input=3

select * from production.categories