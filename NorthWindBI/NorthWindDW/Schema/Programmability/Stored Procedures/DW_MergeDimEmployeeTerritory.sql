CREATE PROCEDURE [dbo].[DW_MergeDimEmployeeTerritory]
AS
BEGIN

	UPDATE det
	SET [EmployeeSK] = semt.[EmployeeSK],
		[TerritorySK] = semt.[TerritorySK]

	FROM [dbo].[DimEmployeeTerritory]	det
	INNER JOIN [staging].[employee_territory] semt ON (det.[EmployeeTerritorySK] = semt.[EmployeeTerritorySK])
END
GO
