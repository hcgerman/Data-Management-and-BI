CREATE TABLE [staging].[order]
(
	[OrderID] [int] NOT NULL,
	[ItemID]  [int] NOT NULL,
	
	[ProductSK] [int] NOT NULL,
	[CustomerSK] [int] NULL,
	[EmployeeID] [int] NULL,
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
