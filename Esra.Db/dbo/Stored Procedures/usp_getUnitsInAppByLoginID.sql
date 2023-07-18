CREATE Procedure [dbo].[usp_getUnitsInAppByLoginID]
	-- Add the parameters for the stored procedure here
	@AppName nvarchar(50),
	@LoginID nvarchar(8)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT     unit.UnitID, unit.FullName, unit.ShortName, unit.PPS_Code, unit.FIS_Code, unit.SchoolCode
FROM         Catbert3.dbo.Applications applications INNER JOIN
                      Catbert3.dbo.UnitAssociations associations ON applications.ApplicationID = associations.ApplicationID INNER JOIN
                      Catbert3.dbo.Unit unit ON associations.UnitID = unit.UnitID INNER JOIN
                      Catbert3.dbo.Users users ON associations.UserID = users.UserID
WHERE     (users.LoginID = @LoginID) AND (applications.Name = @AppName) AND (applications.Inactive = 0) AND (associations.Inactive = 0) AND 
                      (users.Inactive = 0) AND (users.Inactive = 0)
END