CREATE PROCEDURE [dbo].[GetEmployeeChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [EmployeeID]
		,[FirstName]
		,[LastName]
		,[Title]
		,[TitleOfCourtesy]
		,[BirthDate]
		,[HireDate]
		,[Address]
		,[City]
		,[Region]
		,[PostalCode]
		,[Country]
		,[HomePhone]
		,[Extension]
		,[Photo]
		,[Notes]
		,[ReportsTo]
		,[PhotoPath]
	FROM [dbo].[Employees]
	WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	AND [rowversion] <= CONVERT(ROWVERSION,@endRow);
END
GO