CREATE PROCEDURE [dbo].[DW_MergeDimTerritory]
AS
BEGIN

	UPDATE dt
	SET [TerritoryDescription]  = st.[TerritoryDescription]
	   ,[Region]    = st.[Region]
	FROM [dbo].[DimTerritory]         dt
	INNER JOIN [staging].[territory] st ON (dt.[TerritorySK]=st.[TerritorySK])
END
GO