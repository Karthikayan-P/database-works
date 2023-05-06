USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[Getstores]    Script Date: 4/28/2023 3:05:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Getstores]
    @store_name nvarchar(50) = NULL,
    @City nvarchar(50) = NULL
AS
BEGIN
    SELECT * FROM sales.stores
    WHERE (@store_Name IS NULL OR store_name = @store_name)
    AND (@City IS NULL OR city = @City)
END


exec Getstores @store_name='Baldwin Bikes',@city='Baldwin';
exec Getstores;