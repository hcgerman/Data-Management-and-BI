CREATE TABLE [dbo].[DimTerritory](
	[TerritorySK] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimTerritory PRIMARY KEY,
	[TerritoryID] [nchar](5) NOT NULL,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[Region] [nchar](50) NOT NULL,
)
GO