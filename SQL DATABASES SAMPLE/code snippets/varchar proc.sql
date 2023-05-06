USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[varcust]    Script Date: 4/27/2023 5:11:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[varcust]
@city nvarchar(20)
as 
begin 
select * from sales.customers where city=@city;
end

exec varcust 'Sunnyside';