USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[delBrands]    Script Date: 4/27/2023 12:24:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[delBrands] @brand_id int
as 
delete from [production].[brands] where brand_id=@brand_id 

exec delBrands @brand_id=12;