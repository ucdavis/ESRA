USE [ESRA]
GO

/****** Object:  Table [dbo].[SRAEmployee]    Script Date: 07/01/2009 13:45:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SRAEmployee](
	[PkSRAEmployee] [int] IDENTITY(136,1) NOT NULL,
	[PkEmployee] [char](13) NOT NULL,
	[EmployeeID] [char](9) NOT NULL,
	[TitleCode] [char](4) NOT NULL,
	[CareerHireDate] [datetime] NULL,
	[ApptHireDate] [datetime] NULL,
	[ExperienceBeginDate] [datetime] NULL,
	[DatesHaveBeenAdjusted] [bit] NULL,
	[DepartmentComments] [varchar](max) NULL,
	[DeansOfficeComments] [varchar](max) NULL,
	[YearsOfService] [decimal](5, 3) NULL,
	[TimeInTitle] [decimal](5, 3) NULL,
	[YearsOfExperience] [decimal](5, 3) NULL,
	[SalaryReviewAnalysisID] [int] NULL,
	[Created] [datetime] NOT NULL,
	[PayRate] [decimal](15, 4) NULL,
	[SalaryGrade] [char](1) NULL,
	[BargainingUnit] [varchar](2) NULL,
	[SalaryStep] [varchar](4) NULL,
	[FullName] [varchar](50) NULL,
	[HomeDepartmentID] [varchar](6) NULL,
	[WorkDepartmentID] [varchar](6) NULL,
	[Different] [bit] NOT NULL,
	[FirstName] [varchar](30) NULL,
	[MiddleName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
	[HireDate] [datetime] NULL,
	[BeginDate] [datetime] NULL,
 CONSTRAINT [PK_SRAEmployee] PRIMARY KEY CLUSTERED 
(
	[PkSRAEmployee] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


