/*procedure for insert*/
create procedure prodbrands
as
insert into [production].[brands](brand_id,brand_name) values(10,'BSA')

/*procedure for select*/
create procedure prodProducts
as
select * from [production].[products]
GO;

/*FILTERS*/
CREATE PROCEDURE prodProd @year int
as 
select * from [production].[products] where model_year = @year;

/* delete */
create procedure delBrands @brand_id int
as 
delete from [production].[brands] where brand_id=@brand_id;

/*update*/
SET IDENTITY_INSERT production.brands ON;  

CREATE PROCEDURE UpdBrand
    @brandid INT,
    @brandname NVARCHAR(50)
AS
BEGIN
    UPDATE [production].[Brands]
    SET brand_name = @brandname
    WHERE brand_id = @brandid
END

/* inner join*/
create procedure catprod
as 
begin
select * from [production].[categories],[production].[products]
where [categories].category_id=products.category_id; 
end

exec catprod

/* left outer join*/
create procedure catprodleft
as 
begin 
select category_name,product_name from [production].[categories] left join [production].[products]
on categories.category_id=products.category_id;
end

/*right join*/
create procedure catprodright
as 
begin 
select category_name,product_name from [production].[categories] right join [production].[products]
on categories.category_id=products.category_id;
end

/* like command*/
create procedure likeFirst
@first_name nvarchar(50)
as
begin 
select * from sales.customers where first_name like '%@first_name%';
end

/*date proc*/
create procedure timeorder
@start_date Datetime,
@end_date Datetime
as
begin
select * from [sales].[orders] where order_date BETWEEN @start_date and @end_date;
end

/*time*/
create procedure getTime
as
begin 
SELECT convert(time, GETDATE()) AS CurrentTime;
end

/* int datatype*/
create procedure intorder
@lquantity int
as
begin 
select * from sales.order_items where quantity=@lquantity;
end

/*varchar proc*/
create procedure varcust
@city nvarchar(20)
as 
begin 
select * from sales.customers where city=@city;
end




select * from sales.customers where first_name like '%G%';
--Drop procedure updBrands

--EXEC UpdBrand @brandid = 11, @brandname = 'Zeus';

--select * from [production].[brands]