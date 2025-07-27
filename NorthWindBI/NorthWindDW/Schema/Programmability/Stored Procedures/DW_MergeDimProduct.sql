CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN

	UPDATE dc
	SET [ProductName]  = sp.[ProductName]
		,[SupplierCompanyName] = sp.[SupplierCompanyName]
		,[SupplierCountry] = sp.[SupplierCountry]
		,[CategoryName] = sp.[CategoryName]
		,[CategoryDescription] = sp.[CategoryDescription]
		,[QuantityPerUnit] = sp.[QuantityPerUnit]
		,[UnitPrice] = sp.[UnitPrice]
		,[UnitsInStock] = sp.[UnitsInStock]
		,[UnitsOnOrder] = sp.[UnitsOnOrder]
		,[ReorderLevel] = sp.[ReorderLevel]
		,[Discontinued] = sp.[Discontinued]
	FROM [dbo].[DimProduct]         dp
	INNER JOIN [staging].[product] sp ON (dp.[ProductSK]=sp.[ProductSK])
END
GO