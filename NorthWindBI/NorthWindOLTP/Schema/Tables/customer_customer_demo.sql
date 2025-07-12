﻿CREATE TABLE [dbo].[CustomerCustomerDemo](
	[CustomerID] [nchar](5) NOT NULL,
	[CustomerTypeID] [nchar](10) NOT NULL,
	[rowversion] [timestamp] NULL,
 CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED 
(
	[CustomerID] ASC,
	[CustomerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO