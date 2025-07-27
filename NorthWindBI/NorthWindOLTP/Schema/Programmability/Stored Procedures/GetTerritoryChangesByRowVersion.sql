CREATE PROCEDURE [dbo].[GetTerritoryChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [TerritoryID]
			,[TerritoryDescription],
			[RegionID]
	FROM [dbo].[Territories]
	WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	AND [rowversion] <= CONVERT(ROWVERSION,@endRow);
END
GO