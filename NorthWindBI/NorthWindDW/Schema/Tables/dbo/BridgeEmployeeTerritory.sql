CREATE TABLE [dbo].[DimEmployeeTerritory](
	[EmployeeTerritorySK] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimEmployeeTerritory PRIMARY KEY,
	[EmployeeSK] [int] NOT NULL,
	[TerritorySK] [int] NOT NULL,
)
GO

ALTER TABLE [dbo].[DimEmployeeTerritory] ADD CONSTRAINT [FK_DimEmployee] FOREIGN KEY([EmployeeSK]) REFERENCES [dbo].[DimEmployee] ([EmployeeSK]);
GO

ALTER TABLE [dbo].[DimEmployeeTerritory] ADD CONSTRAINT [FK_DimTerritory] FOREIGN KEY([TerritorySK]) REFERENCES [dbo].[DimTerritory] ([TerritorySK]);
GO