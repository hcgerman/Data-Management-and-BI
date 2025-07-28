CREATE PROCEDURE [dbo].[GetTerritoryChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT dt.[TerritoryID]
			,dt.[TerritoryDescription],
			oreg.[RegionDescription]
	FROM [dbo].[Territories] as dt
	INNER JOIN [dbo].[Region] oreg ON (dt.RegionID = oreg.RegionID)
	WHERE (dt.[rowversion] > CONVERT(ROWVERSION,@startRow) 
	AND dt.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (oreg.[rowversion] > CONVERT(ROWVERSION,@startRow) 
			AND oreg.[rowversion] <= CONVERT(ROWVERSION,@endRow));
END
GO