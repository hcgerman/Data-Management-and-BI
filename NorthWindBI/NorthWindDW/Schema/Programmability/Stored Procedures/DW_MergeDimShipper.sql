CREATE PROCEDURE [dbo].[DW_MergeDimShipper]
AS
BEGIN

	UPDATE det
	SET [CompanyName] = ss.[CompanyName]
		,[Phone] = ss.[Phone]


	FROM [dbo].[DimShipper]	ds
	INNER JOIN [staging].[shipper] ss ON (ds.[ShipperSK] = ss.[ShipperSK])
END
GO