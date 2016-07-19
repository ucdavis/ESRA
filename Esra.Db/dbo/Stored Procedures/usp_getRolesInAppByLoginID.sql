CREATE Procedure [dbo].[usp_getRolesInAppByLoginID]
	-- Add the parameters for the stored procedure here
	@AppName nvarchar(50),
	@LoginID nvarchar(8)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT     roles.RoleID, roles.Role
FROM         Catbert3.dbo.Applications applications INNER JOIN
                      Catbert3.dbo.Permissions permissions ON applications.ApplicationID = permissions.ApplicationID INNER JOIN
                      Catbert3.dbo.Roles roles ON permissions.RoleID = roles.RoleID INNER JOIN
                      Catbert3.dbo.Users users ON permissions.UserID = users.UserID
WHERE     (users.LoginID = @LoginID) AND (applications.Name = @AppName) AND (applications.Inactive = 0) AND (permissions.Inactive = 0) AND 
                      (roles.Inactive = 0) AND (users.Inactive = 0)
END