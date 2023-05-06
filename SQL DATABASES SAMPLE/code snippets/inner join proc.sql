USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[catprod]    Script Date: 4/27/2023 1:46:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[catprod]
as 
begin
select * from [production].[categories],[production].[products]
where [categories].category_id=products.category_id; 
end

exec catprod;