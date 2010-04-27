USE [ESRA]
GO
ALTER TABLE [dbo].[SalaryReviewAnalysis] DROP CONSTRAINT [DF_SalaryReviewAnalysis_IsReclass]
GO
/****** Object:  ForeignKey [FK_Scenario_SalaryReviewAnalysis]    Script Date: 07/01/2009 15:45:47 ******/
ALTER TABLE [dbo].[Scenario] DROP CONSTRAINT [FK_Scenario_SalaryReviewAnalysis]
GO
/****** Object:  ForeignKey [FK_SalaryReviewAnalysis_SalaryScale]    Script Date: 07/01/2009 15:45:47 ******/
ALTER TABLE [dbo].[SalaryReviewAnalysis] DROP CONSTRAINT [FK_SalaryReviewAnalysis_SalaryScale]
GO
/****** Object:  ForeignKey [FK_SalaryGradeMatrix_SalaryScale]    Script Date: 07/01/2009 15:45:47 ******/
ALTER TABLE [dbo].[SalaryGradeMatrix] DROP CONSTRAINT [FK_SalaryGradeMatrix_SalaryScale]
GO
/****** Object:  Table [dbo].[Scenario]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[Scenario]
GO
/****** Object:  Table [dbo].[SalaryReviewAnalysis]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[SalaryReviewAnalysis]
GO
/****** Object:  View [dbo].[APTDIS_V2]    Script Date: 07/01/2009 15:45:48 ******/
DROP VIEW [dbo].[APTDIS_V2]
GO
/****** Object:  View [dbo].[Departments]    Script Date: 07/01/2009 15:45:48 ******/
DROP VIEW [dbo].[Departments]
GO
/****** Object:  View [dbo].[UCDEmployee]    Script Date: 07/01/2009 15:45:48 ******/
DROP VIEW [dbo].[UCDEmployee]
GO
/****** Object:  View [dbo].[vLogin]    Script Date: 07/01/2009 15:45:48 ******/
DROP VIEW [dbo].[vLogin]
GO
/****** Object:  View [dbo].[vUnit]    Script Date: 07/01/2009 15:45:48 ******/
DROP VIEW [dbo].[vUnit]
GO
/****** Object:  View [dbo].[vUsers]    Script Date: 07/01/2009 15:45:48 ******/
DROP VIEW [dbo].[vUsers]
GO
/****** Object:  View [dbo].[vUserUnit]    Script Date: 07/01/2009 15:45:48 ******/
DROP VIEW [dbo].[vUserUnit]
GO
/****** Object:  View [dbo].[Title]    Script Date: 07/01/2009 15:45:48 ******/
DROP VIEW [dbo].[Title]
GO
/****** Object:  Table [dbo].[UCDEmployee_AddIns]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[UCDEmployee_AddIns]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[PayRateType]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[PayRateType]
GO
/****** Object:  Table [dbo].[QuartileType]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[QuartileType]
GO
/****** Object:  Table [dbo].[SalaryGradeMatrix]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[SalaryGradeMatrix]
GO
/****** Object:  Table [dbo].[SalaryScale]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[SalaryScale]
GO
/****** Object:  Table [dbo].[SalarySteps]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[SalarySteps]
GO
/****** Object:  Table [dbo].[SelectionType]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[SelectionType]
GO
/****** Object:  Table [dbo].[SRAEmployee]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[SRAEmployee]
GO
/****** Object:  Table [dbo].[ApptType]    Script Date: 07/01/2009 15:45:47 ******/
DROP TABLE [dbo].[ApptType]
GO
/****** Object:  Table [dbo].[ApptType]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApptType](
	[ApptTypeID] [int] NOT NULL,
	[Type] [varchar](64) NULL,
	[ShortType] [varchar](20) NULL,
	[Description] [varchar](1028) NULL,
 CONSTRAINT [PK_ApptType] PRIMARY KEY CLUSTERED 
(
	[ApptTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (1, N'Contract', N'CON', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (2, N'Regular/Career', N'CAR', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (3, N'Limited', N'LIM', N'(formerly casual)')
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (4, N'Casual/Restricted - Students', N'CAS/R', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (5, N'Academic', N'ACAD', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (6, N'Per Diem', N'PER D', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (7, N'Regular/Career Partial Year', N'C/PYR', NULL)
/****** Object:  Table [dbo].[SRAEmployee]    Script Date: 07/01/2009 15:45:47 ******/
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
SET IDENTITY_INSERT [dbo].[SRAEmployee] ON
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (148, N'6244231589611', N'624423158', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.583 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL, 144, CAST(0x00009B6D00000000 AS DateTime), CAST(51996.0000 AS Decimal(15, 4)), NULL, N'RX', N'12.0', N'CARNEY,KIM JAMES', N'030000', N'030000', 0, N'KIM', N'JAMES', N'CARNEY', CAST(0x000090AF00000000 AS DateTime), CAST(0x000096A300000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (149, N'0036952029610', N'003695202', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.667 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL, 145, CAST(0x00009B6E00000000 AS DateTime), CAST(52800.0000 AS Decimal(15, 4)), NULL, N'RX', N'8.0', N'YOUNG,PACIENCIA S', N'030020', N'030020', 0, N'PACIENCIA', N'S', N'YOUNG', CAST(0x00007C7A00000000 AS DateTime), CAST(0x00009A1600000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (150, N'5731331889613', N'573133188', N'9613', CAST(0x0000759000000000 AS DateTime), CAST(0x00008CE300000000 AS DateTime), NULL, 1, NULL, NULL, CAST(26.667 AS Decimal(5, 3)), CAST(10.250 AS Decimal(5, 3)), NULL, 146, CAST(0x00009B9D00000000 AS DateTime), CAST(41592.0000 AS Decimal(15, 4)), NULL, N'RX', N'9', N'ADAM,CARL F', N'030045', N'030045', 0, N'CARL', N'F', N'ADAM', CAST(0x000076FD00000000 AS DateTime), CAST(0x00008CE300000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (151, N'7532162747285', N'753216274', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(28.750 AS Decimal(5, 3)), CAST(12.500 AS Decimal(5, 3)), NULL, 147, CAST(0x00009BA100000000 AS DateTime), CAST(74496.0000 AS Decimal(15, 4)), N'3', N'99', NULL, N'AHMADI,ABBAS', N'030045', N'030045', 0, N'ABBAS', NULL, N'AHMADI', CAST(0x0000729200000000 AS DateTime), CAST(0x000089AD00000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (152, N'0468210889617', N'046821088', N'9617', CAST(0x000074C900000000 AS DateTime), CAST(0x0000883F00000000 AS DateTime), NULL, 1, NULL, NULL, CAST(27.333 AS Decimal(5, 3)), CAST(13.667 AS Decimal(5, 3)), NULL, 148, CAST(0x00009BCB00000000 AS DateTime), CAST(61032.0000 AS Decimal(15, 4)), NULL, N'RX', N'25.0', N'ADAMS,BETTY M', N'030045', N'030045', 0, N'BETTY', N'M', N'ADAMS', CAST(0x000074C900000000 AS DateTime), CAST(0x000089AD00000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (153, N'6589212917285', N'658921291', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.333 AS Decimal(5, 3)), CAST(6.750 AS Decimal(5, 3)), NULL, 149, CAST(0x00009BCB00000000 AS DateTime), CAST(63988.0000 AS Decimal(15, 4)), N'3', N'99', NULL, N'YOUNG,JULIE A', N'030000', N'030040', 1, N'JULIE', N'A', N'YOUNG', CAST(0x0000763C00000000 AS DateTime), CAST(0x0000921E00000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (154, N'8148127494722', N'814812749', N'4722', CAST(0x00008C1100000000 AS DateTime), NULL, CAST(0x00008EE700000000 AS DateTime), 0, NULL, NULL, CAST(11.000 AS Decimal(5, 3)), CAST(7.750 AS Decimal(5, 3)), CAST(9.083 AS Decimal(5, 3)), 150, CAST(0x00009BD100000000 AS DateTime), CAST(47100.0000 AS Decimal(15, 4)), NULL, N'CX', N'6.0', N'ADAMS,JEAN', N'030000', N'061025', 1, N'JEAN', NULL, N'ADAMS', CAST(0x00008C1100000000 AS DateTime), CAST(0x000090B100000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (155, N'2212583539610', N'221258353', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.500 AS Decimal(5, 3)), CAST(4.417 AS Decimal(5, 3)), NULL, 151, CAST(0x00009BD100000000 AS DateTime), CAST(65664.0000 AS Decimal(15, 4)), NULL, N'RX', N'19.0', N'ALLEN,BRANT C', N'030150', N'061837', 1, N'BRANT', N'C', N'ALLEN', CAST(0x00007E8100000000 AS DateTime), CAST(0x0000957300000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (156, N'7540213199614', N'754021319', N'9614', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.333 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL, 152, CAST(0x00009BE500000000 AS DateTime), CAST(62352.0000 AS Decimal(15, 4)), NULL, N'99', NULL, N'RUAN,DELING', N'030300', N'030300', 0, N'DELING', NULL, N'RUAN', CAST(0x0000877900000000 AS DateTime), CAST(0x000096E000000000 AS DateTime))
INSERT [dbo].[SRAEmployee] ([PkSRAEmployee], [PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience], [SalaryReviewAnalysisID], [Created], [PayRate], [SalaryGrade], [BargainingUnit], [SalaryStep], [FullName], [HomeDepartmentID], [WorkDepartmentID], [Different], [FirstName], [MiddleName], [LastName], [HireDate], [BeginDate]) VALUES (157, N'2212583539610', N'221258353', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.667 AS Decimal(5, 3)), CAST(4.583 AS Decimal(5, 3)), NULL, 153, CAST(0x00009C0200000000 AS DateTime), CAST(65664.0000 AS Decimal(15, 4)), NULL, N'RX', N'19.0', N'ALLEN,BRANT C', N'030150', N'061837', 1, N'BRANT', N'C', N'ALLEN', CAST(0x00007E8100000000 AS DateTime), CAST(0x0000957300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SRAEmployee] OFF
/****** Object:  Table [dbo].[SelectionType]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SelectionType](
	[SelectionTypeID] [int] IDENTITY(101,1) NOT NULL,
	[Type] [varchar](64) NULL,
	[ShortType] [varchar](20) NULL,
	[Description] [varchar](128) NULL,
	[SortOrder] [char](2) NULL,
 CONSTRAINT [PK_SelectionType] PRIMARY KEY CLUSTERED 
(
	[SelectionTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SelectionType] ON
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (101, N'Minimum', N'Min', N'Minimum', N'02')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (102, N'First Qrtle', N'1st', N'First Quartile', N'03')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (103, N'Midpoint', N'Mid', N'Midpoint', N'04')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (104, N'Third Qrtle', N'3rd', N'Third Quartile', N'05')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (105, N'Maximum', N'Max', N'Maximum', N'06')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (106, N'Labor Market WAS', N'Labor Mkt WAS', N'Labor Market WAS', N'07')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (107, N'Labor Market Mid', N'Labor Mkt Mid', N'Labor Market Mid', N'08')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (108, N'College Average', N'College AVG', N'College Average', N'09')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (109, N'Campus Average', N'Campus AVG', N'Campus Average', N'10')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (110, N'Salary Step', N'Step', N'Salary Step', N'11')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (111, N'None', N'None', N'No selection type selected', N'01')
SET IDENTITY_INSERT [dbo].[SelectionType] OFF
/****** Object:  Table [dbo].[SalarySteps]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalarySteps](
	[PkSalaryStep] [int] IDENTITY(101,1) NOT NULL,
	[TitleCode] [char](4) NOT NULL,
	[Step] [char](5) NOT NULL,
	[Annual] [money] NOT NULL,
	[Monthly] [money] NOT NULL,
	[Hourly] [money] NOT NULL,
	[EffectiveDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE CLUSTERED INDEX [SalarySteps_TitleCodeStepEffectiveDateUDX] ON [dbo].[SalarySteps] 
(
	[TitleCode] ASC,
	[Step] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SalarySteps_TitleCodeAnnualIDX] ON [dbo].[SalarySteps] 
(
	[TitleCode] ASC,
	[Annual] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SalarySteps] ON
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (911, N'4001', N'1    ', 0.0000, 0.0000, 0.0000, CAST(0x00009B7300000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (914, N'4001', N'1    ', 0.0000, 0.0000, 0.0000, CAST(0x00009B7400000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (917, N'4001', N'1    ', 100.0000, 8.0000, 0.0479, CAST(0x00009BA100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (912, N'4001', N'2    ', 0.0000, 0.0000, 0.0000, CAST(0x00009B7300000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (915, N'4001', N'2    ', 200.0000, 17.0000, 0.0958, CAST(0x00009BA100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (916, N'4001', N'3    ', 300.0000, 25.0000, 0.1437, CAST(0x00009BA100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (910, N'4672', N'1    ', 0.0000, 0.0000, 0.0000, CAST(0x00009B5A00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (131, N'4672', N'1.0  ', 25764.0000, 2147.0000, 12.3391, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (132, N'4672', N'1.5  ', 26280.0000, 2190.0000, 12.5862, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (133, N'4672', N'2.0  ', 26784.0000, 2232.0000, 12.8276, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (134, N'4672', N'2.5  ', 27264.0000, 2272.0000, 13.0575, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (135, N'4672', N'3.0  ', 27708.0000, 2309.0000, 13.2701, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (136, N'4672', N'3.5  ', 28236.0000, 2353.0000, 13.5230, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (137, N'4672', N'4.0  ', 28824.0000, 2402.0000, 13.8046, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (138, N'4672', N'4.5  ', 29352.0000, 2446.0000, 14.0575, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (139, N'4672', N'5.0  ', 29880.0000, 2490.0000, 14.3103, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (140, N'4672', N'5.5  ', 30552.0000, 2546.0000, 14.6322, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (141, N'4672', N'6.0  ', 31224.0000, 2602.0000, 14.9540, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (142, N'4672', N'6.5  ', 31932.0000, 2661.0000, 15.2931, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (143, N'4672', N'7.0  ', 32640.0000, 2720.0000, 15.6322, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (144, N'4672', N'7.5  ', 33384.0000, 2782.0000, 15.9885, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (145, N'4672', N'8.0  ', 34128.0000, 2844.0000, 16.3448, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (146, N'4672', N'8.5  ', 34896.0000, 2908.0000, 16.7126, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (147, N'4672', N'9.0  ', 35688.0000, 2974.0000, 17.0920, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (540, N'4722', N'1.0  ', 37536.0000, 3128.0000, 17.9770, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (541, N'4722', N'1.5  ', 38412.0000, 3201.0000, 18.3966, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (542, N'4722', N'2.0  ', 39276.0000, 3273.0000, 18.8103, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (543, N'4722', N'2.5  ', 40176.0000, 3348.0000, 19.2414, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (544, N'4722', N'3.0  ', 41136.0000, 3428.0000, 19.7011, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (545, N'4722', N'3.5  ', 42096.0000, 3508.0000, 20.1609, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (546, N'4722', N'4.0  ', 43128.0000, 3594.0000, 20.6552, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (547, N'4722', N'4.5  ', 44076.0000, 3673.0000, 21.1092, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (548, N'4722', N'5.0  ', 45096.0000, 3758.0000, 21.5977, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (549, N'4722', N'5.5  ', 46068.0000, 3839.0000, 22.0632, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (550, N'4722', N'6.0  ', 47100.0000, 3925.0000, 22.5575, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (551, N'4722', N'6.5  ', 48144.0000, 4012.0000, 23.0575, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (552, N'4722', N'7.0  ', 49224.0000, 4102.0000, 23.5747, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (553, N'4722', N'7.5  ', 50340.0000, 4195.0000, 24.1092, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (554, N'4722', N'8.0  ', 51468.0000, 4289.0000, 24.6494, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (555, N'4722', N'8.5  ', 52620.0000, 4385.0000, 25.2011, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (556, N'4722', N'9.0  ', 53808.0000, 4484.0000, 25.7701, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (523, N'4723', N'1.0  ', 32496.0000, 2708.0000, 15.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (524, N'4723', N'1.5  ', 33204.0000, 2767.0000, 15.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (525, N'4723', N'2.0  ', 33936.0000, 2828.0000, 16.2500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (526, N'4723', N'2.5  ', 34632.0000, 2886.0000, 16.5900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (527, N'4723', N'3.0  ', 35340.0000, 2945.0000, 16.9200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (528, N'4723', N'3.5  ', 36108.0000, 3009.0000, 17.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (529, N'4723', N'4.0  ', 36864.0000, 3072.0000, 17.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (530, N'4723', N'4.5  ', 37704.0000, 3142.0000, 18.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (531, N'4723', N'5.0  ', 38566.0000, 3213.0000, 18.4700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (532, N'4723', N'5.5  ', 39420.0000, 3285.0000, 18.8800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (533, N'4723', N'6.0  ', 40296.0000, 3358.0000, 19.3000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (534, N'4723', N'6.5  ', 41184.0000, 3432.0000, 19.7200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (535, N'4723', N'7.0  ', 42109.0000, 3509.0000, 20.1700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (536, N'4723', N'7.5  ', 43044.0000, 3587.0000, 20.6200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (537, N'4723', N'8.0  ', 44028.0000, 3669.0000, 21.0900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (538, N'4723', N'8.5  ', 45024.0000, 3752.0000, 21.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (539, N'4723', N'9.0  ', 46032.0000, 3836.0000, 22.0500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (557, N'4724', N'1.0  ', 28824.0000, 2402.0000, 13.8000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (558, N'4724', N'1.5  ', 29352.0000, 2446.0000, 14.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (559, N'4724', N'2.0  ', 29880.0000, 2490.0000, 14.3100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (560, N'4724', N'2.5  ', 30444.0000, 2537.0000, 14.5800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (561, N'4724', N'3.0  ', 31080.0000, 2590.0000, 14.8900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (562, N'4724', N'3.5  ', 31728.0000, 2644.0000, 15.2000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (563, N'4724', N'4.0  ', 32412.0000, 2701.0000, 15.5200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (564, N'4724', N'4.5  ', 33156.0000, 2763.0000, 15.8800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (565, N'4724', N'5.0  ', 33888.0000, 2824.0000, 16.2300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (566, N'4724', N'5.5  ', 34644.0000, 2887.0000, 16.5900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (567, N'4724', N'6.0  ', 35400.0000, 2950.0000, 16.9500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (568, N'4724', N'6.5  ', 36192.0000, 3016.0000, 17.3300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (569, N'4724', N'7.0  ', 37008.0000, 3084.0000, 17.7200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (570, N'4724', N'7.5  ', 37836.0000, 3153.0000, 18.1200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (571, N'4724', N'8.0  ', 38676.0000, 3223.0000, 18.5200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (572, N'4724', N'8.5  ', 39540.0000, 3295.0000, 18.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (573, N'4724', N'9.0  ', 40428.0000, 3369.0000, 19.3600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (148, N'4725', N'1.0  ', 43752.0000, 3646.0000, 20.9500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (149, N'4725', N'1.5  ', 44760.0000, 3730.0000, 21.4300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (150, N'4725', N'2.0  ', 45732.0000, 3811.0000, 21.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (151, N'4725', N'2.5  ', 46752.0000, 3896.0000, 22.3900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (152, N'4725', N'3.0  ', 47760.0000, 3980.0000, 22.8800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (153, N'4725', N'3.5  ', 48816.0000, 4068.0000, 23.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (154, N'4725', N'4.0  ', 49884.0000, 4157.0000, 23.8900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (155, N'4725', N'4.5  ', 50988.0000, 4249.0000, 24.4200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (156, N'4725', N'5.0  ', 52104.0000, 4342.0000, 24.9500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (157, N'4725', N'5.5  ', 53244.0000, 4437.0000, 25.5000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (158, N'4725', N'6.0  ', 54420.0000, 4535.0000, 26.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (159, N'4725', N'6.5  ', 55644.0000, 4637.0000, 26.6500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (160, N'4725', N'7.0  ', 56880.0000, 4740.0000, 27.2400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (101, N'4804', N'1.0  ', 42012.0000, 3501.0000, 20.1200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (102, N'4804', N'1.5  ', 42996.0000, 3583.0000, 20.5900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (103, N'4804', N'2.0  ', 43944.0000, 3662.0000, 21.0400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (104, N'4804', N'2.5  ', 44988.0000, 3749.0000, 21.5400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (105, N'4804', N'3.0  ', 45960.0000, 3830.0000, 22.0100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (106, N'4804', N'3.5  ', 47040.0000, 3920.0000, 22.5300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (107, N'4804', N'4.0  ', 48192.0000, 4016.0000, 23.0800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (108, N'4804', N'4.5  ', 49368.0000, 4114.0000, 23.6400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (109, N'4804', N'5.0  ', 50496.0000, 4208.0000, 24.1800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (110, N'4804', N'5.5  ', 51720.0000, 4310.0000, 24.7700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (111, N'4804', N'6.0  ', 52920.0000, 4410.0000, 25.3500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (112, N'4804', N'6.5  ', 54168.0000, 4514.0000, 25.9400, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (113, N'4804', N'7.0  ', 55452.0000, 4621.0000, 26.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (114, N'4804', N'7.5  ', 56784.0000, 4732.0000, 27.1900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (115, N'4804', N'8.0  ', 58116.0000, 4843.0000, 27.8300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (116, N'4805', N'1.0  ', 35640.0000, 2970.0000, 17.0700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (117, N'4805', N'1.5  ', 36420.0000, 3035.0000, 17.4400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (118, N'4805', N'2.0  ', 37212.0000, 3101.0000, 17.8200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (119, N'4805', N'2.5  ', 37968.0000, 3164.0000, 18.1800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (120, N'4805', N'3.0  ', 38868.0000, 3239.0000, 18.6100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (121, N'4805', N'3.5  ', 39732.0000, 3311.0000, 19.0300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (122, N'4805', N'4.0  ', 40704.0000, 3392.0000, 19.4900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (123, N'4805', N'4.5  ', 41640.0000, 3470.0000, 19.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (124, N'4805', N'5.0  ', 42588.0000, 3549.0000, 20.3900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (125, N'4805', N'5.5  ', 43596.0000, 3633.0000, 20.8800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (126, N'4805', N'6.0  ', 44628.0000, 3719.0000, 21.3700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (127, N'4805', N'6.5  ', 45684.0000, 3807.0000, 21.8800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (128, N'4805', N'7.0  ', 46764.0000, 3897.0000, 22.4000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (129, N'4805', N'7.5  ', 47892.0000, 3991.0000, 22.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (130, N'4805', N'8.0  ', 48996.0000, 4083.0000, 23.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (161, N'6102', N'1.0  ', 42000.0000, 3500.0000, 20.1100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (162, N'6102', N'1.5  ', 42924.0000, 3577.0000, 20.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (179, N'6102', N'10.0 ', 62124.0000, 5177.0000, 29.7500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (180, N'6102', N'11.0 ', 63492.0000, 5291.0000, 30.4100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (163, N'6102', N'2.0  ', 43860.0000, 3655.0000, 21.0100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (164, N'6102', N'2.5  ', 44820.0000, 3735.0000, 21.4700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (165, N'6102', N'3.0  ', 45804.0000, 3817.0000, 21.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (166, N'6102', N'3.5  ', 46824.0000, 3902.0000, 22.4300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (167, N'6102', N'4.0  ', 47844.0000, 3987.0000, 22.9200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (168, N'6102', N'4.5  ', 48888.0000, 4074.0000, 23.4200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (169, N'6102', N'5.0  ', 49992.0000, 4166.0000, 23.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (170, N'6102', N'5.5  ', 51084.0000, 4257.0000, 24.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (171, N'6102', N'6.0  ', 52200.0000, 4350.0000, 25.0000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (172, N'6102', N'6.5  ', 53364.0000, 4447.0000, 25.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (173, N'6102', N'7.0  ', 54516.0000, 4543.0000, 26.1100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (174, N'6102', N'7.5  ', 55728.0000, 4644.0000, 26.6900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (175, N'6102', N'8.0  ', 56940.0000, 4745.0000, 27.2700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (176, N'6102', N'8.5  ', 58200.0000, 4850.0000, 27.8700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (177, N'6102', N'9.0  ', 59484.0000, 4957.0000, 28.4900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (178, N'6102', N'9.5  ', 60780.0000, 5065.0000, 29.1100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (181, N'6112', N'1.0  ', 35748.0000, 2979.0000, 17.1200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (182, N'6112', N'1.5  ', 36564.0000, 3047.0000, 17.5100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (183, N'6112', N'2.0  ', 37368.0000, 3114.0000, 17.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (184, N'6112', N'2.5  ', 38268.0000, 3189.0000, 18.3300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (185, N'6112', N'3.0  ', 39132.0000, 3261.0000, 18.7400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (186, N'6112', N'3.5  ', 40080.0000, 3340.0000, 19.2000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (187, N'6112', N'4.0  ', 41052.0000, 3421.0000, 19.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (188, N'6112', N'4.5  ', 41952.0000, 3496.0000, 20.0900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (189, N'6112', N'5.0  ', 42936.0000, 3578.0000, 20.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (190, N'6113', N'1.0  ', 29544.0000, 2462.0000, 14.1500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (191, N'6113', N'1.5  ', 30144.0000, 2512.0000, 14.4300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (192, N'6113', N'2.0  ', 30756.0000, 2563.0000, 14.7300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (193, N'6113', N'2.5  ', 31380.0000, 2615.0000, 15.0300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (194, N'6113', N'3.0  ', 32088.0000, 2674.0000, 15.3700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (195, N'6113', N'3.5  ', 32820.0000, 2735.0000, 15.7200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (196, N'6113', N'4.0  ', 33528.0000, 2794.0000, 16.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (197, N'6113', N'4.5  ', 34212.0000, 2851.0000, 16.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (198, N'6113', N'5.0  ', 34932.0000, 2911.0000, 16.7300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (199, N'6760', N'1.0  ', 34046.0000, 2837.0000, 16.3100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (200, N'6760', N'1.5  ', 34849.0000, 2904.0000, 16.6900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (201, N'6760', N'2.0  ', 35576.0000, 2965.0000, 17.0400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (202, N'6760', N'2.5  ', 36341.0000, 3028.0000, 17.4000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (203, N'6760', N'3.0  ', 37093.0000, 3091.0000, 17.7700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (204, N'6760', N'3.5  ', 37883.0000, 3157.0000, 18.1400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (205, N'6760', N'4.0  ', 38673.0000, 3223.0000, 18.5200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (206, N'6760', N'4.5  ', 39626.0000, 3302.0000, 18.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (207, N'6760', N'5.0  ', 40454.0000, 3371.0000, 19.3700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (208, N'6760', N'5.5  ', 41369.0000, 3447.0000, 19.8100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (209, N'6760', N'6.0  ', 42260.0000, 3522.0000, 20.2400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (210, N'6760', N'6.5  ', 43225.0000, 3602.0000, 20.7000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (211, N'6760', N'7.0  ', 44166.0000, 3680.0000, 21.1500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (212, N'6761', N'1.0  ', 30384.0000, 2532.0000, 14.5500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (213, N'6761', N'1.5  ', 30961.0000, 2580.0000, 14.8300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (214, N'6761', N'2.0  ', 31488.0000, 2624.0000, 15.0800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (215, N'6761', N'2.5  ', 32090.0000, 2674.0000, 15.3700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (216, N'6761', N'3.0  ', 32729.0000, 2727.0000, 15.6800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (217, N'6761', N'3.5  ', 33369.0000, 2781.0000, 15.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (218, N'6761', N'4.0  ', 34134.0000, 2844.0000, 16.3500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (219, N'6761', N'4.5  ', 34936.0000, 2911.0000, 16.7300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (220, N'6761', N'5.0  ', 35664.0000, 2972.0000, 17.0800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (221, N'6761', N'5.5  ', 36454.0000, 3038.0000, 17.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (222, N'6761', N'6.0  ', 37256.0000, 3105.0000, 17.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (223, N'6761', N'6.5  ', 38097.0000, 3175.0000, 18.2500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (224, N'6761', N'7.0  ', 38949.0000, 3246.0000, 18.6500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (225, N'7171', N'1.0  ', 42936.0000, 3578.0000, 20.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (226, N'7171', N'1.5  ', 43872.0000, 3656.0000, 21.0100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (227, N'7171', N'2.0  ', 44892.0000, 3741.0000, 21.5000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (228, N'7171', N'2.5  ', 45984.0000, 3832.0000, 22.0200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (229, N'7171', N'3.0  ', 47112.0000, 3926.0000, 22.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (230, N'7171', N'3.5  ', 48180.0000, 4015.0000, 23.0800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (231, N'7171', N'4.0  ', 49344.0000, 4112.0000, 23.6300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (232, N'7171', N'4.5  ', 50484.0000, 4207.0000, 24.1800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (233, N'7171', N'5.0  ', 51708.0000, 4309.0000, 24.7600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (514, N'7172', N'1.0  ', 35928.0000, 2994.0000, 17.2100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (515, N'7172', N'1.5  ', 36744.0000, 3062.0000, 17.6000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (516, N'7172', N'2.0  ', 37560.0000, 3130.0000, 17.9900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (517, N'7172', N'2.5  ', 38448.0000, 3204.0000, 18.4100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (518, N'7172', N'3.0  ', 39336.0000, 3278.0000, 18.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (519, N'7172', N'3.5  ', 40284.0000, 3357.0000, 19.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (520, N'7172', N'4.0  ', 41256.0000, 3438.0000, 19.7600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (521, N'7172', N'4.5  ', 42156.0000, 3513.0000, 20.1900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (522, N'7172', N'5.0  ', 43140.0000, 3595.0000, 20.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (234, N'7684', N'1.0  ', 37368.0000, 3114.0000, 17.9000, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (235, N'7684', N'1.5  ', 38268.0000, 3189.0000, 18.3300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (236, N'7684', N'2.0  ', 39132.0000, 3261.0000, 18.7400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (237, N'7684', N'2.5  ', 40080.0000, 3340.0000, 19.2000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (238, N'7684', N'3.0  ', 41052.0000, 3421.0000, 19.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (239, N'7684', N'3.5  ', 41952.0000, 3496.0000, 20.0900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (240, N'7684', N'4.0  ', 42936.0000, 3578.0000, 20.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (241, N'7684', N'4.5  ', 43872.0000, 3656.0000, 21.0100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (242, N'7684', N'5.0  ', 44892.0000, 3741.0000, 21.5000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (243, N'7704', N'1.0  ', 37560.0000, 3130.0000, 17.9900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (244, N'7704', N'1.5  ', 38448.0000, 3204.0000, 18.4100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (245, N'7704', N'2.0  ', 39336.0000, 3278.0000, 18.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (246, N'7704', N'2.5  ', 40284.0000, 3357.0000, 19.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (247, N'7704', N'3.0  ', 41256.0000, 3438.0000, 19.7600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (248, N'7704', N'3.5  ', 42156.0000, 3513.0000, 20.1900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (249, N'7704', N'4.0  ', 43140.0000, 3595.0000, 20.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (250, N'7704', N'4.5  ', 44100.0000, 3675.0000, 21.1200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (251, N'7704', N'5.0  ', 45120.0000, 3760.0000, 21.6100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (575, N'8522', N'1st  ', 51884.0000, 4324.0000, 24.8500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (577, N'8522', N'3rd  ', 61314.0000, 5110.0000, 29.3700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (578, N'8522', N'Max  ', 66036.0000, 5503.0000, 31.6300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (576, N'8522', N'Mid  ', 56593.0000, 4716.0000, 27.1000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (574, N'8522', N'Min  ', 47175.0000, 3931.0000, 22.5900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (252, N'8651', N'1.0  ', 49344.0000, 4112.0000, 23.6300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (253, N'8651', N'1.5  ', 50484.0000, 4207.0000, 24.1800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (254, N'8651', N'2.0  ', 51708.0000, 4309.0000, 24.7600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (255, N'8651', N'2.5  ', 52980.0000, 4415.0000, 25.3700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (256, N'8651', N'3.0  ', 54252.0000, 4521.0000, 25.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (257, N'8651', N'3.5  ', 55380.0000, 4615.0000, 26.5200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (258, N'8651', N'4.0  ', 56736.0000, 4728.0000, 27.1700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (259, N'8651', N'4.5  ', 58128.0000, 4844.0000, 27.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (260, N'8651', N'5.0  ', 59544.0000, 4962.0000, 28.5200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (588, N'9139', N'1    ', 78839.0000, 6570.0000, 37.7600, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (261, N'9139', N'1.0  ', 78839.0000, 6570.0000, 37.7600, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (597, N'9139', N'10   ', 94192.0000, 7849.0000, 45.1100, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (270, N'9139', N'10.0 ', 94192.0000, 7849.0000, 45.1100, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (598, N'9139', N'11   ', 96112.0000, 8009.0000, 46.0300, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (271, N'9139', N'11.0 ', 96112.0000, 8009.0000, 46.0300, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (599, N'9139', N'12   ', 98008.0000, 8167.0000, 46.9400, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (272, N'9139', N'12.0 ', 98008.0000, 8167.0000, 46.9400, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (600, N'9139', N'13   ', 99966.0000, 8331.0000, 47.8800, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (273, N'9139', N'13.0 ', 99966.0000, 8331.0000, 47.8800, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (601, N'9139', N'14   ', 101964.0000, 8497.0000, 48.8300, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (274, N'9139', N'14.0 ', 101964.0000, 8497.0000, 48.8300, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (602, N'9139', N'15   ', 103999.0000, 8667.0000, 49.8100, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (275, N'9139', N'15.0 ', 103999.0000, 8667.0000, 49.8100, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (589, N'9139', N'2    ', 80416.0000, 6701.0000, 38.5100, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (262, N'9139', N'2.0  ', 80416.0000, 6701.0000, 38.5100, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (590, N'9139', N'3    ', 82019.0000, 6835.0000, 39.2800, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (263, N'9139', N'3.0  ', 82019.0000, 6835.0000, 39.2800, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (591, N'9139', N'4    ', 83672.0000, 6973.0000, 40.0700, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (264, N'9139', N'4.0  ', 83672.0000, 6973.0000, 40.0700, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (592, N'9139', N'5    ', 85351.0000, 7113.0000, 40.8800, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (265, N'9139', N'5.0  ', 85351.0000, 7113.0000, 40.8800, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (593, N'9139', N'6    ', 87043.0000, 7254.0000, 41.6900, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (266, N'9139', N'6.0  ', 87043.0000, 7254.0000, 41.6900, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (594, N'9139', N'7    ', 88786.0000, 7399.0000, 42.5200, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (267, N'9139', N'7.0  ', 88786.0000, 7399.0000, 42.5200, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (595, N'9139', N'8    ', 90554.0000, 7546.0000, 43.3700, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (268, N'9139', N'8.0  ', 90554.0000, 7546.0000, 43.3700, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (596, N'9139', N'9    ', 92347.0000, 7696.0000, 44.2300, CAST(0x00009A7100000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (269, N'9139', N'9.0  ', 92347.0000, 7696.0000, 44.2300, CAST(0x00009A5200000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (276, N'9520', N'1.0  ', 50621.0000, 4218.0000, 24.2400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (285, N'9520', N'10.0 ', 60486.0000, 5041.0000, 28.9700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (286, N'9520', N'11.0 ', 61695.0000, 5141.0000, 29.5500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (287, N'9520', N'12.0 ', 62940.0000, 5245.0000, 30.1400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (288, N'9520', N'13.0 ', 64186.0000, 5349.0000, 30.7400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (289, N'9520', N'14.0 ', 65469.0000, 5456.0000, 31.3500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (290, N'9520', N'15.0 ', 66777.0000, 5565.0000, 31.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (291, N'9520', N'16.0 ', 68109.0000, 5676.0000, 32.6200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (292, N'9520', N'17.0 ', 69467.0000, 5789.0000, 33.2700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (293, N'9520', N'18.0 ', 70850.0000, 5904.0000, 33.9300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (294, N'9520', N'19.0 ', 72257.0000, 6021.0000, 34.6100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (277, N'9520', N'2.0  ', 51630.0000, 4303.0000, 24.7300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (295, N'9520', N'20.0 ', 73715.0000, 6143.0000, 35.3000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (296, N'9520', N'21.0 ', 75184.0000, 6265.0000, 36.0100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (297, N'9520', N'22.0 ', 76692.0000, 6391.0000, 36.7300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (298, N'9520', N'23.0 ', 78224.0000, 6519.0000, 37.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (299, N'9520', N'24.0 ', 79793.0000, 6649.0000, 38.2200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (300, N'9520', N'25.0 ', 81388.0000, 6782.0000, 38.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (278, N'9520', N'3.0  ', 52664.0000, 4389.0000, 25.2200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (279, N'9520', N'4.0  ', 53710.0000, 4476.0000, 25.7200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (280, N'9520', N'5.0  ', 54794.0000, 4566.0000, 26.2400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (281, N'9520', N'6.0  ', 55878.0000, 4656.0000, 26.7600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (282, N'9520', N'7.0  ', 57011.0000, 4751.0000, 27.3000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (283, N'9520', N'8.0  ', 58132.0000, 4844.0000, 27.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (284, N'9520', N'9.0  ', 59303.0000, 4942.0000, 28.4000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (579, N'9523', N'1.0  ', 37692.0000, 3141.0000, 18.0500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (580, N'9523', N'1.5  ', 38544.0000, 3212.0000, 18.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (581, N'9523', N'2.0  ', 39336.0000, 3278.0000, 18.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (582, N'9523', N'2.5  ', 40236.0000, 3353.0000, 19.2700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (583, N'9523', N'3.0  ', 41112.0000, 3426.0000, 19.6900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (584, N'9523', N'3.5  ', 42096.0000, 3508.0000, 20.1600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (585, N'9523', N'4.0  ', 43044.0000, 3587.0000, 20.6100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (586, N'9523', N'4.5  ', 44100.0000, 3675.0000, 21.1200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (587, N'9523', N'5.0  ', 45144.0000, 3762.0000, 21.6200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (301, N'9524', N'1.0  ', 33504.0000, 2792.0000, 16.0400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (302, N'9524', N'1.5  ', 34200.0000, 2850.0000, 16.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (303, N'9524', N'2.0  ', 34944.0000, 2912.0000, 16.7400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (304, N'9524', N'2.5  ', 35760.0000, 2980.0000, 17.1300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (305, N'9524', N'3.0  ', 36516.0000, 3043.0000, 17.4900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (306, N'9524', N'3.5  ', 37260.0000, 3105.0000, 17.8400, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 300 total records'
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (307, N'9524', N'4.0  ', 38052.0000, 3171.0000, 18.2200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (308, N'9524', N'4.5  ', 38904.0000, 3242.0000, 18.6300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (309, N'9524', N'5.0  ', 39708.0000, 3309.0000, 19.0200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (310, N'9525', N'1.0  ', 31344.0000, 2612.0000, 15.0100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (311, N'9525', N'1.5  ', 31968.0000, 2664.0000, 15.3100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (312, N'9525', N'2.0  ', 32508.0000, 2709.0000, 15.5700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (313, N'9525', N'2.5  ', 33180.0000, 2765.0000, 15.8900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (314, N'9525', N'3.0  ', 33835.0000, 2820.0000, 16.2000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (315, N'9525', N'3.5  ', 34536.0000, 2878.0000, 16.5400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (316, N'9525', N'4.0  ', 35292.0000, 2941.0000, 16.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (317, N'9525', N'4.5  ', 36120.0000, 3010.0000, 17.3000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (318, N'9525', N'5.0  ', 36876.0000, 3073.0000, 17.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (319, N'9602', N'1.0  ', 33528.0000, 2794.0000, 16.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (320, N'9602', N'1.5  ', 34212.0000, 2851.0000, 16.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (321, N'9602', N'2.0  ', 34932.0000, 2911.0000, 16.7300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (322, N'9602', N'2.5  ', 35724.0000, 2977.0000, 17.1100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (323, N'9602', N'3.0  ', 36444.0000, 3037.0000, 17.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (324, N'9602', N'3.5  ', 37272.0000, 3106.0000, 17.8500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (325, N'9602', N'4.0  ', 38100.0000, 3175.0000, 18.2500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (326, N'9602', N'4.5  ', 39012.0000, 3251.0000, 18.6800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (327, N'9602', N'5.0  ', 39900.0000, 3325.0000, 19.1100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (328, N'9603', N'1.0  ', 29076.0000, 2423.0000, 13.9300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (329, N'9603', N'1.5  ', 29652.0000, 2471.0000, 14.2000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (330, N'9603', N'2.0  ', 30132.0000, 2511.0000, 14.4300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (331, N'9603', N'2.5  ', 30744.0000, 2562.0000, 14.7300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (332, N'9603', N'3.0  ', 31368.0000, 2614.0000, 15.0200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (333, N'9603', N'3.5  ', 32004.0000, 2667.0000, 15.3300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (334, N'9603', N'4.0  ', 32724.0000, 2727.0000, 15.6700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (335, N'9603', N'4.5  ', 33456.0000, 2788.0000, 16.0300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (336, N'9603', N'5.0  ', 34200.0000, 2850.0000, 16.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (337, N'9605', N'1.0  ', 26004.0000, 2167.0000, 12.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (338, N'9605', N'1.5  ', 26508.0000, 2209.0000, 12.6900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (339, N'9605', N'2.0  ', 27024.0000, 2252.0000, 12.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (340, N'9605', N'2.5  ', 27492.0000, 2291.0000, 13.1700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (341, N'9605', N'3.0  ', 27960.0000, 2330.0000, 13.3900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (342, N'9605', N'3.5  ', 28512.0000, 2376.0000, 13.6500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (343, N'9605', N'4.0  ', 29076.0000, 2423.0000, 13.9300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (344, N'9605', N'4.5  ', 29652.0000, 2471.0000, 14.2000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (345, N'9605', N'5.0  ', 30132.0000, 2511.0000, 14.4300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (346, N'9610', N'1.0  ', 45975.0000, 3831.0000, 22.0200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (355, N'9610', N'10.0 ', 54943.0000, 4579.0000, 26.3100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (356, N'9610', N'11.0 ', 56040.0000, 4670.0000, 26.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (357, N'9610', N'12.0 ', 57161.0000, 4763.0000, 27.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (358, N'9610', N'13.0 ', 58319.0000, 4860.0000, 27.9300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (359, N'9610', N'14.0 ', 59465.0000, 4955.0000, 28.4800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (360, N'9610', N'15.0 ', 60661.0000, 5055.0000, 29.0500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (361, N'9610', N'16.0 ', 61869.0000, 5156.0000, 29.6300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (362, N'9610', N'17.0 ', 63115.0000, 5260.0000, 30.2300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (363, N'9610', N'18.0 ', 64373.0000, 5364.0000, 30.8300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (364, N'9610', N'19.0 ', 65668.0000, 5472.0000, 31.4500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (347, N'9610', N'2.0  ', 46897.0000, 3908.0000, 22.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (365, N'9610', N'20.0 ', 66976.0000, 5581.0000, 32.0800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (366, N'9610', N'21.0 ', 68321.0000, 5693.0000, 32.7200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (367, N'9610', N'22.0 ', 69704.0000, 5809.0000, 33.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (368, N'9610', N'23.0 ', 71099.0000, 5925.0000, 34.0500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (369, N'9610', N'24.0 ', 72531.0000, 6044.0000, 34.7400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (370, N'9610', N'25.0 ', 73976.0000, 6165.0000, 35.4300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (348, N'9610', N'3.0  ', 47831.0000, 3986.0000, 22.9100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (349, N'9610', N'4.0  ', 48790.0000, 4066.0000, 23.3700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (350, N'9610', N'5.0  ', 49762.0000, 4147.0000, 23.8300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (351, N'9610', N'6.0  ', 50746.0000, 4229.0000, 24.3000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (352, N'9610', N'7.0  ', 51767.0000, 4314.0000, 24.7900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (353, N'9610', N'8.0  ', 52801.0000, 4400.0000, 25.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (354, N'9610', N'9.0  ', 53872.0000, 4489.0000, 25.8000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (371, N'9611', N'1.0  ', 41815.0000, 3485.0000, 20.0300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (380, N'9611', N'10.0 ', 49973.0000, 4164.0000, 23.9300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (381, N'9611', N'11.0 ', 50970.0000, 4247.0000, 24.4100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (382, N'9611', N'12.0 ', 51991.0000, 4333.0000, 24.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (383, N'9611', N'13.0 ', 53038.0000, 4420.0000, 25.4000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (384, N'9611', N'14.0 ', 54084.0000, 4507.0000, 25.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (385, N'9611', N'15.0 ', 55168.0000, 4597.0000, 26.4200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (386, N'9611', N'16.0 ', 56276.0000, 4690.0000, 26.9500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (387, N'9611', N'17.0 ', 57410.0000, 4784.0000, 27.5000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (388, N'9611', N'18.0 ', 58543.0000, 4879.0000, 28.0400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (389, N'9611', N'19.0 ', 59727.0000, 4977.0000, 28.6000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (372, N'9611', N'2.0  ', 42649.0000, 3554.0000, 20.4300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (390, N'9611', N'20.0 ', 60922.0000, 5077.0000, 29.1800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (391, N'9611', N'21.0 ', 62131.0000, 5178.0000, 29.7600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (392, N'9611', N'22.0 ', 63376.0000, 5281.0000, 30.3500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (393, N'9611', N'23.0 ', 64634.0000, 5386.0000, 30.9600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (394, N'9611', N'24.0 ', 65930.0000, 5494.0000, 31.5800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (395, N'9611', N'25.0 ', 67250.0000, 5604.0000, 32.2100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (373, N'9611', N'3.0  ', 43509.0000, 3626.0000, 20.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (374, N'9611', N'4.0  ', 44381.0000, 3698.0000, 21.2600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (375, N'9611', N'5.0  ', 45265.0000, 3772.0000, 21.6800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (376, N'9611', N'6.0  ', 46174.0000, 3848.0000, 22.1100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (377, N'9611', N'7.0  ', 47096.0000, 3925.0000, 22.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (378, N'9611', N'8.0  ', 48030.0000, 4003.0000, 23.0000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (379, N'9611', N'9.0  ', 48989.0000, 4082.0000, 23.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (396, N'9612', N'1.0  ', 37929.0000, 3161.0000, 18.1700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (405, N'9612', N'10.0 ', 45340.0000, 3778.0000, 21.7100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (406, N'9612', N'11.0 ', 46249.0000, 3854.0000, 22.1500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (407, N'9612', N'12.0 ', 47171.0000, 3931.0000, 22.5900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (408, N'9612', N'13.0 ', 48118.0000, 4010.0000, 23.0400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (409, N'9612', N'14.0 ', 49089.0000, 4091.0000, 23.5100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (410, N'9612', N'15.0 ', 50061.0000, 4172.0000, 23.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (411, N'9612', N'16.0 ', 51070.0000, 4256.0000, 24.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (412, N'9612', N'17.0 ', 52079.0000, 4340.0000, 24.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (413, N'9612', N'18.0 ', 53125.0000, 4427.0000, 25.4400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (414, N'9612', N'19.0 ', 54184.0000, 4515.0000, 25.9500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (397, N'9612', N'2.0  ', 38701.0000, 3225.0000, 18.5300, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 400 total records'
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (415, N'9612', N'20.0 ', 55280.0000, 4607.0000, 26.4700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (416, N'9612', N'21.0 ', 56376.0000, 4698.0000, 27.0000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (417, N'9612', N'22.0 ', 57522.0000, 4793.0000, 27.5500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (418, N'9612', N'23.0 ', 58655.0000, 4888.0000, 28.0900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (419, N'9612', N'24.0 ', 59839.0000, 4987.0000, 28.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (420, N'9612', N'25.0 ', 61034.0000, 5086.0000, 29.2300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (398, N'9612', N'3.0  ', 39473.0000, 3289.0000, 18.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (399, N'9612', N'4.0  ', 40270.0000, 3356.0000, 19.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (400, N'9612', N'5.0  ', 41067.0000, 3422.0000, 19.6700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (401, N'9612', N'6.0  ', 41890.0000, 3491.0000, 20.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (402, N'9612', N'7.0  ', 42724.0000, 3560.0000, 20.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (403, N'9612', N'8.0  ', 43584.0000, 3632.0000, 20.8700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (404, N'9612', N'9.0  ', 44455.0000, 3705.0000, 21.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (421, N'9613', N'1.0  ', 34864.0000, 2905.0000, 16.7000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (422, N'9613', N'2.0  ', 35624.0000, 2969.0000, 17.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (423, N'9613', N'3.0  ', 36334.0000, 3028.0000, 17.4000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (424, N'9613', N'4.0  ', 37169.0000, 3097.0000, 17.8000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (425, N'9613', N'5.0  ', 37966.0000, 3164.0000, 18.1800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (426, N'9613', N'6.0  ', 38850.0000, 3238.0000, 18.6100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (427, N'9613', N'7.0  ', 39697.0000, 3308.0000, 19.0100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (428, N'9613', N'8.0  ', 40669.0000, 3389.0000, 19.4800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (429, N'9613', N'9.0  ', 41591.0000, 3466.0000, 19.9200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (430, N'9617', N'1.0  ', 37929.0000, 3161.0000, 18.1700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (439, N'9617', N'10.0 ', 45340.0000, 3778.0000, 21.7100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (440, N'9617', N'11.0 ', 46249.0000, 3854.0000, 22.1500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (441, N'9617', N'12.0 ', 47171.0000, 3931.0000, 22.5900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (442, N'9617', N'13.0 ', 48118.0000, 4010.0000, 23.0400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (443, N'9617', N'14.0 ', 49089.0000, 4091.0000, 23.5100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (444, N'9617', N'15.0 ', 50061.0000, 4172.0000, 23.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (445, N'9617', N'16.0 ', 51070.0000, 4256.0000, 24.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (446, N'9617', N'17.0 ', 52079.0000, 4340.0000, 24.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (447, N'9617', N'18.0 ', 53125.0000, 4427.0000, 25.4400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (448, N'9617', N'19.0 ', 54184.0000, 4515.0000, 25.9500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (431, N'9617', N'2.0  ', 38701.0000, 3225.0000, 18.5300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (449, N'9617', N'20.0 ', 55280.0000, 4607.0000, 26.4700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (450, N'9617', N'21.0 ', 56376.0000, 4698.0000, 27.0000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (451, N'9617', N'22.0 ', 57522.0000, 4793.0000, 27.5500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (452, N'9617', N'23.0 ', 58655.0000, 4888.0000, 28.0900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (453, N'9617', N'24.0 ', 59839.0000, 4987.0000, 28.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (454, N'9617', N'25.0 ', 61034.0000, 5086.0000, 29.2300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (432, N'9617', N'3.0  ', 39473.0000, 3289.0000, 18.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (433, N'9617', N'4.0  ', 40270.0000, 3356.0000, 19.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (434, N'9617', N'5.0  ', 41067.0000, 3422.0000, 19.6700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (435, N'9617', N'6.0  ', 41890.0000, 3491.0000, 20.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (436, N'9617', N'7.0  ', 42724.0000, 3560.0000, 20.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (437, N'9617', N'8.0  ', 43584.0000, 3632.0000, 20.8700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (438, N'9617', N'9.0  ', 44455.0000, 3705.0000, 21.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (455, N'9722', N'1.0  ', 45975.0000, 3831.0000, 22.0200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (464, N'9722', N'10.0 ', 54943.0000, 4579.0000, 26.3100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (465, N'9722', N'11.0 ', 56040.0000, 4670.0000, 26.8400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (466, N'9722', N'12.0 ', 57161.0000, 4763.0000, 27.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (467, N'9722', N'13.0 ', 58319.0000, 4860.0000, 27.9300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (468, N'9722', N'14.0 ', 59465.0000, 4955.0000, 28.4800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (469, N'9722', N'15.0 ', 60661.0000, 5055.0000, 29.0500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (470, N'9722', N'16.0 ', 61869.0000, 5156.0000, 29.6300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (471, N'9722', N'17.0 ', 63115.0000, 5260.0000, 30.2300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (472, N'9722', N'18.0 ', 64373.0000, 5364.0000, 30.8300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (473, N'9722', N'19.0 ', 65668.0000, 5472.0000, 31.4500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (456, N'9722', N'2.0  ', 46897.0000, 3908.0000, 22.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (474, N'9722', N'20.0 ', 66976.0000, 5581.0000, 32.0800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (475, N'9722', N'21.0 ', 68321.0000, 5693.0000, 32.7200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (476, N'9722', N'22.0 ', 69704.0000, 5809.0000, 33.3800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (477, N'9722', N'23.0 ', 71099.0000, 5925.0000, 34.0500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (478, N'9722', N'24.0 ', 72531.0000, 6044.0000, 34.7400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (479, N'9722', N'25.0 ', 73976.0000, 6161.0000, 35.4300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (457, N'9722', N'3.0  ', 47831.0000, 3986.0000, 22.9100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (458, N'9722', N'4.0  ', 48790.0000, 4066.0000, 23.3700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (459, N'9722', N'5.0  ', 49762.0000, 4147.0000, 23.8300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (460, N'9722', N'6.0  ', 50746.0000, 4229.0000, 24.3000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (461, N'9722', N'7.0  ', 51767.0000, 4314.0000, 24.7900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (462, N'9722', N'8.0  ', 52801.0000, 4400.0000, 25.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (463, N'9722', N'9.0  ', 53872.0000, 4489.0000, 25.8000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (480, N'9723', N'1.0  ', 37929.0000, 3161.0000, 18.1700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (489, N'9723', N'10.0 ', 45340.0000, 3778.0000, 21.7100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (490, N'9723', N'11.0 ', 46249.0000, 3854.0000, 22.1500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (491, N'9723', N'12.0 ', 47171.0000, 3931.0000, 22.5900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (492, N'9723', N'13.0 ', 48118.0000, 4010.0000, 23.0400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (493, N'9723', N'14.0 ', 49089.0000, 4091.0000, 23.5100, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (494, N'9723', N'15.0 ', 50061.0000, 4172.0000, 23.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (495, N'9723', N'16.0 ', 51070.0000, 4256.0000, 24.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (496, N'9723', N'17.0 ', 52079.0000, 4340.0000, 24.9400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (497, N'9723', N'18.0 ', 53125.0000, 4427.0000, 25.4400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (498, N'9723', N'19.0 ', 54184.0000, 4515.0000, 25.9500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (481, N'9723', N'2.0  ', 38701.0000, 3225.0000, 18.5300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (499, N'9723', N'20.0 ', 55280.0000, 4607.0000, 26.4700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (500, N'9723', N'21.0 ', 56376.0000, 4698.0000, 27.0000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (501, N'9723', N'22.0 ', 57522.0000, 4793.0000, 27.5500, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (502, N'9723', N'23.0 ', 58655.0000, 4888.0000, 28.0900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (503, N'9723', N'24.0 ', 59839.0000, 4987.0000, 28.6600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (504, N'9723', N'25.0 ', 61034.0000, 5086.0000, 29.2300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (482, N'9723', N'3.0  ', 39473.0000, 3289.0000, 18.9000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (483, N'9723', N'4.0  ', 40270.0000, 3356.0000, 19.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (484, N'9723', N'5.0  ', 41067.0000, 3422.0000, 19.6700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (485, N'9723', N'6.0  ', 41890.0000, 3491.0000, 20.0600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (486, N'9723', N'7.0  ', 42724.0000, 3560.0000, 20.4600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (487, N'9723', N'8.0  ', 43584.0000, 3632.0000, 20.8700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (488, N'9723', N'9.0  ', 44455.0000, 3705.0000, 21.2900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (505, N'9724', N'1.0  ', 34715.0000, 2893.0000, 16.6300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (506, N'9724', N'2.0  ', 35642.0000, 2955.0000, 16.9800, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (507, N'9724', N'3.0  ', 36172.0000, 3014.0000, 17.3200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (508, N'9724', N'4.0  ', 37007.0000, 3084.0000, 17.7200, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 500 total records'
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (509, N'9724', N'5.0  ', 37792.0000, 3149.0000, 18.1000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (510, N'9724', N'6.0  ', 38676.0000, 3223.0000, 18.5200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (511, N'9724', N'7.0  ', 39523.0000, 3294.0000, 18.9300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (512, N'9724', N'8.0  ', 40482.0000, 3374.0000, 19.3900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (513, N'9724', N'9.0  ', 41416.0000, 3451.0000, 19.8400, CAST(0x000099BA00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SalarySteps] OFF
/****** Object:  Table [dbo].[SalaryScale]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalaryScale](
	[SalaryScaleID] [int] IDENTITY(101,1) NOT NULL,
	[TitleCode] [char](4) NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[BargainingCode] [char](2) NULL,
	[NumSalarySteps] [smallint] NULL,
	[LaborMarketWAS] [money] NULL,
	[LaborMarketMidAnnual] [money] NULL,
	[CollegeAvgAnnual] [money] NULL,
	[CampusAvgAnnual] [money] NULL,
	[SalaryGrade] [char](4) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [SalaryScale_TitleCodeEffectiveDateUDX] ON [dbo].[SalaryScale] 
(
	[TitleCode] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SalaryScale] ON
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (101, N'4001', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (102, N'4002', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (103, N'4003', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (104, N'4004', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (105, N'4102', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (106, N'4103', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (107, N'4119', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (108, N'4121', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (109, N'4212', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (110, N'4213', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 42426.0000, 42426.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (111, N'4348', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 48663.0000, 48663.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (112, N'4351', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (113, N'4352', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (114, N'4353', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 56616.4000, 56950.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (115, N'4354', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 50164.8000, 49273.6875, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (116, N'4355', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (117, N'4356', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 64413.5000, 64413.5000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (118, N'4357', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (119, N'4358', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (120, N'4359', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (121, N'4403', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (122, N'4404', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (123, N'4414', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (124, N'4415', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (125, N'4416', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (126, N'4417', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (127, N'4419', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (128, N'4421', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (129, N'4423', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (130, N'4620', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (131, N'4624', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (132, N'4659', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (133, N'4660', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (134, N'4661', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (135, N'4672', CAST(0x000099BA00000000 AS DateTime), N'CX', 17, 0.0000, 0.0000, 26280.0000, 27729.0000, N'4672')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (136, N'4720', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (137, N'4721', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (138, N'4722', CAST(0x000099BA00000000 AS DateTime), N'CX', 17, 0.0000, 0.0000, 42942.2951, 42498.8400, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (139, N'4723', CAST(0x000099BA00000000 AS DateTime), N'CX', 17, 0.0000, 0.0000, 35962.0364, 36319.6262, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (140, N'4724', CAST(0x000099BA00000000 AS DateTime), N'CX', 17, 0.0000, 0.0000, 30280.5000, 31156.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (141, N'4725', CAST(0x000099BA00000000 AS DateTime), N'CX', 13, 0.0000, 0.0000, 45896.8000, 46563.0000, N'4725')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (142, N'4726', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 44581.0000, 44551.5000, N'4726')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (143, N'4727', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 40488.0000, 40488.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (144, N'4728', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (145, N'4761', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (146, N'4768', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (147, N'4802', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 53990.0000, 53990.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (148, N'4803', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (149, N'4804', CAST(0x000099BA00000000 AS DateTime), N'TX', 15, 0.0000, 0.0000, 48088.0000, 49325.0526, N'4804')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (150, N'4805', CAST(0x000099BA00000000 AS DateTime), N'TX', 15, 0.0000, 0.0000, 40216.0000, 40338.0000, N'4805')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (151, N'4811', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (152, N'4821', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (153, N'4826', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (154, N'5062', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 40141.0000, 40141.0000, N'5062')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (155, N'5068', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (156, N'5069', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (157, N'5070', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (158, N'5071', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (159, N'5110', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (160, N'5111', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (161, N'5112', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (162, N'5119', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (163, N'5218', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (164, N'5325', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (165, N'5330', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (166, N'5331', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (167, N'5337', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (168, N'5339', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (169, N'5420', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (170, N'5423', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 70692.0000, 70692.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (171, N'5424', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (172, N'5425', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (173, N'5426', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 59358.0000, 59358.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (174, N'5427', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (175, N'5440', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (176, N'5442', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (177, N'5443', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (178, N'5444', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (179, N'5447', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (180, N'5451', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (181, N'5454', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (182, N'6099', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (183, N'6100', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (184, N'6101', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (185, N'6102', CAST(0x000099BA00000000 AS DateTime), N'TX', 20, 0.0000, 0.0000, 48444.0000, 51064.8000, N'6102')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (186, N'6108', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (187, N'6109', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (188, N'6110', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (189, N'6112', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 37368.0000, 37368.0000, N'6112')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (190, N'6113', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 30144.0000, 32538.0000, N'6113')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (191, N'6191', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (192, N'6192', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (193, N'6193', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (194, N'6211', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (195, N'6212', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (196, N'6213', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (197, N'6214', CAST(0x00009B2A00000000 AS DateTime), N'TX', 0, NULL, NULL, NULL, NULL, N'6214')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (198, N'6215', CAST(0x00009B2A00000000 AS DateTime), N'TX', 0, NULL, NULL, NULL, NULL, N'6215')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (199, N'6219', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (200, N'6220', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
GO
print 'Processed 100 total records'
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (201, N'6282', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (202, N'6283', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (203, N'6306', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (204, N'6307', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (205, N'6308', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (206, N'6310', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (207, N'6311', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (208, N'6312', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (209, N'6313', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (210, N'6319', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (211, N'6329', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (212, N'6330', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (213, N'6331', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (214, N'6447', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (215, N'6448', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (216, N'6451', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (217, N'6452', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 58884.0000, 50773.2185, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (218, N'6453', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 43754.8000, 39194.8952, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (219, N'6454', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 38605.7500, 35064.9130, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (220, N'6757', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 49489.0000, 49489.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (221, N'6758', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (222, N'6760', CAST(0x000099BA00000000 AS DateTime), N'CX', 13, 0.0000, 0.0000, 38676.0000, 40020.0000, N'6760')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (223, N'6761', CAST(0x000099BA00000000 AS DateTime), N'CX', 13, 0.0000, 0.0000, 35664.0000, 35664.0000, N'6761')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (224, N'6765', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (225, N'6766', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (226, N'6767', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (227, N'6900', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (228, N'6902', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (229, N'6904', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (230, N'6905', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (231, N'6952', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (232, N'6953', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (233, N'6954', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (234, N'6955', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (235, N'6962', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (236, N'6963', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (237, N'6964', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (238, N'6965', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (239, N'6967', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (240, N'6968', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (241, N'6969', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (242, N'6974', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (243, N'6975', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (244, N'6976', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (245, N'6977', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (246, N'6978', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (247, N'7052', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (248, N'7053', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (249, N'7054', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (250, N'7100', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (251, N'7110', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (252, N'7112', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (253, N'7130', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (254, N'7132', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (255, N'7133', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (256, N'7134', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (257, N'7135', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (258, N'7136', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (259, N'7137', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (260, N'7151', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (261, N'7152', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (262, N'7153', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (263, N'7154', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (264, N'7156', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (265, N'7157', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (266, N'7171', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 42936.0000, 44460.0000, N'7171')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (267, N'7172', CAST(0x000099BA00000000 AS DateTime), N'99', 9, 0.0000, 0.0000, 0.0000, 0.0000, N'7172')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (268, N'7181', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (269, N'7182', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 69827.8000, 71580.8333, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (270, N'7183', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 60603.0000, 60603.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (271, N'7185', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (272, N'7186', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (273, N'7187', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (274, N'7188', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (275, N'7195', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (276, N'7208', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (277, N'7209', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (278, N'7211', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (279, N'7212', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 72334.0000, 72334.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (280, N'7213', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (281, N'7214', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (282, N'7231', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (283, N'7234', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 45663.8571, 47786.8824, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (284, N'7235', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 54513.5000, 54602.7368, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (285, N'7236', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 62227.7143, 60189.4545, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (286, N'7237', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 75480.8000, 72245.8000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (287, N'7238', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 56500.0000, 56500.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (288, N'7239', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (289, N'7245', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (290, N'7246', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 57767.0000, 59511.6000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (291, N'7247', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 62142.0000, 61538.7500, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (292, N'7248', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 67322.0000, 67680.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (293, N'7249', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 73668.0000, 70329.5000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (294, N'7250', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 91553.6000, 89560.8333, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (295, N'7273', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (296, N'7280', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (297, N'7281', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 43170.1250, 42957.5714, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (298, N'7282', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 85845.0000, 87027.5000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (299, N'7284', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 50805.6250, 51733.4000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (300, N'7285', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 61572.4706, 60610.8065, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (301, N'7286', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 66693.1429, 63875.3000, N'4   ')
GO
print 'Processed 200 total records'
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (302, N'7287', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 72590.0000, 72432.8571, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (303, N'7288', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 81453.0000, 76934.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (304, N'7289', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (305, N'7290', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (306, N'7291', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (307, N'7292', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 62488.0000, 62488.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (308, N'7293', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 68500.5000, 68500.5000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (309, N'7294', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 80723.7500, 80723.7500, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (310, N'7295', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 89863.0000, 89863.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (311, N'7296', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (312, N'7510', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 75311.0000, 77389.9091, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (313, N'7511', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 77984.1667, 75376.8889, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (314, N'7512', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 59723.0000, 58953.5714, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (315, N'7538', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (316, N'7539', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (317, N'7540', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (318, N'7541', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 73156.0000, 73156.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (319, N'7572', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (320, N'7573', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (321, N'7611', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (322, N'7612', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (323, N'7614', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (324, N'7616', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (325, N'7617', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (326, N'7618', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (327, N'7619', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (328, N'7620', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (329, N'7621', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (330, N'7622', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (331, N'7623', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (332, N'7624', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (333, N'7625', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (334, N'7631', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (335, N'7632', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (336, N'7633', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (337, N'7634', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 50893.0000, 52785.9231, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (338, N'7647', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (339, N'7648', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (340, N'7649', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (341, N'7650', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (342, N'7651', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (343, N'7652', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (344, N'7653', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (345, N'7654', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (346, N'7655', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (347, N'7656', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (348, N'7657', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (349, N'7658', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (350, N'7670', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (351, N'7671', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (352, N'7672', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (353, N'7675', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (354, N'7676', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (355, N'7678', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (356, N'7679', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (357, N'7680', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 68348.0000, 68348.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (358, N'7681', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (359, N'7682', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 76965.7600, 72014.4560, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (360, N'7683', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 50068.0000, 54323.7500, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (361, N'7684', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 43914.0000, 43914.0000, N'7684')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (362, N'7686', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (363, N'7693', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (364, N'7694', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (365, N'7695', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (366, N'7696', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (367, N'7698', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 51730.0000, 50962.6000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (368, N'7702', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (369, N'7703', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 59200.8000, 58126.2857, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (370, N'7704', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 43132.0000, 41448.0000, N'7704')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (371, N'7772', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (372, N'7773', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (373, N'7774', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (374, N'7775', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (375, N'7776', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (376, N'7778', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (377, N'7779', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (378, N'7780', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (379, N'7781', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (380, N'7782', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (381, N'8006', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (382, N'8007', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (383, N'8015', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (384, N'8016', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (385, N'8018', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (386, N'8021', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (387, N'8028', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (388, N'8031', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (389, N'8034', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (390, N'8035', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (391, N'8039', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (392, N'8040', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (393, N'8041', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (394, N'8072', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (395, N'8076', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8076')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (396, N'8082', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (397, N'8114', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (398, N'8115', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (399, N'8116', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (400, N'8118', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 70673.0000, 67506.2667, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (401, N'8119', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 51262.9167, 51122.4000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (402, N'8130', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
GO
print 'Processed 300 total records'
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (403, N'8131', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (404, N'8146', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (405, N'8148', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 44066.0000, 40556.5000, N'8148')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (406, N'8150', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (407, N'8151', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (408, N'8156', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (409, N'8170', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (410, N'8172', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (411, N'8174', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (412, N'8208', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (413, N'8210', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (414, N'8247', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (415, N'8271', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (416, N'8290', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (417, N'8292', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (418, N'8293', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (419, N'8297', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (420, N'8298', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (421, N'8299', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (422, N'8300', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (423, N'8311', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (424, N'8312', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (425, N'8313', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (426, N'8470', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (427, N'8471', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (428, N'8476', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (429, N'8489', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (430, N'8511', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (431, N'8521', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (432, N'8522', CAST(0x000099BA00000000 AS DateTime), N'SX', 5, 0.0000, 0.0000, 47175.5000, 49250.4000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (433, N'8523', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 47273.0000, 47659.7143, N'8523')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (434, N'8540', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 41981.5000, 40804.3882, N'8540')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (435, N'8541', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 35429.9667, 34133.1333, N'8541')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (436, N'8542', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 27751.6667, 27653.0000, N'8542')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (437, N'8543', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 25072.4000, 24393.0000, N'8543')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (438, N'8545', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 41304.0000, 42409.3333, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (439, N'8546', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (440, N'8639', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (441, N'8649', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 67006.0000, 67006.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (442, N'8650', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (443, N'8651', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 60477.5000, 57146.3333, N'8651')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (444, N'8653', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (445, N'8667', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (446, N'8668', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 64116.0000, 64116.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (447, N'8669', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (448, N'8670', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (449, N'8680', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (450, N'8885', CAST(0x0000929800000000 AS DateTime), N'99', 0, NULL, NULL, 52525.0000, 52525.0000, N'8885')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (451, N'8915', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (452, N'8936', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (453, N'8937', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (454, N'8953', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (455, N'8961', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (456, N'8969', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (457, N'8970', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (458, N'8971', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (459, N'8972', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (460, N'8993', CAST(0x0000940500000000 AS DateTime), N'EX', 0, NULL, NULL, 29596.0000, 29596.0000, N'8993')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (461, N'8995', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (462, N'9001', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (463, N'9010', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (464, N'9017', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (465, N'9018', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (466, N'9019', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (467, N'9020', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (468, N'9030', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (469, N'9031', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (470, N'9035', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (471, N'9037', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (472, N'9046', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (473, N'9047', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (474, N'9058', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (475, N'9068', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (476, N'9075', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (477, N'9076', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (478, N'9077', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (479, N'9103', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (480, N'9104', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (481, N'9115', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (482, N'9127', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (483, N'9130', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (484, N'9131', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (485, N'9133', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (486, N'9139', CAST(0x00009A7100000000 AS DateTime), N'NX', 15, 0.0000, 0.0000, 101566.4000, 101566.4000, N'9139')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (487, N'9145', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (488, N'9149', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (489, N'9150', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (490, N'9170', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (491, N'9177', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (492, N'9192', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (493, N'9215', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (494, N'9217', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (495, N'9223', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (496, N'9238', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (497, N'9252', CAST(0x0000940500000000 AS DateTime), N'EX', 0, NULL, NULL, 32373.0000, 32373.0000, N'9252')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (498, N'9255', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (499, N'9256', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (500, N'9257', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (501, N'9261', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (502, N'9269', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (503, N'9280', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
GO
print 'Processed 400 total records'
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (504, N'9294', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (505, N'9296', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (506, N'9304', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (507, N'9305', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (508, N'9311', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (509, N'9312', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (510, N'9321', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (511, N'9322', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (512, N'9323', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 74496.0000, 74496.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (513, N'9324', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 43560.0000, 40020.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (514, N'9325', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 41393.1111, 32947.2955, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (515, N'9326', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 31969.6000, 31969.6000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (516, N'9333', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (517, N'9334', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (518, N'9335', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (519, N'9336', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (520, N'9347', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (521, N'9348', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (522, N'9349', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (523, N'9350', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (524, N'9354', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (525, N'9366', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (526, N'9457', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (527, N'9458', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (528, N'9480', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (529, N'9481', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (530, N'9482', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (531, N'9483', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (532, N'9484', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (533, N'9496', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (534, N'9497', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (535, N'9520', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 76692.0000, 76692.0000, N'9520')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (536, N'9521', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 68648.6667, 68648.6667, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (537, N'9522', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 58912.7500, 56719.4000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (538, N'9523', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 40236.0000, 40236.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (539, N'9524', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 22039.8400, 22039.8400, N'9524')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (540, N'9525', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 33318.0000, 32913.0000, N'9525')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (541, N'9526', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 24939.2000, 24939.2000, N'9526')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (542, N'9527', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (543, N'9528', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (544, N'9529', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (545, N'9532', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (546, N'9533', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (547, N'9538', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (548, N'9539', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (549, N'9540', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (550, N'9561', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 35111.3333, 35111.3333, N'9561')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (551, N'9562', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 30745.5000, 30745.5000, N'9562')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (552, N'9600', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (553, N'9602', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 36374.2857, 36365.6176, N'9602')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (554, N'9603', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 30811.6364, 30388.0000, N'9603')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (555, N'9604', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (556, N'9605', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 26976.0000, 27271.0588, N'9605')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (557, N'9606', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 22089.6000, 22551.1143, N'9606')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (558, N'9609', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 80047.0000, 75737.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (559, N'9610', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 60824.5714, 60767.5306, N'9610')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (560, N'9611', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 54041.4200, 52517.7778, N'9611')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (561, N'9612', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 43639.2000, 42468.0000, N'9612')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (562, N'9613', CAST(0x000099BA00000000 AS DateTime), N'RX', 9, 0.0000, 0.0000, 37613.8462, 37558.7317, N'9613')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (563, N'9614', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 70108.4500, 69458.1786, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (564, N'9615', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 61682.4286, 59027.7857, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (565, N'9616', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 55332.1250, 55332.1250, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (566, N'9617', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 44769.0435, 44138.2974, N'9617')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (567, N'9720', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (568, N'9721', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 72921.5000, 74464.6667, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (569, N'9722', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 65424.0000, 59248.0000, N'9722')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (570, N'9723', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 41124.0000, 40710.0000, N'9723')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (571, N'9724', CAST(0x000099BA00000000 AS DateTime), N'RX', 9, 0.0000, 0.0000, 41412.0000, 41412.0000, N'9724')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (572, N'9726', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 72960.0000, 72960.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (573, N'9802', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (574, N'7287', CAST(0x0000984D00000000 AS DateTime), N'99', NULL, NULL, NULL, 68960.5000, 68811.2142, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (672, N'4001', CAST(0x00009BA100000000 AS DateTime), N'TX', 3, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (673, N'4001', CAST(0x00009BDD00000000 AS DateTime), N'99', 0, 10000.0000, 20000.0000, 0.0000, 1000000.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (674, N'4001', CAST(0x00009BE300000000 AS DateTime), N'TX', 0, 10000.0000, -25.0000, 0.0000, -35.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (655, N'4672', CAST(0x00009B5A00000000 AS DateTime), N'CX', 1, 0.0000, 0.0000, 0.0000, 0.0000, N'4672')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (657, N'4001', CAST(0x00009B7300000000 AS DateTime), N'99', 2, 199.0000, 10.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (666, N'4001', CAST(0x00009B7400000000 AS DateTime), N'99', 1, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
SET IDENTITY_INSERT [dbo].[SalaryScale] OFF
/****** Object:  Table [dbo].[SalaryGradeMatrix]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalaryGradeMatrix](
	[SalaryGradeMarixID] [int] IDENTITY(101,1) NOT NULL,
	[SalaryGrade] [char](4) NOT NULL,
	[MinAnnual] [money] NULL,
	[FirstQrtleAnnual] [money] NULL,
	[MidAnnual] [money] NULL,
	[ThirdQrtleAnnual] [money] NULL,
	[MaxAnnual] [money] NULL,
	[EffectiveDate] [datetime] NULL,
	[SalaryScaleID] [int] NULL,
 CONSTRAINT [PK_SalaryGradeMatrix] PRIMARY KEY CLUSTERED 
(
	[SalaryGradeMarixID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [SalaryGradeMatrix_SalaryGradeEffectiveDate] ON [dbo].[SalaryGradeMatrix] 
(
	[SalaryGrade] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SalaryGradeMatrix] ON
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (101, N'1   ', 36108.0000, 42426.0000, 48744.0000, 55062.0000, 61380.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (102, N'10  ', 85524.0000, 100494.0000, 115464.0000, 130428.0000, 145392.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (103, N'2   ', 39792.0000, 46758.0000, 53724.0000, 60684.0000, 67644.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (104, N'3   ', 43824.0000, 51492.0000, 59160.0000, 66828.0000, 74496.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (105, N'4   ', 48288.0000, 56736.0000, 65184.0000, 73638.0000, 82092.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (106, N'5   ', 53064.0000, 62352.0000, 71640.0000, 80922.0000, 90204.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (107, N'6   ', 58392.0000, 68610.0000, 78828.0000, 89046.0000, 99264.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (108, N'7   ', 64272.0000, 75516.0000, 86760.0000, 98010.0000, 109260.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (109, N'8   ', 70692.0000, 83064.0000, 95436.0000, 107808.0000, 120180.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (110, N'9   ', 77748.0000, 91356.0000, 104964.0000, 118566.0000, 132168.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (111, N'B   ', 25668.0000, 28878.0000, 32088.0000, 35298.0000, 38508.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (112, N'C   ', 28476.0000, 32034.0000, 35592.0000, 39156.0000, 42720.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (113, N'D   ', 31644.0000, 35598.0000, 39552.0000, 43512.0000, 47472.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (114, N'E   ', 35124.0000, 39516.0000, 43908.0000, 48300.0000, 52692.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (115, N'4672', 25764.0000, 28245.0000, 30726.0000, 33207.0000, 35688.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (116, N'4725', 43752.0000, 47034.0000, 50316.0000, 53598.0000, 56880.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (117, N'4726', 32508.0000, 38190.0000, 43872.0000, 49554.0000, 55236.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (118, N'4804', 42012.0000, 46038.0000, 50064.0000, 54090.0000, 58116.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (119, N'4805', 35640.0000, 38979.0000, 42318.0000, 45657.0000, 48996.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (120, N'5062', 32304.0000, 34728.0000, 37152.0000, 39576.0000, 42000.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (121, N'6102', 42000.0000, 47373.0000, 52746.0000, 58119.0000, 63492.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (122, N'6112', 35748.0000, 37545.0000, 39342.0000, 41139.0000, 42936.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (123, N'6113', 29544.0000, 30891.0000, 32238.0000, 33585.0000, 34932.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (124, N'6760', 34046.0000, 36576.0000, 39106.0000, 41636.0000, 44166.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (125, N'6761', 30384.0000, 32525.2500, 34666.5000, 36807.7500, 38949.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (126, N'7171', 42936.0000, 45129.0000, 47322.0000, 49515.0000, 51708.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (127, N'7684', 37368.0000, 39249.0000, 41130.0000, 43011.0000, 44892.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (128, N'7704', 37560.0000, 39450.0000, 41340.0000, 43230.0000, 45120.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (129, N'8076', 25476.0000, 27522.0000, 29568.0000, 31614.0000, 33660.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (130, N'8148', 37536.0000, 41295.0000, 45054.0000, 48813.0000, 52572.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (131, N'8523', 42972.0000, 47268.0000, 51564.0000, 55860.0000, 60156.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (132, N'8540', 33012.0000, 36315.0000, 39618.0000, 42921.0000, 46224.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (133, N'8541', 30192.0000, 33213.0000, 36234.0000, 39255.0000, 42276.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (134, N'8542', 26688.0000, 29355.0000, 32022.0000, 34689.0000, 37356.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (135, N'8543', 22656.0000, 24396.0000, 26136.0000, 27876.0000, 29616.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (136, N'8651', 49344.0000, 51894.0000, 54444.0000, 56994.0000, 59544.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (137, N'8885', 33192.0000, 52518.0000, 71844.0000, 91170.0000, 110496.0000, CAST(0x0000929800000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (138, N'8993', 26124.0000, 28083.0000, 30042.0000, 32001.0000, 33960.0000, CAST(0x0000940500000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (139, N'9139', 78839.0000, 85129.0000, 91419.0000, 97709.0000, 103999.0000, CAST(0x00009A7100000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (140, N'9252', 24552.0000, 26394.0000, 28236.0000, 30078.0000, 31920.0000, CAST(0x0000940500000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (141, N'9520', 50621.0000, 58312.7500, 66004.5000, 73696.2500, 81388.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (142, N'9524', 33504.0000, 35055.0000, 36606.0000, 38157.0000, 39708.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (143, N'9525', 31344.0000, 32727.0000, 34110.0000, 35493.0000, 36876.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (144, N'9526', 23232.0000, 25032.0000, 26832.0000, 28632.0000, 30432.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (145, N'9561', 30576.0000, 33189.0000, 35802.0000, 38415.0000, 41028.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (146, N'9562', 26964.0000, 29202.0000, 31440.0000, 33678.0000, 35916.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (147, N'9602', 33528.0000, 35121.0000, 36714.0000, 38307.0000, 39900.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (148, N'9603', 29076.0000, 30357.0000, 31638.0000, 32919.0000, 34200.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (149, N'9605', 26004.0000, 27036.0000, 28068.0000, 29100.0000, 30132.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (150, N'9606', 21468.0000, 22788.0000, 24108.0000, 25428.0000, 26748.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (151, N'9610', 45975.0000, 52975.2500, 59975.5000, 66975.7500, 73976.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (152, N'9611', 41815.0000, 48173.7500, 54532.5000, 60891.2500, 67250.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (153, N'9612', 37929.0000, 43705.2500, 49481.5000, 55257.7500, 61034.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (154, N'9613', 34864.0000, 36545.7500, 38227.5000, 39909.2500, 41591.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (155, N'9617', 37929.0000, 43705.2500, 49481.5000, 55257.7500, 61034.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (156, N'9722', 45975.0000, 52975.2500, 59975.5000, 66975.7500, 73976.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (157, N'9723', 37929.0000, 43705.2500, 49481.5000, 55257.7500, 61034.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (158, N'9724', 34715.0000, 36390.2500, 38065.5000, 39740.7500, 41416.0000, CAST(0x000099BA00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (159, N'5   ', 50410.8000, 59234.4000, 68058.0000, 76875.9000, 85693.8000, CAST(0x0000984D00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (160, N'6214', 36108.0000, 42426.0000, 48744.0000, 55062.0000, 61380.0000, CAST(0x00009B2A00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (161, N'6215', 31644.0000, 35598.0000, 39552.0000, 43512.0000, 47472.0000, CAST(0x00009B2A00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (170, N'4672', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, CAST(0x00009B5A00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (171, N'2   ', 39792.1200, 46758.2000, 53724.3000, 60684.4000, 67644.5000, CAST(0x00009B6E00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (172, N'2   ', 10.0000, 2.0000, 3.0000, 4.0000, 5.0000, CAST(0x00009B7300000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (187, N'2   ', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, CAST(0x00009B7400000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (206, N'3   ', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, CAST(0x00009B8C00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (210, N'2   ', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, CAST(0x00009BA100000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (211, N'2   ', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, CAST(0x00009BDD00000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (212, N'2   ', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, CAST(0x00009BE300000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SalaryGradeMatrix] OFF
/****** Object:  Table [dbo].[QuartileType]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuartileType](
	[QuartileTypeID] [int] IDENTITY(101,1) NOT NULL,
	[Type] [varchar](64) NULL,
	[ShortType] [varchar](20) NULL,
	[Description] [varchar](1028) NULL,
 CONSTRAINT [PK_QuartileType] PRIMARY KEY CLUSTERED 
(
	[QuartileTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[QuartileType] ON
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (101, N'Minimum', N'Min', NULL)
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (102, N'First Qrtle', N'1st', NULL)
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (103, N'Midpoint', N'Mid', NULL)
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (104, N'Third Qrtle', N'3rd', NULL)
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (105, N'Maximum', N'Max', NULL)
SET IDENTITY_INSERT [dbo].[QuartileType] OFF
/****** Object:  Table [dbo].[PayRateType]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayRateType](
	[PayRateTypeID] [int] IDENTITY(101,1) NOT NULL,
	[Type] [varchar](64) NULL,
	[ShortType] [varchar](20) NULL,
	[Description] [varchar](1028) NULL,
 CONSTRAINT [PK_PayRateType] PRIMARY KEY CLUSTERED 
(
	[PayRateTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PayRateType] ON
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (101, N'Annual', N'A', NULL)
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (102, N'Mounthly', N'M', NULL)
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (103, N'Hourly', N'H', NULL)
SET IDENTITY_INSERT [dbo].[PayRateType] OFF
/****** Object:  Table [dbo].[Employee]    Script Date: 07/01/2009 15:45:47 ******/
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
CREATE UNIQUE NONCLUSTERED INDEX [Employee_EmployeeIDTitleCodeUDX] ON [dbo].[Employee] 
(
	[EmployeeID] ASC,
	[TitleCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Employee_TimeInTitleIDX] ON [dbo].[Employee] 
(
	[TimeInTitle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Employee_YearsOfExperienceIDX] ON [dbo].[Employee] 
(
	[YearsOfExperience] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Employee_YearsOfServiceIDX] ON [dbo].[Employee] 
(
	[YearsOfService] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0000000010000', N'000000001', N'9999', CAST(0x00009B8700000000 AS DateTime), CAST(0x00009B8700000000 AS DateTime), NULL, 1, NULL, N'This is a "fake" user to allow watchfire testing.', CAST(0.500 AS Decimal(5, 3)), CAST(0.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0000000020000', N'000000002', N'9999', CAST(0x00009B8900000000 AS DateTime), CAST(0x00009B8900000000 AS DateTime), NULL, 1, NULL, N'Test account for watchfire/CASS testing.', CAST(0.500 AS Decimal(5, 3)), CAST(0.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0008142690280', N'000814269', N'0280', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.167 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0012312817234', N'001231281', N'7234', NULL, NULL, CAST(0x0000982F00000000 AS DateTime), 0, NULL, NULL, CAST(11.250 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), CAST(2.833 AS Decimal(5, 3)))
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0017468259610', N'001746825', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0030478679617', N'003047867', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0036952029610', N'003695202', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0052377304722', N'005237730', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.833 AS Decimal(5, 3)), CAST(5.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0071272859610', N'007127285', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0076197039524', N'007619703', N'9524', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.000 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0091390986454', N'009139098', N'6454', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.250 AS Decimal(5, 3)), CAST(3.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0115409450245', N'011540945', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.917 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0140574429610', N'014057442', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.083 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0143371177285', N'014337117', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.917 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0145654109611', N'014565410', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.000 AS Decimal(5, 3)), CAST(8.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0181238024356', N'018123802', N'4356', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.833 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0185459397698', N'018545939', N'7698', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.083 AS Decimal(5, 3)), CAST(6.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0191964274722', N'019196427', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.333 AS Decimal(5, 3)), CAST(1.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0192097257285', N'019209725', N'7285', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0202568147287', N'020256814', N'7287', NULL, NULL, NULL, 0, NULL, NULL, CAST(27.750 AS Decimal(5, 3)), CAST(8.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0207331769611', N'020733176', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.833 AS Decimal(5, 3)), CAST(5.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0226784607235', N'022678460', N'7235', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0227291989521', N'022729198', N'9521', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.250 AS Decimal(5, 3)), CAST(5.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0248039184722', N'024803918', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.667 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0257878399603', N'025787839', N'9603', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.833 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0265008840355', N'026500884', N'0355', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.083 AS Decimal(5, 3)), CAST(2.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0279734118148', N'027973411', N'8148', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.833 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0312588339617', N'031258833', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.750 AS Decimal(5, 3)), CAST(4.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0314243696453', N'031424369', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0322650687287', N'032265068', N'7287', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.083 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0324622934804', N'032462293', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.917 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0324706276452', N'032470627', N'6452', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0339484720280', N'033948472', N'0280', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.083 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0348283849611', N'034828384', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.583 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0358096079616', N'035809607', N'9616', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.000 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0363212554722', N'036321255', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.917 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0386413209617', N'038641320', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0387207699613', N'038720769', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0406183574722', N'040618357', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.000 AS Decimal(5, 3)), CAST(3.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0407551836453', N'040755183', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.083 AS Decimal(5, 3)), CAST(1.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0411112614725', N'041111261', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.167 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0422830024723', N'042283002', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.750 AS Decimal(5, 3)), CAST(2.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0424424754722', N'042442475', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.000 AS Decimal(5, 3)), CAST(4.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0462219827510', N'046221982', N'7510', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.917 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0468210889617', N'046821088', N'9617', CAST(0x000074C900000000 AS DateTime), CAST(0x0000883F00000000 AS DateTime), NULL, 1, NULL, NULL, CAST(27.667 AS Decimal(5, 3)), CAST(14.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0472156787287', N'047215678', N'7287', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.083 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0476134847285', N'047613484', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.083 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0483154779612', N'048315477', N'9612', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.333 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0483154779617', N'048315477', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0516941724722', N'051694172', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.500 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0517489299617', N'051748929', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.667 AS Decimal(5, 3)), CAST(5.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0542375579613', N'054237557', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0551088079611', N'055108807', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.000 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0551088079617', N'055108807', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0556107297634', N'055610729', N'7634', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.583 AS Decimal(5, 3)), CAST(6.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0569080494805', N'056908049', N'4805', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.750 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0570187806454', N'057018780', N'6454', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.833 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0577364804725', N'057736480', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.083 AS Decimal(5, 3)), CAST(2.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0591916844723', N'059191684', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.667 AS Decimal(5, 3)), CAST(4.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0619744579613', N'061974457', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0626346474722', N'062634647', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.250 AS Decimal(5, 3)), CAST(3.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0630862199617', N'063086219', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0642182587285', N'064218258', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.000 AS Decimal(5, 3)), CAST(5.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0649218854722', N'064921885', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.083 AS Decimal(5, 3)), CAST(3.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0653219034804', N'065321903', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.500 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0671200979611', N'067120097', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0674823644725', N'067482364', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.000 AS Decimal(5, 3)), CAST(4.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0679949547703', N'067994954', N'7703', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.250 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0680839639325', N'068083963', N'9325', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0744652538522', N'074465253', N'8522', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.917 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0758398036453', N'075839803', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.917 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0774445299611', N'077444529', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0794443039610', N'079444303', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.750 AS Decimal(5, 3)), CAST(1.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0811870494723', N'081187049', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.917 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0821823387680', N'082182338', N'7680', NULL, NULL, NULL, 0, NULL, NULL, CAST(40.000 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0828652217287', N'082865221', N'7287', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.417 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0838250759617', N'083825075', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0891306378541', N'089130637', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.500 AS Decimal(5, 3)), CAST(4.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0893267069524', N'089326706', N'9524', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.500 AS Decimal(5, 3)), CAST(3.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0910546689561', N'091054668', N'9561', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.083 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0927752539611', N'092775253', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.750 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0931714607541', N'093171460', N'7541', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.250 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0946332787684', N'094633278', N'7684', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0946594304725', N'094659430', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.083 AS Decimal(5, 3)), CAST(2.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0946671939613', N'094667193', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0954354349611', N'095435434', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.750 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0965659324722', N'096565932', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.667 AS Decimal(5, 3)), CAST(2.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0984375514802', N'098437551', N'4802', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.917 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0989139409617', N'098913940', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.833 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'0996059909614', N'099605990', N'9614', NULL, NULL, NULL, 0, NULL, NULL, CAST(25.917 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1054105004353', N'105410500', N'4353', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.750 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1054908589611', N'105490858', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1072266317684', N'107226631', N'7684', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.917 AS Decimal(5, 3)), CAST(7.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1083440949610', N'108344094', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.833 AS Decimal(5, 3)), CAST(2.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1089689189611', N'108968918', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1117072049605', N'111707204', N'9605', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.000 AS Decimal(5, 3)), CAST(5.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1124095609606', N'112409560', N'9606', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.917 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1135360499602', N'113536049', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.000 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1157224989617', N'115722498', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1158777229610', N'115877722', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(25.917 AS Decimal(5, 3)), CAST(9.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1169034779613', N'116903477', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.583 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1183195084722', N'118319508', N'4722', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1187375359611', N'118737535', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.000 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1214044619611', N'121404461', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1228505224354', N'122850522', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.417 AS Decimal(5, 3)), CAST(4.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1231047059617', N'123104705', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.750 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1239714347285', N'123971434', N'7285', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1241716469613', N'124171646', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.417 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1242452429611', N'124245242', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.000 AS Decimal(5, 3)), CAST(1.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1248719144725', N'124871914', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.667 AS Decimal(5, 3)), CAST(1.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1261074739602', N'126107473', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1271341127512', N'127134112', N'7512', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.000 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1271954519610', N'127195451', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.000 AS Decimal(5, 3)), CAST(6.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1305744039325', N'130574403', N'9325', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1309648369617', N'130964836', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.583 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1311574067285', N'131157406', N'7285', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1312347184722', N'131234718', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.583 AS Decimal(5, 3)), CAST(4.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1336563069616', N'133656306', N'9616', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.250 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1357597029617', N'135759702', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1357759559325', N'135775955', N'9325', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.417 AS Decimal(5, 3)), CAST(8.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1377303219615', N'137730321', N'9615', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.500 AS Decimal(5, 3)), CAST(3.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1378978077249', N'137897807', N'7249', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1385266379602', N'138526637', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1393208249617', N'139320824', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.500 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1395821189616', N'139582118', N'9616', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.917 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1445396329611', N'144539632', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(33.667 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1445748037246', N'144574803', N'7246', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.917 AS Decimal(5, 3)), CAST(2.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1512252657234', N'151225265', N'7234', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.250 AS Decimal(5, 3)), CAST(2.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1525016159602', N'152501615', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.250 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1529806529602', N'152980652', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.167 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1535317699617', N'153531769', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.750 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1540726499603', N'154072649', N'9603', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1542016109613', N'154201610', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1543620168541', N'154362016', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.917 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1550873569562', N'155087356', N'9562', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.167 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1581173664723', N'158117366', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1582458459617', N'158245845', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.333 AS Decimal(5, 3)), CAST(5.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1583205729723', N'158320572', N'9723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1588809067284', N'158880906', N'7284', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1597409196112', N'159740919', N'6112', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.500 AS Decimal(5, 3)), CAST(3.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1610471889617', N'161047188', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.083 AS Decimal(5, 3)), CAST(4.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1616746689613', N'161674668', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1621283599615', N'162128359', N'9615', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1641254780245', N'164125478', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.667 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1646886164354', N'164688616', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(40.833 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1677193848541', N'167719384', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.250 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1678835039611', N'167883503', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1680719347285', N'168071934', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.417 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1688139707293', N'168813970', N'7293', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.333 AS Decimal(5, 3)), CAST(6.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1688342167238', N'168834216', N'7238', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(1.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1690008904723', N'169000890', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(31.917 AS Decimal(5, 3)), CAST(11.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1693224928545', N'169322492', N'8545', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.167 AS Decimal(5, 3)), CAST(6.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1701056620245', N'170105662', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.750 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1720511799603', N'172051179', N'9603', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1726100814804', N'172610081', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1749107119617', N'174910711', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1776386739603', N'177638673', N'9603', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1786950864722', N'178695086', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.167 AS Decimal(5, 3)), CAST(4.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1799835159614', N'179983515', N'9614', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.417 AS Decimal(5, 3)), CAST(3.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1809768967236', N'180976896', N'7236', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.250 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1810112717234', N'181011271', N'7234', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.250 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1810795599602', N'181079559', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1856429157236', N'185642915', N'7236', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.500 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1857316359617', N'185731635', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1901097859617', N'190109785', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.750 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1903901614354', N'190390161', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(38.833 AS Decimal(5, 3)), CAST(3.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1912761954722', N'191276195', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.750 AS Decimal(5, 3)), CAST(6.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1971149459613', N'197114945', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1972921217287', N'197292121', N'7287', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1977787314725', N'197778731', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.833 AS Decimal(5, 3)), CAST(4.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1979304809614', N'197930480', N'9614', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.417 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1993375697235', N'199337569', N'7235', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.500 AS Decimal(5, 3)), CAST(4.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'1995177157287', N'199517715', N'7287', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.583 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2002097169602', N'200209716', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.583 AS Decimal(5, 3)), CAST(3.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2021694217703', N'202169421', N'7703', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.917 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2031829774723', N'203182977', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.833 AS Decimal(5, 3)), CAST(9.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2037523998885', N'203752399', N'8885', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.333 AS Decimal(5, 3)), CAST(1.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2049336678993', N'204933667', N'8993', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.917 AS Decimal(5, 3)), CAST(7.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2074835534722', N'207483553', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.167 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2085133174727', N'208513317', N'4727', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.500 AS Decimal(5, 3)), CAST(1.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2087579069325', N'208757906', N'9325', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2097854017183', N'209785401', N'7183', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.917 AS Decimal(5, 3)), CAST(8.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2106040967510', N'210604096', N'7510', NULL, NULL, NULL, 0, NULL, NULL, CAST(34.000 AS Decimal(5, 3)), CAST(6.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2146328124722', N'214632812', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.083 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2167200869613', N'216720086', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(7.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2173507439522', N'217350743', N'9522', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.833 AS Decimal(5, 3)), CAST(7.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2186586987281', N'218658698', N'7281', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.083 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2193628295423', N'219362829', N'5423', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.917 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2212583539610', N'221258353', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.833 AS Decimal(5, 3)), CAST(4.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2223527596453', N'222352759', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.667 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2225792119610', N'222579211', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.083 AS Decimal(5, 3)), CAST(3.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2236054459610', N'223605445', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2236797474722', N'223679747', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2237441458119', N'223744145', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(24.250 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2263856319614', N'226385631', N'9614', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2272407779617', N'227240777', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2275414224723', N'227541422', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.417 AS Decimal(5, 3)), CAST(3.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2277895009617', N'227789500', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(27.417 AS Decimal(5, 3)), CAST(10.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2290265629610', N'229026562', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2322116984722', N'232211698', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.250 AS Decimal(5, 3)), CAST(4.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2329849710245', N'232984971', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.250 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2333725077286', N'233372507', N'7286', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2335872607634', N'233587260', N'7634', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.167 AS Decimal(5, 3)), CAST(1.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2399059538668', N'239905953', N'8668', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.750 AS Decimal(5, 3)), CAST(6.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2399997747182', N'239999774', N'7182', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.083 AS Decimal(5, 3)), CAST(12.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2408503629602', N'240850362', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2428603939526', N'242860393', N'9526', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2430660814348', N'243066081', N'4348', NULL, NULL, NULL, 0, NULL, NULL, CAST(17.917 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2461306039617', N'246130603', N'9617', CAST(0x0000967F00000000 AS DateTime), CAST(0x00009B2800000000 AS DateTime), CAST(0x00009B0900000000 AS DateTime), 1, NULL, NULL, CAST(4.083 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)))
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2485557409325', N'248555740', N'9325', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2485792944722', N'248579294', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.667 AS Decimal(5, 3)), CAST(3.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2489494639603', N'248949463', N'9603', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.167 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2509886729605', N'250988672', N'9605', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.917 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2514704154723', N'251470415', N'4723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2517074934213', N'251707493', N'4213', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.833 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2533527287249', N'253352728', N'7249', CAST(0x000072BB00000000 AS DateTime), CAST(0x0000988A00000000 AS DateTime), NULL, 1, NULL, NULL, CAST(29.083 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2538788478541', N'253878847', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.917 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2547506319611', N'254750631', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2548920789617', N'254892078', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(4.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2550377647295', N'255037764', N'7295', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2557782359611', N'255778235', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(28.833 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2558424787182', N'255842478', N'7182', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2562161779522', N'256216177', N'9522', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2562310446113', N'256231044', N'6113', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.750 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2568474689617', N'256847468', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.083 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2576464149613', N'257646414', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.083 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2599586354723', N'259958635', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.667 AS Decimal(5, 3)), CAST(4.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2600781757698', N'260078175', N'7698', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.333 AS Decimal(5, 3)), CAST(6.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2619434764723', N'261943476', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.833 AS Decimal(5, 3)), CAST(6.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2631289446453', N'263128944', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.750 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2640104146452', N'264010414', N'6452', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.500 AS Decimal(5, 3)), CAST(11.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2653987509610', N'265398750', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.417 AS Decimal(5, 3)), CAST(10.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2658430459613', N'265843045', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2661881769617', N'266188176', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.167 AS Decimal(5, 3)), CAST(6.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2663463374722', N'266346337', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.833 AS Decimal(5, 3)), CAST(5.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2664195229614', N'266419522', N'9614', CAST(0x00006E9100000000 AS DateTime), CAST(0x000086D200000000 AS DateTime), NULL, 1, NULL, NULL, CAST(32.000 AS Decimal(5, 3)), CAST(15.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2664456679610', N'266445667', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2681558199605', N'268155819', N'9605', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2683641309613', N'268364130', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.750 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2684743017250', N'268474301', N'7250', NULL, NULL, NULL, 0, NULL, NULL, CAST(27.833 AS Decimal(5, 3)), CAST(4.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2690359869612', N'269035986', N'9612', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.583 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2696961677250', N'269696167', N'7250', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.917 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2704298309614', N'270429830', N'9614', CAST(0x0000727700000000 AS DateTime), CAST(0x00007A1A00000000 AS DateTime), NULL, 1, NULL, NULL, CAST(29.333 AS Decimal(5, 3)), CAST(23.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2728776069562', N'272877606', N'9562', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.250 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2749660017247', N'274966001', N'7247', CAST(0x0000987900000000 AS DateTime), CAST(0x000099A500000000 AS DateTime), CAST(0x000087AB00000000 AS DateTime), 0, N'Department comments', N'Rachel''s Dean''s Office Comments...', CAST(2.667 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), CAST(14.417 AS Decimal(5, 3)))
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2768096964353', N'276809696', N'4353', NULL, NULL, NULL, 0, NULL, NULL, CAST(28.000 AS Decimal(5, 3)), CAST(5.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2772767967510', N'277276796', N'7510', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.833 AS Decimal(5, 3)), CAST(2.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2775153755426', N'277515375', N'5426', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2835769089617', N'283576908', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.167 AS Decimal(5, 3)), CAST(1.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2853472908541', N'285347290', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.083 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2856764177512', N'285676417', N'7512', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.250 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2880732249723', N'288073224', N'9723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2881272779722', N'288127277', N'9722', NULL, NULL, NULL, 0, NULL, NULL, CAST(27.750 AS Decimal(5, 3)), CAST(9.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2889420229617', N'288942022', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2889804699614', N'288980469', N'9614', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2928646424723', N'292864642', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.667 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2928940948119', N'292894094', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(36.750 AS Decimal(5, 3)), CAST(15.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'2985693029611', N'298569302', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3042467704723', N'304246770', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.917 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3044249719602', N'304424971', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3050332689617', N'305033268', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.500 AS Decimal(5, 3)), CAST(2.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3061343059602', N'306134305', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.583 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3080412927510', N'308041292', N'7510', NULL, NULL, NULL, 0, NULL, NULL, CAST(27.833 AS Decimal(5, 3)), CAST(11.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3086190639325', N'308619063', N'9325', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.167 AS Decimal(5, 3)), CAST(7.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3086622204723', N'308662220', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.667 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3137808277182', N'313780827', N'7182', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3171618344725', N'317161834', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.333 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3178778194725', N'317877819', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.583 AS Decimal(5, 3)), CAST(4.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3185862527682', N'318586252', N'7682', NULL, NULL, NULL, 0, NULL, NULL, CAST(33.333 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3208429179617', N'320842917', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.167 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3224366504724', N'322436650', N'4724', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3225630328541', N'322563032', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3228409844723', N'322840984', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.250 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3250693184723', N'325069318', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.833 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3250693184724', N'325069318', N'4724', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3255960629616', N'325596062', N'9616', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.333 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3286221214723', N'328622121', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.417 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3297341317286', N'329734131', N'7286', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.583 AS Decimal(5, 3)), CAST(2.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3298264657182', N'329826465', N'7182', NULL, NULL, NULL, 0, NULL, NULL, CAST(31.167 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3308155809611', N'330815580', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.750 AS Decimal(5, 3)), CAST(5.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3310059184725', N'331005918', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.083 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3312408959617', N'331240895', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(27.083 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3322852386453', N'332285238', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3324199697286', N'332419969', N'7286', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.333 AS Decimal(5, 3)), CAST(4.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3326227789616', N'332622778', N'9616', NULL, NULL, NULL, 0, NULL, NULL, CAST(16.000 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3338817469610', N'333881746', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3351564939617', N'335156493', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.167 AS Decimal(5, 3)), CAST(8.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3359913788119', N'335991378', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.500 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3374824759613', N'337482475', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3391990029611', N'339199002', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.333 AS Decimal(5, 3)), CAST(1.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3392858190355', N'339285819', N'0355', NULL, NULL, NULL, 0, NULL, NULL, CAST(17.167 AS Decimal(5, 3)), CAST(8.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3394533008119', N'339453300', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.167 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3415956769612', N'341595676', N'9612', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.583 AS Decimal(5, 3)), CAST(3.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3423627874723', N'342362787', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.167 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3431276199611', N'343127619', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3471098039611', N'347109803', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.833 AS Decimal(5, 3)), CAST(5.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3477348404723', N'347734840', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.917 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3481785429520', N'348178542', N'9520', NULL, NULL, NULL, 0, NULL, NULL, CAST(35.167 AS Decimal(5, 3)), CAST(9.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3482826254722', N'348282625', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.917 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3532803404723', N'353280340', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3535411700245', N'353541170', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.083 AS Decimal(5, 3)), CAST(4.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3538828639611', N'353882863', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3553960114722', N'355396011', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.083 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
GO
print 'Processed 300 total records'
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3566037207173', N'356603720', N'7173', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3570003977510', N'357000397', N'7510', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.500 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3593506750245', N'359350675', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.750 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3614127784723', N'361412778', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.917 AS Decimal(5, 3)), CAST(8.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3615246304725', N'361524630', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.333 AS Decimal(5, 3)), CAST(4.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3631100818541', N'363110081', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.083 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3632297414723', N'363229741', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.917 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3632941254353', N'363294125', N'4353', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.417 AS Decimal(5, 3)), CAST(1.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3663142279617', N'366314227', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3665432399611', N'366543239', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(17.500 AS Decimal(5, 3)), CAST(4.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3703966819612', N'370396681', N'9612', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3713270249610', N'371327024', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.333 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3729757484722', N'372975748', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.667 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3731882679611', N'373188267', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3781026939614', N'378102693', N'9614', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.250 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3783670159614', N'378367015', N'9614', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.000 AS Decimal(5, 3)), CAST(3.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3791830649617', N'379183064', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3799868884723', N'379986888', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.417 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3820335614723', N'382033561', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3855313489611', N'385531348', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.583 AS Decimal(5, 3)), CAST(1.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3870560544722', N'387056054', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.833 AS Decimal(5, 3)), CAST(2.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3876946727286', N'387694672', N'7286', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.083 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3885963977281', N'388596397', N'7281', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.917 AS Decimal(5, 3)), CAST(3.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3891272007703', N'389127200', N'7703', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.750 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3891360789603', N'389136078', N'9603', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.917 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3897102528651', N'389710252', N'8651', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.583 AS Decimal(5, 3)), CAST(9.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3916787529522', N'391678752', N'9522', NULL, NULL, NULL, 0, NULL, NULL, CAST(28.917 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3938398657511', N'393839865', N'7511', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.083 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3946384989610', N'394638498', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.250 AS Decimal(5, 3)), CAST(4.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3973794620245', N'397379462', N'0245', CAST(0x000096E200000000 AS DateTime), CAST(0x000096E200000000 AS DateTime), NULL, 1, NULL, NULL, CAST(3.750 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3984282197287', N'398428219', N'7287', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'3988705767285', N'398870576', N'7285', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4018471739325', N'401847173', N'9325', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4048245184723', N'404824518', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.917 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4056004389611', N'405600438', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.667 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4071095868541', N'407109586', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4071827818545', N'407182781', N'8545', NULL, NULL, NULL, 0, NULL, NULL, CAST(16.917 AS Decimal(5, 3)), CAST(12.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4077530119326', N'407753011', N'9326', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4082139997511', N'408213999', N'7511', NULL, NULL, NULL, 0, NULL, NULL, CAST(28.667 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4095114419611', N'409511441', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4112019087236', N'411201908', N'7236', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.333 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4125040037234', N'412504003', N'7234', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4148131629614', N'414813162', N'9614', CAST(0x0000772000000000 AS DateTime), CAST(0x0000939000000000 AS DateTime), NULL, 1, NULL, NULL, CAST(26.000 AS Decimal(5, 3)), CAST(6.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4174995489614', N'417499548', N'9614', CAST(0x00008F9D00000000 AS DateTime), CAST(0x000090FC00000000 AS DateTime), NULL, 1, NULL, NULL, CAST(8.917 AS Decimal(5, 3)), CAST(7.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4175090074723', N'417509007', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.833 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4179693599616', N'417969359', N'9616', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4208717589602', N'420871758', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4247399027237', N'424739902', N'7237', NULL, NULL, NULL, 0, NULL, NULL, CAST(32.667 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4250422319611', N'425042231', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4253091769617', N'425309176', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.333 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4269055689617', N'426905568', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.167 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4270457787634', N'427045778', N'7634', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.750 AS Decimal(5, 3)), CAST(6.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4275325939520', N'427532593', N'9520', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.583 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4291981877286', N'429198187', N'7286', NULL, CAST(0x0000999700000000 AS DateTime), NULL, 0, NULL, NULL, CAST(1.917 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4298298157292', N'429829815', N'7292', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4300156449611', N'430015644', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.750 AS Decimal(5, 3)), CAST(11.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4312686557286', N'431268655', N'7286', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.333 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4314357759609', N'431435775', N'9609', NULL, NULL, NULL, 0, NULL, NULL, CAST(32.500 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4354615205062', N'435461520', N'5062', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.583 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4358641379602', N'435864137', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.000 AS Decimal(5, 3)), CAST(5.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4368085547285', N'436808554', N'7285', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4372170297510', N'437217029', N'7510', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.833 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4383797379611', N'438379737', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4405655399617', N'440565539', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.833 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4426064719617', N'442606471', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.000 AS Decimal(5, 3)), CAST(3.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4429987389615', N'442998738', N'9615', NULL, NULL, NULL, 0, NULL, NULL, CAST(25.917 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4444509369617', N'444450936', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.917 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4444923679615', N'444492367', N'9615', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.250 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4462806794804', N'446280679', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.167 AS Decimal(5, 3)), CAST(3.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4464047414723', N'446404741', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.000 AS Decimal(5, 3)), CAST(4.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4466184988119', N'446618498', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.000 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4472269034722', N'447226903', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.417 AS Decimal(5, 3)), CAST(5.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4476025094804', N'447602509', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.500 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4480215439617', N'448021543', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.333 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4499679184722', N'449967918', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.833 AS Decimal(5, 3)), CAST(7.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4502022214722', N'450202221', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.000 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4523125314722', N'452312531', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.000 AS Decimal(5, 3)), CAST(6.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4524672289617', N'452467228', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4527476034804', N'452747603', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.833 AS Decimal(5, 3)), CAST(6.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4529097329611', N'452909732', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4534272399617', N'453427239', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(32.083 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4535657494726', N'453565749', N'4726', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.167 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4554621849617', N'455462184', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(33.667 AS Decimal(5, 3)), CAST(6.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4578523417294', N'457852341', N'7294', NULL, NULL, NULL, 0, NULL, NULL, CAST(28.750 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4579044499602', N'457904449', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4586965646102', N'458696564', N'6102', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4603744089139', N'460374408', N'9139', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.500 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4610035357704', N'461003535', N'7704', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.500 AS Decimal(5, 3)), CAST(2.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4647838519613', N'464783851', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.917 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4659687098540', N'465968709', N'8540', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.167 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4667651874723', N'466765187', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.250 AS Decimal(5, 3)), CAST(4.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4726839299611', N'472683929', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.250 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4732879930245', N'473287993', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.583 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4739301620245', N'473930162', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.417 AS Decimal(5, 3)), CAST(2.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4742957069522', N'474295706', N'9522', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.667 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4744280914722', N'474428091', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.333 AS Decimal(5, 3)), CAST(4.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4762024604722', N'476202460', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4796855628119', N'479685562', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.167 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4809549409617', N'480954940', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.500 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4834579417281', N'483457941', N'7281', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4834579417284', N'483457941', N'7284', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
GO
print 'Processed 400 total records'
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4837763817235', N'483776381', N'7235', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4852581319616', N'485258131', N'9616', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.500 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4854734179610', N'485473417', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4907333007284', N'490733300', N'7284', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.833 AS Decimal(5, 3)), CAST(4.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4923086639602', N'492308663', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4933260378543', N'493326037', N'8543', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.917 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4936027914723', N'493602791', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.333 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4939185859617', N'493918585', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(16.417 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4952610427237', N'495261042', N'7237', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4966013787284', N'496601378', N'7284', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'4988655347703', N'498865534', N'7703', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.333 AS Decimal(5, 3)), CAST(3.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5011588937234', N'501158893', N'7234', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5011588937704', N'501158893', N'7704', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.833 AS Decimal(5, 3)), CAST(0.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5035371698543', N'503537169', N'8543', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.333 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5048627989723', N'504862798', N'9723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5069691469615', N'506969146', N'9615', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5078138894724', N'507813889', N'4724', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.417 AS Decimal(5, 3)), CAST(4.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5083912654722', N'508391265', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.583 AS Decimal(5, 3)), CAST(3.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5103410509611', N'510341050', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.167 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5104094284805', N'510409428', N'4805', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5109834554723', N'510983455', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5125637196757', N'512563719', N'6757', NULL, NULL, NULL, 0, NULL, NULL, CAST(28.083 AS Decimal(5, 3)), CAST(6.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5134911917236', N'513491191', N'7236', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5143091949722', N'514309194', N'9722', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5156907588118', N'515690758', N'8118', NULL, NULL, NULL, 0, NULL, NULL, CAST(17.500 AS Decimal(5, 3)), CAST(10.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5164638828119', N'516463882', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(37.583 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5166420067285', N'516642006', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.833 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5168258587285', N'516825858', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5191500159610', N'519150015', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5199779207285', N'519977920', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.000 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5208380468540', N'520838046', N'8540', NULL, NULL, NULL, 0, NULL, NULL, CAST(36.750 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5212772106454', N'521277210', N'6454', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.833 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5233694299525', N'523369429', N'9525', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.250 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5239425067511', N'523942506', N'7511', NULL, NULL, NULL, 0, NULL, NULL, CAST(40.250 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5275625990160', N'527562599', N'0160', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.833 AS Decimal(5, 3)), CAST(9.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5329446676453', N'532944667', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.083 AS Decimal(5, 3)), CAST(4.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5361396789615', N'536139678', N'9615', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.250 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5366047707235', N'536604770', N'7235', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.500 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5368464134722', N'536846413', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.500 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5379008889614', N'537900888', N'9614', CAST(0x00006F8400000000 AS DateTime), CAST(0x00007FEE00000000 AS DateTime), NULL, 1, NULL, NULL, CAST(31.333 AS Decimal(5, 3)), CAST(19.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5384163224722', N'538416322', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.917 AS Decimal(5, 3)), CAST(7.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5391860729721', N'539186072', N'9721', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.833 AS Decimal(5, 3)), CAST(2.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5404789149603', N'540478914', N'9603', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5413531579613', N'541353157', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5413531579617', N'541353157', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.917 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5437014944726', N'543701494', N'4726', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.167 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5441081376452', N'544108137', N'6452', NULL, NULL, NULL, 0, NULL, NULL, CAST(35.083 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5445232517511', N'544523251', N'7511', NULL, NULL, NULL, 0, NULL, NULL, CAST(31.250 AS Decimal(5, 3)), CAST(6.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5466557629610', N'546655762', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.500 AS Decimal(5, 3)), CAST(4.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5468810619603', N'546881061', N'9603', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5484006139617', N'548400613', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.750 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5490351869562', N'549035186', N'9562', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.333 AS Decimal(5, 3)), CAST(2.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5491314318542', N'549131431', N'8542', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.083 AS Decimal(5, 3)), CAST(6.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5504816839612', N'550481683', N'9612', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.917 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5518089597250', N'551808959', N'7250', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.167 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5546653647510', N'554665364', N'7510', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.917 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5550680488543', N'555068048', N'8543', NULL, CAST(0x0000916800000000 AS DateTime), NULL, 0, NULL, NULL, CAST(8.083 AS Decimal(5, 3)), CAST(7.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5562722927234', N'556272292', N'7234', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5573984019611', N'557398401', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5573984019615', N'557398401', N'9615', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.583 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5578860669726', N'557886066', N'9726', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.833 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5584720649611', N'558472064', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(31.167 AS Decimal(5, 3)), CAST(8.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5594286367285', N'559428636', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.167 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5627759084723', N'562775908', N'4723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5649559957285', N'564955995', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.250 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5653365009613', N'565336500', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5675933638542', N'567593363', N'8542', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.333 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5676610209617', N'567661020', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.500 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5729884189723', N'572988418', N'9723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5731331889613', N'573133188', N'9613', CAST(0x0000759000000000 AS DateTime), CAST(0x00008CE300000000 AS DateTime), NULL, 1, NULL, NULL, CAST(27.167 AS Decimal(5, 3)), CAST(10.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5745764688118', N'574576468', N'8118', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.833 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5747436547250', N'574743654', N'7250', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.833 AS Decimal(5, 3)), CAST(4.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5761192269612', N'576119226', N'9612', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.917 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5785664819724', N'578566481', N'9724', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.667 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5811984477282', N'581198447', N'7282', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.750 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5816781584354', N'581678158', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(33.750 AS Decimal(5, 3)), CAST(3.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5915662789617', N'591566278', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.083 AS Decimal(5, 3)), CAST(7.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5916463694354', N'591646369', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.167 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'5980876669522', N'598087666', N'9522', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.583 AS Decimal(5, 3)), CAST(9.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6005499509617', N'600549950', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.083 AS Decimal(5, 3)), CAST(1.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6011796829610', N'601179682', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(33.583 AS Decimal(5, 3)), CAST(12.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6018086864348', N'601808686', N'4348', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.083 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6023890749610', N'602389074', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.333 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6028842237704', N'602884223', N'7704', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.417 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6031329607183', N'603132960', N'7183', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.250 AS Decimal(5, 3)), CAST(4.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6084783017235', N'608478301', N'7235', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6104202184723', N'610420218', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.000 AS Decimal(5, 3)), CAST(7.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6110582989602', N'611058298', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.083 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6126649534805', N'612664953', N'4805', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.917 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6147232459612', N'614723245', N'9612', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6147827878119', N'614782787', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6151641269252', N'615164126', N'9252', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.583 AS Decimal(5, 3)), CAST(9.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6178402699612', N'617840269', N'9612', CAST(0x0000980C00000000 AS DateTime), CAST(0x0000980C00000000 AS DateTime), CAST(0x00009AE600000000 AS DateTime), 1, NULL, N'Dean''s Office Comments', CAST(3.000 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)))
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6181830089617', N'618183008', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.167 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6185626314723', N'618562631', N'4723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6195221399325', N'619522139', N'9325', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6212393424354', N'621239342', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(41.167 AS Decimal(5, 3)), CAST(4.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6227756417171', N'622775641', N'7171', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6244231589611', N'624423158', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.167 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6293031169611', N'629303116', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6297539489617', N'629753948', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
GO
print 'Processed 500 total records'
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6309175324353', N'630917532', N'4353', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.250 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6347303788540', N'634730378', N'8540', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.000 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6355581334722', N'635558133', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.667 AS Decimal(5, 3)), CAST(4.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6355583239617', N'635558323', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6358288419610', N'635828841', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.083 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6373036788522', N'637303678', N'8522', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.083 AS Decimal(5, 3)), CAST(5.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6375322019613', N'637532201', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.167 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6379254214723', N'637925421', N'4723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6388946757284', N'638894675', N'7284', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6390941920355', N'639094192', N'0355', NULL, NULL, NULL, 0, NULL, NULL, CAST(35.917 AS Decimal(5, 3)), CAST(6.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6395127899610', N'639512789', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.750 AS Decimal(5, 3)), CAST(5.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6405213169611', N'640521316', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.833 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6411817480245', N'641181748', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.500 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6416132459610', N'641613245', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.917 AS Decimal(5, 3)), CAST(11.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6425021244723', N'642502124', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.083 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6443011869561', N'644301186', N'9561', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.000 AS Decimal(5, 3)), CAST(4.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6458003194804', N'645800319', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.500 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6458708909617', N'645870890', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.083 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6459580919613', N'645958091', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.417 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6479938319611', N'647993831', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.583 AS Decimal(5, 3)), CAST(1.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6484314507511', N'648431450', N'7511', NULL, NULL, NULL, 0, NULL, NULL, CAST(31.833 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6484988144354', N'648498814', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.500 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6488856484722', N'648885648', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.333 AS Decimal(5, 3)), CAST(4.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6505215949617', N'650521594', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.833 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6528151509614', N'652815150', N'9614', CAST(0x0000872500000000 AS DateTime), CAST(0x00008C1600000000 AS DateTime), NULL, 1, NULL, NULL, CAST(14.833 AS Decimal(5, 3)), CAST(11.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6530244228119', N'653024422', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.000 AS Decimal(5, 3)), CAST(8.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6536426864725', N'653642686', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.083 AS Decimal(5, 3)), CAST(2.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6541358704724', N'654135870', N'4724', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.167 AS Decimal(5, 3)), CAST(4.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6571084784920', N'657108478', N'4920', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.417 AS Decimal(5, 3)), CAST(1.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6571320239723', N'657132023', N'9723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6578628359606', N'657862835', N'9606', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6589212917285', N'658921291', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.667 AS Decimal(5, 3)), CAST(7.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6594238429610', N'659423842', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6601363674723', N'660136367', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.833 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6636561719610', N'663656171', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6694937109603', N'669493710', N'9603', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6704941119602', N'670494111', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6712041474723', N'671204147', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6712187587698', N'671218758', N'7698', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.833 AS Decimal(5, 3)), CAST(4.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6733089389610', N'673308938', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6750998327237', N'675099832', N'7237', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.250 AS Decimal(5, 3)), CAST(7.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6810056094722', N'681005609', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.667 AS Decimal(5, 3)), CAST(3.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6811322399617', N'681132239', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.750 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6811550409610', N'681155040', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6817840540384', N'681784054', N'0384', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.833 AS Decimal(5, 3)), CAST(1.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6819501439617', N'681950143', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.333 AS Decimal(5, 3)), CAST(7.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6833057910280', N'683305791', N'0280', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6833057910743', N'683305791', N'0743', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.833 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6836864064723', N'683686406', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.833 AS Decimal(5, 3)), CAST(6.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6860749987284', N'686074998', N'7284', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.750 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6888363788119', N'688836378', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.833 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6911848819617', N'691184881', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6926696904724', N'692669690', N'4724', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.667 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6936145057281', N'693614505', N'7281', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.000 AS Decimal(5, 3)), CAST(2.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6939636214722', N'693963621', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.750 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6943918484723', N'694391848', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.500 AS Decimal(5, 3)), CAST(7.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6954199604723', N'695419960', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6978962239521', N'697896223', N'9521', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.417 AS Decimal(5, 3)), CAST(11.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6980938877293', N'698093887', N'7293', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.750 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'6989974008148', N'698997400', N'8148', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.000 AS Decimal(5, 3)), CAST(4.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7004699689611', N'700469968', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.417 AS Decimal(5, 3)), CAST(8.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7010363114724', N'701036311', N'4724', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.333 AS Decimal(5, 3)), CAST(3.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7010461618118', N'701046161', N'8118', NULL, NULL, NULL, 0, NULL, NULL, CAST(25.000 AS Decimal(5, 3)), CAST(10.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7034694780743', N'703469478', N'0743', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.083 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7037524104722', N'703752410', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.333 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7039254469605', N'703925446', N'9605', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7047275029613', N'704727502', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.000 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7060867909617', N'706086790', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.000 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7070982164722', N'707098216', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.000 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7087709619523', N'708770961', N'9523', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.500 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7091426994722', N'709142699', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.000 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7091815498540', N'709181549', N'8540', NULL, NULL, NULL, 0, NULL, NULL, CAST(16.417 AS Decimal(5, 3)), CAST(4.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7096230114722', N'709623011', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.667 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7098356564722', N'709835656', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(11.000 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7112624027286', N'711262402', N'7286', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.750 AS Decimal(5, 3)), CAST(3.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7137395224722', N'713739522', N'4722', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7137395224726', N'713739522', N'4726', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.000 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7143193739617', N'714319373', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.500 AS Decimal(5, 3)), CAST(5.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7146991627235', N'714699162', N'7235', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.500 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7155739117281', N'715573911', N'7281', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.250 AS Decimal(5, 3)), CAST(3.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7175138329615', N'717513832', N'9615', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7183576437682', N'718357643', N'7682', NULL, NULL, NULL, 0, NULL, NULL, CAST(27.000 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7187667444354', N'718766744', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.167 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7197294518541', N'719729451', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.500 AS Decimal(5, 3)), CAST(3.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7215818419610', N'721581841', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7223083507281', N'722308350', N'7281', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7230019544354', N'723001954', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.417 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7232435727284', N'723243572', N'7284', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.583 AS Decimal(5, 3)), CAST(6.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7251953250245', N'725195325', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(31.833 AS Decimal(5, 3)), CAST(5.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7259074637634', N'725907463', N'7634', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.250 AS Decimal(5, 3)), CAST(1.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7298878108542', N'729887810', N'8542', CAST(0x000092B700000000 AS DateTime), CAST(0x0000971D00000000 AS DateTime), CAST(0x0000911800000000 AS DateTime), 0, NULL, N'D.O. Comments', CAST(6.667 AS Decimal(5, 3)), CAST(3.583 AS Decimal(5, 3)), CAST(7.833 AS Decimal(5, 3)))
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7303296386760', N'730329638', N'6760', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.167 AS Decimal(5, 3)), CAST(5.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7316113989613', N'731611398', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.500 AS Decimal(5, 3)), CAST(5.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7320368439602', N'732036843', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.333 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7322165934723', N'732216593', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.167 AS Decimal(5, 3)), CAST(4.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7325525837281', N'732552583', N'7281', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.167 AS Decimal(5, 3)), CAST(3.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7337216744723', N'733721674', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.917 AS Decimal(5, 3)), CAST(1.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7347548079617', N'734754807', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7358831914723', N'735883191', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.417 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7369684477634', N'736968447', N'7634', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.417 AS Decimal(5, 3)), CAST(1.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7394407749610', N'739440774', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(27.750 AS Decimal(5, 3)), CAST(8.583 AS Decimal(5, 3)), NULL)
GO
print 'Processed 600 total records'
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7403855964723', N'740385596', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.750 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7426683797236', N'742668379', N'7236', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.417 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7434186917235', N'743418691', N'7235', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.917 AS Decimal(5, 3)), CAST(1.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7443169859617', N'744316985', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7447169459611', N'744716945', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.083 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7477701399606', N'747770139', N'9606', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.500 AS Decimal(5, 3)), CAST(3.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7479245049617', N'747924504', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7486808244723', N'748680824', N'4723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7532162747285', N'753216274', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.250 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7537184699524', N'753718469', N'9524', NULL, NULL, NULL, 0, NULL, NULL, CAST(26.250 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7540213199614', N'754021319', N'9614', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.583 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7550937219611', N'755093721', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.167 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7551517689522', N'755151768', N'9522', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.833 AS Decimal(5, 3)), CAST(4.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7555371984723', N'755537198', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.667 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7561636304722', N'756163630', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.500 AS Decimal(5, 3)), CAST(2.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7572226179617', N'757222617', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(17.667 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7581276097212', N'758127609', N'7212', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7586364017540', N'758636401', N'7540', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.750 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7613518814723', N'761351881', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.833 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7614516400355', N'761451640', N'0355', NULL, NULL, NULL, 0, NULL, NULL, CAST(17.583 AS Decimal(5, 3)), CAST(5.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7645404154723', N'764540415', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.417 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7648622569610', N'764862256', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.917 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7648750767236', N'764875076', N'7236', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.417 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7670232604723', N'767023260', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.750 AS Decimal(5, 3)), CAST(4.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7674105177684', N'767410517', N'7684', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7674282539610', N'767428253', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7677766519614', N'767776651', N'9614', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7679268019613', N'767926801', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7693822277234', N'769382227', N'7234', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.000 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7706986529610', N'770698652', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(25.917 AS Decimal(5, 3)), CAST(4.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7713879419602', N'771387941', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.250 AS Decimal(5, 3)), CAST(10.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7770100267703', N'777010026', N'7703', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7776486764722', N'777648676', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(37.667 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7779413116453', N'777941311', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7803769197285', N'780376919', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.833 AS Decimal(5, 3)), CAST(12.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7864027019611', N'786402701', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(37.500 AS Decimal(5, 3)), CAST(11.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7867572378651', N'786757237', N'8651', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.500 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7873365774723', N'787336577', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.333 AS Decimal(5, 3)), CAST(9.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7885236039325', N'788523603', N'9325', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.417 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7888535214722', N'788853521', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.000 AS Decimal(5, 3)), CAST(10.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7898937577234', N'789893757', N'7234', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7913639899613', N'791363989', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7921555254723', N'792155525', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.333 AS Decimal(5, 3)), CAST(1.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7932956849617', N'793295684', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.917 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7933125134722', N'793312513', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.083 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7988897629613', N'798889762', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.333 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7995033544722', N'799503354', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.250 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'7995033544723', N'799503354', N'4723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8033137749603', N'803313774', N'9603', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.583 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8035869324722', N'803586932', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.083 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8036568757235', N'803656875', N'7235', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8038371110280', N'803837111', N'0280', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.833 AS Decimal(5, 3)), CAST(5.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8068072020245', N'806807202', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.417 AS Decimal(5, 3)), CAST(5.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8076662357634', N'807666235', N'7634', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.917 AS Decimal(5, 3)), CAST(5.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8081172467247', N'808117246', N'7247', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.333 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8086478469605', N'808647846', N'9605', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.583 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8089865254726', N'808986525', N'4726', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.333 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8096952169611', N'809695216', N'9611', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8096952169612', N'809695216', N'9612', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8100038979617', N'810003897', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8101677184723', N'810167718', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.917 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8101981929610', N'810198192', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.000 AS Decimal(5, 3)), CAST(10.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8106801405426', N'810680140', N'5426', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.917 AS Decimal(5, 3)), CAST(5.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8114926519323', N'811492651', N'9323', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8148127494722', N'814812749', N'4722', CAST(0x00008AA400000000 AS DateTime), CAST(0x000090B100000000 AS DateTime), CAST(0x00008EE700000000 AS DateTime), 1, NULL, NULL, CAST(12.333 AS Decimal(5, 3)), CAST(8.083 AS Decimal(5, 3)), CAST(9.417 AS Decimal(5, 3)))
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8199920259603', N'819992025', N'9603', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.917 AS Decimal(5, 3)), CAST(6.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8200503590245', N'820050359', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8208741969723', N'820874196', N'9723', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.250 AS Decimal(5, 3)), CAST(2.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8215678078540', N'821567807', N'8540', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.250 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8217916708541', N'821791670', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.083 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8217916709562', N'821791670', N'9562', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8230584667236', N'823058466', N'7236', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.417 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8244982659611', N'824498265', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(25.750 AS Decimal(5, 3)), CAST(8.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8279443077247', N'827944307', N'7247', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.167 AS Decimal(5, 3)), CAST(0.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8281440637182', N'828144063', N'7182', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8295287699721', N'829528769', N'9721', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.500 AS Decimal(5, 3)), CAST(9.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8297635079605', N'829763507', N'9605', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8321475576453', N'832147557', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(25.500 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8367432457248', N'836743245', N'7248', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8374586378649', N'837458637', N'8649', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.917 AS Decimal(5, 3)), CAST(7.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8381633927294', N'838163392', N'7294', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.250 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8384051087237', N'838405108', N'7237', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8391202689610', N'839120268', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8423025807234', N'842302580', N'7234', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.000 AS Decimal(5, 3)), CAST(2.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8442191700245', N'844219170', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.250 AS Decimal(5, 3)), CAST(3.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8446515628543', N'844651562', N'8543', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.000 AS Decimal(5, 3)), CAST(6.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8448695947510', N'844869594', N'7510', NULL, NULL, NULL, 0, NULL, NULL, CAST(12.250 AS Decimal(5, 3)), CAST(3.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8471431537285', N'847143153', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.500 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8479533537234', N'847953353', N'7234', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.750 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8484480154725', N'848448015', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.833 AS Decimal(5, 3)), CAST(5.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8491820689614', N'849182068', N'9614', CAST(0x00006E7300000000 AS DateTime), CAST(0x0000957300000000 AS DateTime), NULL, 1, NULL, NULL, CAST(32.083 AS Decimal(5, 3)), CAST(4.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8521680469616', N'852168046', N'9616', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8534886589610', N'853488658', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8563845169525', N'856384516', N'9525', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.417 AS Decimal(5, 3)), CAST(1.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8565447629617', N'856544762', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.000 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8568670494353', N'856867049', N'4353', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.417 AS Decimal(5, 3)), CAST(12.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8577906464722', N'857790646', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.250 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8580876389612', N'858087638', N'9612', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8581128247682', N'858112824', N'7682', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.917 AS Decimal(5, 3)), CAST(2.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8623691214722', N'862369121', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8629269539611', N'862926953', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.667 AS Decimal(5, 3)), CAST(2.833 AS Decimal(5, 3)), NULL)
GO
print 'Processed 700 total records'
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8635702559602', N'863570255', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8645743144723', N'864574314', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.500 AS Decimal(5, 3)), CAST(8.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8646292419722', N'864629241', N'9722', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.667 AS Decimal(5, 3)), CAST(2.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8658739700245', N'865873970', N'0245', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8675529604804', N'867552960', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(37.750 AS Decimal(5, 3)), CAST(3.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8683390949611', N'868339094', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(15.500 AS Decimal(5, 3)), CAST(12.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8694630919617', N'869463091', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(39.250 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8711694057285', N'871169405', N'7285', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.583 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8727000916102', N'872700091', N'6102', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8731755744723', N'873175574', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.917 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8735567819610', N'873556781', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.000 AS Decimal(5, 3)), CAST(3.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8737413914726', N'873741391', N'4726', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.667 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8745583494723', N'874558349', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.583 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8754213234723', N'875421323', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(25.833 AS Decimal(5, 3)), CAST(6.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8763071908118', N'876307190', N'8118', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.000 AS Decimal(5, 3)), CAST(12.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8765971708119', N'876597170', N'8119', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8774988574804', N'877498857', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.250 AS Decimal(5, 3)), CAST(6.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8796697524722', N'879669752', N'4722', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8814481617238', N'881448161', N'7238', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.500 AS Decimal(5, 3)), CAST(0.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8814579649614', N'881457964', N'9614', CAST(0x0000716B00000000 AS DateTime), CAST(0x0000802B00000000 AS DateTime), NULL, 1, NULL, NULL, CAST(30.000 AS Decimal(5, 3)), CAST(19.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8815448117683', N'881544811', N'7683', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8877281457235', N'887728145', N'7235', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.500 AS Decimal(5, 3)), CAST(3.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8880439167284', N'888043916', N'7284', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.083 AS Decimal(5, 3)), CAST(4.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8897765304722', N'889776530', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.833 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8898342224725', N'889834222', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.417 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8908156999617', N'890815699', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8910711514354', N'891071151', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.833 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8929749999613', N'892974999', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.583 AS Decimal(5, 3)), CAST(3.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8945456809613', N'894545680', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.250 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8961215899606', N'896121589', N'9606', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8967414519613', N'896741451', N'9613', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.333 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8978508719521', N'897850871', N'9521', NULL, NULL, NULL, 0, NULL, NULL, CAST(28.667 AS Decimal(5, 3)), CAST(8.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'8996705176453', N'899670517', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.500 AS Decimal(5, 3)), CAST(5.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9005246207511', N'900524620', N'7511', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(1.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9032077444722', N'903207744', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.917 AS Decimal(5, 3)), CAST(3.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9043502206452', N'904350220', N'6452', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.333 AS Decimal(5, 3)), CAST(3.333 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9051464784722', N'905146478', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.667 AS Decimal(5, 3)), CAST(1.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9064376117248', N'906437611', N'7248', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9066470299610', N'906647029', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.000 AS Decimal(5, 3)), CAST(5.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9068233989612', N'906823398', N'9612', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9069147424354', N'906914742', N'4354', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9069147424723', N'906914742', N'4723', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9071979589617', N'907197958', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.167 AS Decimal(5, 3)), CAST(2.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9078583934722', N'907858393', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.250 AS Decimal(5, 3)), CAST(3.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9087048934723', N'908704893', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(31.333 AS Decimal(5, 3)), CAST(7.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9129338359617', N'912933835', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9136072149611', N'913607214', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.750 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9159035878523', N'915903587', N'8523', NULL, NULL, NULL, 0, NULL, NULL, CAST(17.250 AS Decimal(5, 3)), CAST(2.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9200357719610', N'920035771', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.333 AS Decimal(5, 3)), CAST(5.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9205671387286', N'920567138', N'7286', NULL, NULL, NULL, 0, NULL, NULL, CAST(30.917 AS Decimal(5, 3)), CAST(2.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9205963689611', N'920596368', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.667 AS Decimal(5, 3)), CAST(0.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9218813897235', N'921881389', N'7235', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.250 AS Decimal(5, 3)), CAST(0.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9219274719613', N'921927471', N'9613', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9243867667294', N'924386766', N'7294', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.833 AS Decimal(5, 3)), CAST(5.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9262517609611', N'926251760', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.083 AS Decimal(5, 3)), CAST(7.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9331478459602', N'933147845', N'9602', NULL, NULL, NULL, 0, NULL, NULL, CAST(23.750 AS Decimal(5, 3)), CAST(9.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9341156359611', N'934115635', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.583 AS Decimal(5, 3)), CAST(4.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9373793609611', N'937379360', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.167 AS Decimal(5, 3)), CAST(11.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9377790988118', N'937779098', N'8118', NULL, NULL, NULL, 0, NULL, NULL, CAST(29.167 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9384454677237', N'938445467', N'7237', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9394945974723', N'939494597', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.250 AS Decimal(5, 3)), CAST(7.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9395535744804', N'939553574', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(14.667 AS Decimal(5, 3)), CAST(10.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9404398138119', N'940439813', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.750 AS Decimal(5, 3)), CAST(4.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9413419359617', N'941341935', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9424965898543', N'942496589', N'8543', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.167 AS Decimal(5, 3)), CAST(4.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9430377478541', N'943037747', N'8541', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.333 AS Decimal(5, 3)), CAST(5.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9434283264722', N'943428326', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.667 AS Decimal(5, 3)), CAST(2.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9455249737703', N'945524973', N'7703', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.833 AS Decimal(5, 3)), CAST(2.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9463264444724', N'946326444', N'4724', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.667 AS Decimal(5, 3)), CAST(1.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9472832069610', N'947283206', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(22.000 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9490705770245', N'949070577', N'0245', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.000 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9490705777250', N'949070577', N'7250', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9490998084804', N'949099808', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.167 AS Decimal(5, 3)), CAST(4.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9508973977680', N'950897397', N'7680', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.083 AS Decimal(5, 3)), CAST(1.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9518796679610', N'951879667', N'9610', NULL, NULL, NULL, 0, NULL, NULL, CAST(9.917 AS Decimal(5, 3)), CAST(9.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9546977289617', N'954697728', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(21.083 AS Decimal(5, 3)), CAST(3.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9558834424722', N'955883442', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.417 AS Decimal(5, 3)), CAST(1.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9563107597238', N'956310759', N'7238', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.417 AS Decimal(5, 3)), CAST(3.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9566139548119', N'956613954', N'8119', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.667 AS Decimal(5, 3)), CAST(2.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9572922537235', N'957292253', N'7235', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.083 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9576205784723', N'957620578', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.250 AS Decimal(5, 3)), CAST(2.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9644080419617', N'964408041', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9663630618540', N'966363061', N'8540', NULL, NULL, NULL, 0, NULL, NULL, CAST(19.333 AS Decimal(5, 3)), CAST(8.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9701995439610', N'970199543', N'9610', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9704670804723', N'970467080', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(31.917 AS Decimal(5, 3)), CAST(7.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9709889459602', N'970988945', N'9602', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9713882447294', N'971388244', N'7294', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.750 AS Decimal(5, 3)), CAST(1.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9722228227288', N'972222822', N'7288', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9728707379617', N'972870737', N'9617', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9754085689617', N'975408568', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.083 AS Decimal(5, 3)), CAST(0.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9759969509523', N'975996950', N'9523', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9764762189617', N'976476218', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.833 AS Decimal(5, 3)), CAST(3.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9767457036454', N'976745703', N'6454', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.333 AS Decimal(5, 3)), CAST(0.917 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9775359210384', N'977535921', N'0384', CAST(0x000074CA00000000 AS DateTime), CAST(0x000089AD00000000 AS DateTime), CAST(0x00006D1400000000 AS DateTime), 0, N'Tom''s Department Comments...', NULL, CAST(27.667 AS Decimal(5, 3)), CAST(13.000 AS Decimal(5, 3)), CAST(33.083 AS Decimal(5, 3)))
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9790858599611', N'979085859', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.917 AS Decimal(5, 3)), CAST(4.167 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9812594194722', N'981259419', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(20.167 AS Decimal(5, 3)), CAST(3.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9814092877281', N'981409287', N'7281', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.000 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9821325734804', N'982132573', N'4804', NULL, NULL, NULL, 0, NULL, NULL, CAST(4.833 AS Decimal(5, 3)), CAST(4.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9842688624725', N'984268862', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.917 AS Decimal(5, 3)), CAST(1.667 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9844897819617', N'984489781', N'9617', NULL, NULL, NULL, 0, NULL, NULL, CAST(18.500 AS Decimal(5, 3)), CAST(7.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9850580729326', N'985058072', N'9326', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
GO
print 'Processed 800 total records'
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9861558694356', N'986155869', N'4356', NULL, NULL, NULL, 0, NULL, NULL, CAST(6.833 AS Decimal(5, 3)), CAST(1.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9864304374722', N'986430437', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(5.167 AS Decimal(5, 3)), CAST(4.583 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9888502697234', N'988850269', N'7234', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9888943664722', N'988894366', N'4722', NULL, NULL, NULL, 0, NULL, NULL, CAST(1.833 AS Decimal(5, 3)), CAST(1.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9892314024723', N'989231402', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(7.500 AS Decimal(5, 3)), CAST(5.250 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9903839037634', N'990383903', N'7634', NULL, NULL, NULL, 0, NULL, NULL, CAST(10.583 AS Decimal(5, 3)), CAST(3.417 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9929326086453', N'992932608', N'6453', NULL, NULL, NULL, 0, NULL, NULL, CAST(0.500 AS Decimal(5, 3)), CAST(0.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9931924679561', N'993192467', N'9561', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9938541404723', N'993854140', N'4723', NULL, NULL, NULL, 0, NULL, NULL, CAST(2.083 AS Decimal(5, 3)), CAST(2.083 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9941168384725', N'994116838', N'4725', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.667 AS Decimal(5, 3)), CAST(2.833 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9943516906761', N'994351690', N'6761', NULL, NULL, NULL, 0, NULL, NULL, CAST(13.750 AS Decimal(5, 3)), CAST(8.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9966070659614', N'996607065', N'9614', CAST(0x000090A900000000 AS DateTime), CAST(0x0000913F00000000 AS DateTime), NULL, 1, NULL, NULL, CAST(8.167 AS Decimal(5, 3)), CAST(7.750 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9979859409561', N'997985940', N'9561', NULL, NULL, NULL, 0, NULL, NULL, CAST(3.417 AS Decimal(5, 3)), CAST(2.000 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9986833879611', N'998683387', N'9611', NULL, NULL, NULL, 0, NULL, NULL, CAST(8.500 AS Decimal(5, 3)), CAST(8.500 AS Decimal(5, 3)), NULL)
INSERT [dbo].[Employee] ([PkEmployee], [EmployeeID], [TitleCode], [CareerHireDate], [ApptHireDate], [ExperienceBeginDate], [DatesHaveBeenAdjusted], [DepartmentComments], [DeansOfficeComments], [YearsOfService], [TimeInTitle], [YearsOfExperience]) VALUES (N'9988671969614', N'998867196', N'9614', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[UCDEmployee_AddIns]    Script Date: 07/01/2009 15:45:47 ******/
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
INSERT [dbo].[UCDEmployee_AddIns] ([PkEmployee], [EmployeeID], [HomeDept], [WorkDept], [Different], [EmpName], [FirstName], [MiddleName], [LastName], [TC], [HireDate], [BeginDate], [PayRate], [ApptType], [SalaryGrade], [BargainingUnit], [SalaryStep]) VALUES (N'0000000010000', N'000000001', N'030000', N'030000', 0, N'LDAP,CAES', N'CAES', NULL, N'LDAP', N'9999', N'01/04/2009', N'01/04/2009', CAST(1.0000 AS Decimal(15, 4)), N'2', NULL, N'99', NULL)
INSERT [dbo].[UCDEmployee_AddIns] ([PkEmployee], [EmployeeID], [HomeDept], [WorkDept], [Different], [EmpName], [FirstName], [MiddleName], [LastName], [TC], [HireDate], [BeginDate], [PayRate], [ApptType], [SalaryGrade], [BargainingUnit], [SalaryStep]) VALUES (N'0000000020000', N'000000002', N'030000', N'030000', 0, N'Test,WatchFire', N'WatchFire', NULL, N'Test', N'9999', N'01/06/2009', N'01/06/2009', CAST(1.0000 AS Decimal(15, 4)), N'2', NULL, N'99', NULL)
/****** Object:  View [dbo].[Title]    Script Date: 07/01/2009 15:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Title]
AS
SELECT DISTINCT TOP (100) PERCENT TitleCode, Name AS PayrollTitle, AbbreviatedName
FROM         PPSDataMart.dbo.Titles AS t1
WHERE     (TitleCode >= 4000) OR
                      (TitleCode BETWEEN 0101 AND 0999)
ORDER BY TitleCode
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Title'
GO
/****** Object:  View [dbo].[vUserUnit]    Script Date: 07/01/2009 15:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUserUnit]
AS
SELECT     Catbert.dbo.UserUnit.UnitID, Catbert.dbo.UserUnit.UserID, Catbert.dbo.Unit.FIS_Code
FROM         Catbert.dbo.UserUnit INNER JOIN
                      Catbert.dbo.Unit ON Catbert.dbo.UserUnit.UnitID = Catbert.dbo.Unit.UnitID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserUnit (Catbert.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 93
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Unit (Catbert.dbo)"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserUnit'
GO
/****** Object:  View [dbo].[vUsers]    Script Date: 07/01/2009 15:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUsers]
AS
SELECT     UserID, FirstName, LastName, EmployeeID, StudentID, UserImage, SID, Inactive, UserKey
FROM         Catbert.dbo.Users
WHERE     (Inactive = 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users (Catbert.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
/****** Object:  View [dbo].[vUnit]    Script Date: 07/01/2009 15:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUnit]
AS
SELECT     UnitID, FullName, ShortName, PPS_Code, FIS_Code, SchoolCode
FROM         CATBERT.dbo.Unit
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Unit (CATBERT.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUnit'
GO
/****** Object:  View [dbo].[vLogin]    Script Date: 07/01/2009 15:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLogin]
AS
SELECT     LoginID, UserID
FROM         Catbert.dbo.Login
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Login (Catbert.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 93
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLogin'
GO
/****** Object:  View [dbo].[UCDEmployee]    Script Date: 07/01/2009 15:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UCDEmployee]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT APTDIS_V.EmployeeID + APTDIS_V.TitleCode AS PkEmployee, APTDIS_V.EmployeeID, APTDIS_V.HomeDepartment AS HomeDept, 
                      APTDIS_V.WorkDepartment AS WorkDept, CASE APTDIS_V.HOMEDEPARTMENT WHEN APTDIS_V.WORKDEPARTMENT THEN '' ELSE 1 END AS Different, 
                      APTDIS_V.FullName AS EmpName, Persons.FirstName, Persons.MiddleName, Persons.LastName, APTDIS_V.TitleCode AS TC, CONVERT(varchar(10), 
                      APTDIS_V.HireDate, 101) AS HireDate, CONVERT(varchar(10), APTDIS_V.ApptBeginDate, 101) AS BeginDate, 
                      CASE APTDIS_V.RATECODE WHEN 'H' THEN APTDIS_V.PAYRATE * 2080 WHEN 'B' THEN APTDIS_V.PAYRATE * 12 ELSE APTDIS_V.PAYRATE END AS PayRate, 
                      APTDIS_V.TypeCode AS ApptType, APTDIS_V.Grade AS SalaryGrade, APTDIS_V.TitleUnitCode AS BargainingUnit, APTDIS_V.Step AS SalaryStep
FROM         PPSDataMart.dbo.APTDIS_V AS APTDIS_V INNER JOIN
                      PPSDataMart.dbo.Persons AS Persons ON APTDIS_V.EmployeeID = Persons.EmployeeID
WHERE     (APTDIS_V.PayRate IN
                          (SELECT     MAX(PayRate) AS Expr1
                            FROM          PPSDataMart.dbo.APTDIS_V AS adv
                            WHERE      (APTDIS_V.EmployeeID = EmployeeID) AND (ApptEndDate IS NULL OR
                                                   ApptEndDate > GETDATE()) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                   PayEnd > GETDATE()) AND (DOSCode = 'REG') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN ('2', '7')))) AND 
                      (APTDIS_V.DistNo IN
                          (SELECT     TOP (1) DistNo
                            FROM          PPSDataMart.dbo.APTDIS_V AS APTDIS_V_1
                            WHERE      (ApptEndDate IS NULL OR
                                                   ApptEndDate > GETDATE()) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                   PayEnd > GETDATE()) AND (DOSCode = 'REG') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN ('2', '7')))) AND 
                      (APTDIS_V.ApptBeginDate IN
                          (SELECT     MAX(ApptBeginDate) AS Expr1
                            FROM          PPSDataMart.dbo.APTDIS_V AS APTDIS_V_2
                            WHERE      (ApptBeginDate <= GETDATE()) AND (ApptEndDate IS NULL OR
                                                   ApptEndDate > GETDATE()) AND (EmployeeID = APTDIS_V.EmployeeID) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                   PayEnd > GETDATE()) AND (DOSCode = 'REG') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN ('2', '7'))))
ORDER BY PkEmployee
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "APTDIS_V"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Persons"
            Begin Extent = 
               Top = 6
               Left = 290
               Bottom = 123
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UCDEmployee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UCDEmployee'
GO
/****** Object:  View [dbo].[Departments]    Script Date: 07/01/2009 15:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Departments]
AS
SELECT     TOP (100) PERCENT HomeDeptNo AS DepartmentNumber, Name, Abbreviation AS ShortName, SchoolCode
FROM         PPSDataMart.dbo.Departments AS Departments_1
WHERE     (HomeDeptNo IN
                          (SELECT DISTINCT HomeDeptNo
                            FROM          PPSDataMart.dbo.Departments AS Departments_2
                            WHERE      (HomeDeptNo LIKE '030%') AND (SchoolCode IN ('01', '60', '75', '89', '99'))))
ORDER BY Name, ShortName
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Departments_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 2955
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Departments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Departments'
GO
/****** Object:  View [dbo].[APTDIS_V2]    Script Date: 07/01/2009 15:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[APTDIS_V2]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT EmployeeID + TitleCode AS PkEmployee, EmployeeID, FullName, UCDMailID, HomeDepartment, HireDate, OriginalHireDate, EmployeeStatus, 
                      TitleCode, AlternateDepartment, AdministrativeDepartment, WorkDepartment, SchoolDivision, RepresentedCode, WOSCode, ADCCode, TypeCode, Grade, 
                      PersonnelProgram, TitleUnitCode, ApptBeginDate, ApptEndDate, PaySchedule, LeaveAccrualCode, DOSCode, PayRate, [Percent], FixedVarCode, AcademicBasis, 
                      PaidOver, DistNo, ApptNo, DepartmentNo, OrgCode, FTE, PayBegin, PayEnd, DistPercent, DistPayRate, RateCode, Step, Chart, Account, SubAccount, Object, 
                      SubObject, Project, OPFund
FROM         PPSDataMart.dbo.APTDIS_V
WHERE     (ApptEndDate IS NULL OR
                      ApptEndDate > GETDATE()) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                      PayEnd > GETDATE()) AND (DOSCode = 'REG') AND (PayRate IN
                          (SELECT     MAX(PayRate) AS Expr1
                            FROM          PPSDataMart.dbo.APTDIS_V AS adv
                            WHERE      (PPSDataMart.dbo.APTDIS_V.EmployeeID = EmployeeID))) AND (ApptBeginDate IN
                          (SELECT     MAX(ApptBeginDate) AS Expr1
                            FROM          PPSDataMart.dbo.APTDIS_V AS adv
                            WHERE      (PPSDataMart.dbo.APTDIS_V.EmployeeID = EmployeeID))) AND (DistNo IN
                          (SELECT     TOP (1) DistNo
                            FROM          PPSDataMart.dbo.APTDIS_V AS aptdis
                            WHERE      (ApptEndDate IS NULL OR
                                                   ApptEndDate > GETDATE()) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                   PayEnd > GETDATE()) AND (DOSCode = 'REG') AND (EmployeeID = PPSDataMart.dbo.APTDIS_V.EmployeeID))) AND (TypeCode IN ('2', '7')) AND 
                      (PayRate > 0)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "APTDIS_V (PPSDataMart.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 49
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'APTDIS_V2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'APTDIS_V2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'APTDIS_V2'
GO
/****** Object:  Table [dbo].[SalaryReviewAnalysis]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalaryReviewAnalysis](
	[SalaryReviewAnalysisID] [int] IDENTITY(101,1) NOT NULL,
	[ReferenceNumber] [varchar](50) NULL,
	[DateInitiated] [datetime] NOT NULL,
	[DateApproved] [datetime] NULL,
	[DepartmentComments] [varchar](max) NULL,
	[DeansOfficeComments] [varchar](max) NULL,
	[InitiatedByReviewerName] [varchar](64) NOT NULL,
	[DepartmentNumber] [char](6) NULL,
	[ApprovedScenarioID] [int] NULL,
	[TitleCode] [char](4) NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[IsReclass] [bit] NOT NULL,
	[CurrentTitleCode] [char](4) NULL,
	[PkSRAEmployee] [int] NULL,
 CONSTRAINT [PkSalaryReviewAnalysis] PRIMARY KEY CLUSTERED 
(
	[SalaryReviewAnalysisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SalaryReviewAnalysis] ON
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (144, N'20081209144', CAST(0x00009B6D00000000 AS DateTime), CAST(0x00009B6B00000000 AS DateTime), NULL, NULL, N'TAYLOR, KENNETH', N'030000', 198, N'9611', CAST(0x000099BA00000000 AS DateTime), 0, N'9611', 148)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (145, N'20081210145', CAST(0x00009B6E00000000 AS DateTime), NULL, NULL, N'test to exclude non-department users', N'TAYLOR, KENNETH', N'030000', NULL, N'9610', CAST(0x000099BA00000000 AS DateTime), 0, N'9610', 149)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (146, N'20090126146', CAST(0x00009B9D00000000 AS DateTime), CAST(0x00009B6C00000000 AS DateTime), NULL, N'Deans office comments', N'TAYLOR, KENNETH', N'030000', 202, N'9612', CAST(0x000099BA00000000 AS DateTime), 1, N'9613', 150)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (147, N'20090130147', CAST(0x00009BA100000000 AS DateTime), NULL, NULL, NULL, N'Taylor, Kenneth', N'030000', NULL, N'7286', CAST(0x000099BA00000000 AS DateTime), 1, N'7285', 151)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (148, N'20090313148', CAST(0x00009BCB00000000 AS DateTime), NULL, NULL, N'test to see if this will be excluded when I impersonate department user.', N'Taylor, Kenneth', N'030000', NULL, N'9617', CAST(0x000099BA00000000 AS DateTime), 0, N'9617', 152)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (149, N'20090313149', CAST(0x00009BCB00000000 AS DateTime), NULL, N'Department comments: Equity review.', NULL, N'Taylor, Kenneth', N'030000', NULL, N'7285', CAST(0x000099BA00000000 AS DateTime), 0, N'7285', 153)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (150, N'20090319150', CAST(0x00009BD100000000 AS DateTime), NULL, NULL, NULL, N'Taylor, Kenneth', N'030000', NULL, N'4725', CAST(0x000099BA00000000 AS DateTime), 1, N'4722', 154)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (151, N'20090319151', CAST(0x00009BD100000000 AS DateTime), NULL, NULL, NULL, N'Taylor, Kenneth', N'030000', NULL, N'9610', CAST(0x000099BA00000000 AS DateTime), 0, N'9610', 155)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (152, N'20090408152', CAST(0x00009BE500000000 AS DateTime), NULL, NULL, NULL, N'Chriss, Brenda', N'030000', NULL, N'9614', CAST(0x000099BA00000000 AS DateTime), 0, N'9614', 156)
INSERT [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID], [ReferenceNumber], [DateInitiated], [DateApproved], [DepartmentComments], [DeansOfficeComments], [InitiatedByReviewerName], [DepartmentNumber], [ApprovedScenarioID], [TitleCode], [EffectiveDate], [IsReclass], [CurrentTitleCode], [PkSRAEmployee]) VALUES (153, N'20090507153', CAST(0x00009C0200000000 AS DateTime), NULL, NULL, NULL, N'Taylor, Kenneth', N'030000', NULL, N'9609', CAST(0x000099BA00000000 AS DateTime), 1, N'9610', 157)
SET IDENTITY_INSERT [dbo].[SalaryReviewAnalysis] OFF
/****** Object:  Table [dbo].[Scenario]    Script Date: 07/01/2009 15:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scenario](
	[ScenarioID] [int] IDENTITY(101,1) NOT NULL,
	[SalaryReviewAnalysisID] [int] NOT NULL,
	[SelectionType] [varchar](20) NULL,
	[ScenarioNumber] [int] NOT NULL,
	[PercentIncrease] [decimal](6, 3) NULL,
	[SalaryAmount] [money] NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [ScenarioID] PRIMARY KEY CLUSTERED 
(
	[ScenarioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Scenario] ON
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (197, 144, N'None', 1, CAST(0.010 AS Decimal(6, 3)), 52515.9600, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (198, 144, N'Step 13.0 ', 2, CAST(0.020 AS Decimal(6, 3)), 53038.0000, 1)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (199, 145, N'None', 1, CAST(0.000 AS Decimal(6, 3)), 52800.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (200, 146, N'Step 8.0  ', 1, CAST(0.048 AS Decimal(6, 3)), 43584.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (201, 146, N'Step 9.0  ', 2, CAST(0.069 AS Decimal(6, 3)), 44455.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (202, 146, N'None', 3, CAST(0.100 AS Decimal(6, 3)), 45751.2000, 1)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (203, 147, N'None', 1, CAST(0.074 AS Decimal(6, 3)), 80000.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (204, 148, N'None', 1, CAST(0.000 AS Decimal(6, 3)), 61032.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (205, 149, N'3rd', 1, CAST(0.044 AS Decimal(6, 3)), 66828.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (206, 149, N'None', 2, CAST(0.050 AS Decimal(6, 3)), 67187.4000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (207, 150, N'Step 4.0  ', 1, CAST(0.059 AS Decimal(6, 3)), 49884.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (208, 150, N'Step 4.5  ', 2, CAST(0.083 AS Decimal(6, 3)), 50988.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (209, 151, N'Step 20.0 ', 1, CAST(0.020 AS Decimal(6, 3)), 66976.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (210, 151, N'Step 21.0 ', 2, CAST(0.041 AS Decimal(6, 3)), 68321.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (211, 151, N'None', 3, CAST(0.050 AS Decimal(6, 3)), 68947.2000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (212, 152, N'None', 1, CAST(0.150 AS Decimal(6, 3)), 71704.8000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (213, 153, N'1st', 1, CAST(0.045 AS Decimal(6, 3)), 68610.0000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (214, 153, N'None', 2, CAST(0.050 AS Decimal(6, 3)), 68947.2000, 0)
INSERT [dbo].[Scenario] ([ScenarioID], [SalaryReviewAnalysisID], [SelectionType], [ScenarioNumber], [PercentIncrease], [SalaryAmount], [Approved]) VALUES (215, 153, N'None', 3, CAST(0.066 AS Decimal(6, 3)), 70000.0000, 0)
SET IDENTITY_INSERT [dbo].[Scenario] OFF
/****** Object:  Default [DF_SalaryReviewAnalysis_IsReclass]    Script Date: 07/01/2009 15:45:47 ******/
ALTER TABLE [dbo].[SalaryReviewAnalysis] ADD  CONSTRAINT [DF_SalaryReviewAnalysis_IsReclass]  DEFAULT ((0)) FOR [IsReclass]
GO
/****** Object:  ForeignKey [FK_Scenario_SalaryReviewAnalysis]    Script Date: 07/01/2009 15:45:47 ******/
ALTER TABLE [dbo].[Scenario]  WITH CHECK ADD  CONSTRAINT [FK_Scenario_SalaryReviewAnalysis] FOREIGN KEY([SalaryReviewAnalysisID])
REFERENCES [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID])
GO
ALTER TABLE [dbo].[Scenario] CHECK CONSTRAINT [FK_Scenario_SalaryReviewAnalysis]
GO
/****** Object:  ForeignKey [FK_SalaryReviewAnalysis_SalaryScale]    Script Date: 07/01/2009 15:45:47 ******/
ALTER TABLE [dbo].[SalaryReviewAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_SalaryReviewAnalysis_SalaryScale] FOREIGN KEY([TitleCode], [EffectiveDate])
REFERENCES [dbo].[SalaryScale] ([TitleCode], [EffectiveDate])
GO
ALTER TABLE [dbo].[SalaryReviewAnalysis] CHECK CONSTRAINT [FK_SalaryReviewAnalysis_SalaryScale]
GO
/****** Object:  ForeignKey [FK_SalaryGradeMatrix_SalaryScale]    Script Date: 07/01/2009 15:45:47 ******/
ALTER TABLE [dbo].[SalaryGradeMatrix]  WITH CHECK ADD  CONSTRAINT [FK_SalaryGradeMatrix_SalaryScale] FOREIGN KEY([SalaryGrade], [EffectiveDate])
REFERENCES [dbo].[SalaryGradeMatrix] ([SalaryGrade], [EffectiveDate])
GO
ALTER TABLE [dbo].[SalaryGradeMatrix] CHECK CONSTRAINT [FK_SalaryGradeMatrix_SalaryScale]
GO
