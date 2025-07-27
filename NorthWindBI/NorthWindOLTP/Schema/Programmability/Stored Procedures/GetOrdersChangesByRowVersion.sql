﻿CREATE PROCEDURE [dbo].[GetOrdersChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT ord.[OrderID]
		  ,ori.[ProductID]
		  ,OrderDateKey = CONVERT(INT,
							(CONVERT(CHAR(4),DATEPART(YEAR,ord.[OrderDate]))
						  + CASE 
								WHEN DATEPART(MONTH,ord.[OrderDate]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[OrderDate]))
								ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[OrderDate]))
							END
						  + CASE 
								WHEN DATEPART(DAY,ord.[OrderDate]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[OrderDate]))
								ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[OrderDate]))
							END))
		  ,RequiredDateKey = CONVERT(INT,
							(CONVERT(CHAR(4),DATEPART(YEAR,ord.[RequiredDate]))
						  + CASE 
								WHEN DATEPART(MONTH,ord.[RequiredDate]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[RequiredDate]))
								ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[RequiredDate]))
							END
						  + CASE 
								WHEN DATEPART(DAY,ord.[RequiredDate]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[RequiredDate]))
								ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[RequiredDate]))
							END))
		  ,ShippedDateKey = CASE
							WHEN ord.[ShippedDate] IS NULL THEN 0
							ELSE (CONVERT(INT,
										(CONVERT(CHAR(4),DATEPART(YEAR,ord.[ShippedDate]))
										+ CASE 
											WHEN DATEPART(MONTH,ord.[ShippedDate]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[ShippedDate]))
											ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[ShippedDate]))
										END
										+ CASE 
											WHEN DATEPART(DAY,ord.[ShippedDate]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[ShippedDate]))
											ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[ShippedDate]))
										END)))
							END
		  ,ori.[ProductID]
		  ,ord.[CustomerID]
		  ,ord.[EmployeeID]
		  ,ord.[ShipVia] as [ShipperID]

		  ,ori.[UnitPrice]
		  ,ori.[Quantity]
		  ,ori.[Discount]

		  ,ord.[OrderDate]
		  ,ord.[RequiredDate]
		  ,ord.[ShippedDate]

		  ,ord.[Freight]
		  ,ord.[ShipName]
		  ,ord.[ShipAddress]
		  ,ord.[ShipCity]
		  ,ord.[ShipRegion]
		  ,ord.[ShipPostalCode]
		  ,ord.[ShipCountry]
		  
	FROM [dbo].[Orders]            ord
	INNER JOIN [dbo].[OrderDetails] ori ON (ord.OrderID = ori.OrderID)
	WHERE (ord.[rowversion] > CONVERT(ROWVERSION,@startRow) 
			AND ord.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (ori.[rowversion] > CONVERT(ROWVERSION,@startRow) 
			AND ori.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO