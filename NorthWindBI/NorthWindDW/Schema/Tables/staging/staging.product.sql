CREATE TABLE [staging].[product](
	[ProductSK] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierCompanyName] [nvarchar](40) NOT NULL,
	[SupplierCountry] [nvarchar](15) NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
)
GO
