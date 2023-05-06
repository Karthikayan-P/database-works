USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[likeFirst]    Script Date: 4/27/2023 3:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[likeFirst]
@first_name nvarchar(50)
as
begin 
select * from sales.customers where first_name like '%'+@first_name+'%';
end

exec likeFirst 'g'