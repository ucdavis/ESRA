UPDATE dbo.Employee
SET YearsOfService = CAST(DATEDIFF(m, (CASE ISNULL(dbo.Employee.CareerHireDate, 0)
		WHEN 0 THEN (select DISTINCT HireDate from dbo.UCDEmployee WHERE dbo.Employee.PkEmployee = dbo.UCDEmployee.PkEmployee)
		ELSE dbo.Employee.CareerHireDate END), GETDATE()) AS DECIMAL) / 12,
    TimeInTitle = CAST(DATEDIFF(m, (CASE ISNULL(dbo.Employee.ApptHireDate, 0)
		WHEN 0 THEN (select DISTINCT BeginDate from dbo.UCDEmployee WHERE dbo.Employee.PkEmployee = dbo.UCDEmployee.PkEmployee)
		ELSE dbo.Employee.ApptHireDate END), GETDATE()) AS DECIMAL) / 12,
    YearsOfExperience = CAST(DATEDIFF(m, dbo.Employee.ExperienceBeginDate, GETDATE()) AS DECIMAL) / 12;
