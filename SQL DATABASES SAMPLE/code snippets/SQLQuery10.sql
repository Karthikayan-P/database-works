-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sales_new(
	-- Add the parameters for the stored procedure here
	@first_name NVARCHAR(50),
	@last_name NVARCHAR(50),
	@email NVARCHAR(50),
	@pincode INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Declare
	@Lfirst_name NVARCHAR(50),
	@Llast_name NVARCHAR(50),
	@Lemail NVARCHAR(50),
	@Lpincode INT

	SET @Lfirst_name=LTRIM(RTRIM(@first_name))
	SET @Llast_name=LTRIM(RTRIM(@last_name))
	SET @Lemail=LTRIM(RTRIM(@email))
	SET @Lpincode=LTRIM(RTRIM(@pincode))
    -- Insert statements for procedure here
	SELECT first_name, last_name,email,zip_code from [sales].[customers]
	where (@Lfirst_name is null or @Lfirst_name like '%' + @Lfirst_name + '%') and 
	(@Llast_name is null or @Llast_name like '%' + @Llast_name + '%') and
	(@Lemail is null or @Lemail like '%' + @Lemail + '%') and
	(@Lpincode is null or zip_code=@Lpincode) 

END

GO

EXEC sales_new @first_name='Debra' @last_name='
