USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[catprodleft]    Script Date: 4/27/2023 2:01:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[catprodleft]
as 
begin 
select category_name,product_name from [production].[categories] left join [production].[products]
on categories.category_id=products.category_id;
end

exec catprodLeft;