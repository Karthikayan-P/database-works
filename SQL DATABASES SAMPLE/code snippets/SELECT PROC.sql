/* SELECT*/
USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[prodProducts]    Script Date: 4/27/2023 11:22:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[prodProducts]
as
select * from [production].[products] order by list_price desc
GO;

EXEC prodProducts