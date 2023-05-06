USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[UpdBrand]    Script Date: 4/27/2023 1:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdBrand]
    @brandid INT,
    @brandname NVARCHAR(50)
AS
BEGIN
    UPDATE [production].[Brands]
    SET brand_name = @brandname
    WHERE brand_id = @brandid
END


EXEC UpdBrand @brandid = 11, @brandname = 'Zeus';