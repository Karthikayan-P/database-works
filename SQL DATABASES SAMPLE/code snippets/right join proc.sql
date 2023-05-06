USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[catprodright]    Script Date: 4/27/2023 2:40:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[catprodright]
as 
begin 
select category_name,product_name from [production].[categories] right join [production].[products]
on categories.category_id=products.category_id;
end


exec catprodright;