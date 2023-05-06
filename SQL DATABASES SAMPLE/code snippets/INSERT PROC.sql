/*insert query*/
USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[prodbrands]    Script Date: 4/27/2023 10:59:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[prodbrands] @Pbrand_id INT, @Pbrand_name NVARCHAR(10)
as
insert into [production].[brands](brand_id,brand_name) values(@Pbrand_id,@Pbrand_name)


select * from [production].brands;

SET IDENTITY_INSERT production.brands ON; 

EXEC prodbrands 11,'hercules';

