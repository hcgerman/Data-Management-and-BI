CREATE PROCEDURE [dbo].[GetShipperChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [ShipperID]
			,[CompanyName]
			,[Phone]
	FROM [dbo].[shippers]
	WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	AND [rowversion] <= CONVERT(ROWVERSION,@endRow);
END
GO