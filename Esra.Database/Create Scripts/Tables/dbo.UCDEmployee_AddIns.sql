USE [ESRA]
GO

/****** Object:  Table [dbo].[UCDEmployee_AddIns]    Script Date: 07/01/2009 13:46:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UCDEmployee_AddIns](
	[PkEmployee] [varchar](59) NULL,
	[EmployeeID] [char](9) NOT NULL,
	[HomeDept] [varchar](6) NULL,
	[WorkDept] [varchar](6) NULL,
	[Different] [int] NOT NULL,
	[EmpName] [varchar](50) NULL,
	[FirstName] [varchar](30) NULL,
	[MiddleName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
	[TC] [varchar](50) NULL,
	[HireDate] [varchar](10) NULL,
	[BeginDate] [varchar](10) NULL,
	[PayRate] [decimal](15, 4) NULL,
	[ApptType] [char](1) NULL,
	[SalaryGrade] [char](1) NULL,
	[BargainingUnit] [varchar](2) NULL,
	[SalaryStep] [varchar](4) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


