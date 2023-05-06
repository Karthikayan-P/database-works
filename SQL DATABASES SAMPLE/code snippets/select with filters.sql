USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[prodProd]    Script Date: 4/27/2023 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[prodProd] @year int
as 
select * from [production].[products] where model_year = @year;


EXEC prodProd @year=2016;
EXEC prodProd @year=2017;