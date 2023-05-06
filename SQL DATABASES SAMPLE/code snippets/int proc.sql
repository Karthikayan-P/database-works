USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[intorder]    Script Date: 4/27/2023 4:57:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[intorder]
@lquantity int
as
begin 
select * from sales.order_items where quantity=@lquantity;
end

exec intorder 1;