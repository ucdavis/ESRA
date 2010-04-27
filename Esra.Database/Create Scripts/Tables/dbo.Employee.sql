USE [ESRA]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 07/01/2009 13:39:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Employee](
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
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[PkEmployee] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


