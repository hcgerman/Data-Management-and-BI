CREATE TABLE [dbo].[DimTerritory](
	[TerritorySK] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimTerritory PRIMARY KEY,
	[TerritoryID] [nvarchar](20) NOT NULL,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[RegionDescription] [nchar](50) NOT NULL,
)
GO