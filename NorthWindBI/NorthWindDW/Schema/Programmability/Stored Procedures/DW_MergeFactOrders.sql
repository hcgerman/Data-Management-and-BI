CREATE PROCEDURE [dbo].[DW_MergeFactOrders]
AS
BEGIN

	UPDATE dfo
	SET [OrderDateKey]    = so.[OrderDateKey]
	   ,[RequiredDateKey] = so.[RequiredDateKey]
	   ,[ShippedDateKey]  = so.[ShippedDateKey]
	   ,[OrderDate]       = so.[OrderDate] 
	   ,[RequiredDate]    = so.[RequiredDate]
	   ,[ShippedDate]     = so.[ShippedDate]

	   ,[ProductSK]	   = so.[ProductSK]
       ,[CustomerSK]      = so.[CustomerSK]
	   ,[EmployeeSK]   = so.[EmployeeSK]
	   ,[ShipperSK]         = so.[ShipperSK]

	   ,[UnitPrice]         = so.[UnitPrice]
	   ,[Quantity]       = so.[Quantity]
	   ,[Discount]        = so.[Discount]

	   ,[Freight]         = so.[Freight]
	   ,[ShipName]        = so.[ShipName]
	   ,[ShipAddress]     = so.[ShipAddress]
	   ,[ShipCity]        = so.[ShipCity]
	   ,[ShipRegion]      = so.[ShipRegion]
	   ,[ShipPostalCode]  = so.[ShipPostalCode]
	   ,[ShipCountry]     = so.[ShipCountry]
	FROM [dbo].[FactOrders]         dfo
	INNER JOIN [staging].[order] so ON (dfo.[OrderID] = so.[OrderID] AND dfo.OrderIDD = so.OrderIDD AND dfo.ProductIDD = so.ProductIDD)
END
GO