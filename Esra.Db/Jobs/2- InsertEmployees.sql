INSERT INTO dbo.Employee (
	[PkEmployee]
      ,[EmployeeID]
      ,[TitleCode]
      ,[CareerHireDate]
      ,[ApptHireDate]
      ,[DatesHaveBeenAdjusted]
      ,[DepartmentComments]
      ,[DeansOfficeComments]
      ,[YearsOfService]
      ,[TimeInTitle])
SELECT DISTINCT TOP (100) PERCENT
	UCDEmployee.PkEmployee,
	UCDEmployee.EmployeeID,
	UCDEmployee.TC, 
	dbo.Employee.CareerHireDate,
	dbo.Employee.ApptHireDate,
	dbo.Employee.DatesHaveBeenAdjusted,
	dbo.Employee.DepartmentComments, 
	dbo.Employee.DeansOfficeComments,
	CAST(DATEDIFF(m, (CASE ISNULL(dbo.Employee.CareerHireDate, 0)
		WHEN 0 THEN UCDEmployee.HireDate
		ELSE dbo.Employee.CareerHireDate END), GETDATE()) AS DECIMAL) / 12 AS YearsOfService,
	CAST(DATEDIFF(m, (CASE ISNULL(dbo.Employee.ApptHireDate, 0)
		WHEN 0 THEN UCDEmployee.BeginDate
		ELSE dbo.Employee.ApptHireDate END), GETDATE()) AS DECIMAL) / 12 AS TimeInTitle
FROM         
	dbo.UCDEmployee AS UCDEmployee
	LEFT OUTER JOIN
		dbo.Employee ON UCDEmployee.PkEmployee = dbo.Employee.PkEmployee
WHERE
	--((UCDEmployee.HomeDept LIKE '030%' OR UCDEmployee.HomeDept LIKE '024%'  OR UCDEmployee.HomeDept IN ('065040', '065025' )) AND UCDEmployee.HomeDept NOT IN ('036005', '036000') )
	--AND
 UCDEmployee.PkEmployee NOT IN (SELECT PkEmployee FROM dbo.Employee);