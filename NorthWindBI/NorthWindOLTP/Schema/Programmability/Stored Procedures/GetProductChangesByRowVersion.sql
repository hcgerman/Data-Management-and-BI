CREATE PROCEDURE [dbo].[GetProductChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

	SELECT prd.[ProductID]
		  ,prd.[ProductName]
		  ,sppl.[CompanyName] as [SupplierCompanyName]
		  ,sppl.[Country] as [SupplierCountry]
		  ,cat.[CategoryName]
		  ,cat.[Description] as [CategoryDescription]
		  ,prd.[QuantityPerUnit]
		  ,prd.[UnitPrice]
		  ,prd.[UnitsInStock]
		  ,prd.[UnitsOnOrder]
		  ,prd.[ReorderLevel]
		  ,prd.[Discontinued]
	FROM  [dbo].[Products]         prd
	INNER JOIN [dbo].[Suppliers]     sppl ON (sppl.[SupplierID] = prd.[SupplierID]) 
	INNER JOIN [dbo].[Categories] cat ON (prd.[CategoryID] = cat.[CategoryID])
	WHERE (prd.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND prd.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (sppl.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND sppl.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (cat.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND cat.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO