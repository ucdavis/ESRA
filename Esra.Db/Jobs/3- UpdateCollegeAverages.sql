USE [ESRA]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[usp_UpdateCollegeAverages]

SELECT	'Return Value' = @return_value

GO
