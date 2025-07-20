CREATE TABLE [dbo].[FactOrders]
(
	[OrderID] [int] NOT NULL,
	[ItemID]  [int] NOT NULL,
	
	[ProductSK] [int] NOT NULL,
	[CustomerSK] [int] NULL,
	[EmployeeTerritorySK] [int] NULL,
	[ShipperSK] [int] NULL,

	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	
	[OrderDate] [date] NULL,
	[RequiredDate] [date] NULL,
	[ShippedDate] [date] NULL,
	[OrderDateKey]    [int] NOT NULL,
	[RequiredDateKey] [int] NOT NULL,
	[ShippedDateKey]  [int] NOT NULL,

	
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
)
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT PK_FactOrders PRIMARY KEY(OrderID,ItemID);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimProduct] FOREIGN KEY([ProductSK]) REFERENCES [dbo].[DimProduct] ([ProductSK]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimCustomer] FOREIGN KEY([CustomerSK]) REFERENCES [dbo].[DimCustomer] ([CustomerSK]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_BridgeEmployeeTerritorySK] FOREIGN KEY([EmployeeTerritorySK]) REFERENCES [dbo].[DimEmployeeTerritory] ([EmployeeTerritorySK]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimShipper] FOREIGN KEY([ShipperSK]) REFERENCES [dbo].[DimShipper] ([ShipperSK]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimDate_OrderDate] FOREIGN KEY([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimDate_RequiredDate] FOREIGN KEY([RequiredDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimDate_ShippedDate] FOREIGN KEY([ShippedDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);
GO





