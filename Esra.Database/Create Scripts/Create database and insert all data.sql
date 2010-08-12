USE [ESRA]
GO
/****** Object:  User [TestApp]    Script Date: 03/24/2010 11:33:49 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TestApp')
CREATE USER [TestApp] FOR LOGIN [AESDEAN\TestApp] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[SRAEmployee]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SRAEmployee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SRAEmployee](
	[PkSRAEmployee] [int] IDENTITY(136,1) NOT NULL,
	[PkEmployee] [char](13) NOT NULL,
	[EmployeeID] [char](9) NOT NULL,
	[TitleCode] [char](4) NOT NULL,
	[CareerHireDate] [datetime] NULL,
	[PPSCareerHireDateChecked] [bit] NULL,
	[ApptHireDate] [datetime] NULL,
	[PPSApptHireDateChecked] [bit] NULL,
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
	[AdminDepartmentID] [varchar](6) NULL,
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
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[SelectionType]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectionType]') AND type in (N'U'))
BEGIN
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
END
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
/****** Object:  Table [dbo].[PayRateType]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PayRateType]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PayRateType] ON
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (101, N'Annual', N'A', NULL)
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (102, N'Mounthly', N'M', NULL)
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (103, N'Hourly', N'H', NULL)
SET IDENTITY_INSERT [dbo].[PayRateType] OFF
/****** Object:  Table [dbo].[Employee]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[PkEmployee] [char](13) NOT NULL,
	[EmployeeID] [char](9) NOT NULL,
	[TitleCode] [char](4) NOT NULL,
	[CareerHireDate] [datetime] NULL,
	[PPSCareerHireDateChecked] [bit] NULL,
	[ApptHireDate] [datetime] NULL,
	[PPSApptHireDateChecked] [bit] NULL,
	[ExperienceBeginDate] [datetime] NULL,
	[DatesHaveBeenAdjusted] [bit] NULL,
	[DepartmentComments] [varchar](max) NULL,
	[DeansOfficeComments] [varchar](max) NULL,
	[YearsOfService] [decimal](5, 3) NULL,
	[TimeInTitle] [decimal](5, 3) NULL,
	[YearsOfExperience] [decimal](5, 3) NULL,
	[IsCAES] [bit] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[PkEmployee] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND name = N'Employee_EmployeeIDTitleCodeUDX')
CREATE UNIQUE NONCLUSTERED INDEX [Employee_EmployeeIDTitleCodeUDX] ON [dbo].[Employee] 
(
	[EmployeeID] ASC,
	[TitleCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND name = N'Employee_TimeInTitleIDX')
CREATE NONCLUSTERED INDEX [Employee_TimeInTitleIDX] ON [dbo].[Employee] 
(
	[TimeInTitle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND name = N'Employee_YearsOfExperienceIDX')
CREATE NONCLUSTERED INDEX [Employee_YearsOfExperienceIDX] ON [dbo].[Employee] 
(
	[YearsOfExperience] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND name = N'Employee_YearsOfServiceIDX')
CREATE NONCLUSTERED INDEX [Employee_YearsOfServiceIDX] ON [dbo].[Employee] 
(
	[YearsOfService] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChangeType]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChangeType](
	[ChangeTypeID] [int] IDENTITY(101,1) NOT NULL,
	[Type] [varchar](64) NULL,
	[ShortType] [varchar](20) NULL,
	[Description] [varchar](1028) NULL,
 CONSTRAINT [PK_ChangeType] PRIMARY KEY CLUSTERED 
(
	[ChangeTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChangeType] ON
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (101, N'AdjustedCareerHireDate', N'HireDate', N'Adjusted University Career Hire Date.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (102, N'AdjustedApptHireDate', N'ApptDate', N'Adjusted Appointment Begin Date in Title.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (103, N'ExperienceBeginDate', N'ExperienceDate', N'Adjusted Experience Begin Date.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (104, N'DepartmentComments', N'DeptComments', N'Generic comments regarding employee entered by Employee''s department.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (105, N'DeansOfficeComments', N'DeansComments', N'Generic comments regarding employee entered by Dean''s Office.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (106, N'PPSCareerHireDateChecked', N'HireDateChecked', N'True to signify that a user has checked the employee''s career hire date against PPS.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (107, N'PPSApptHireDateChecked', N'ApptDateChecked', N'True to signify that a user has checked the employee''s appt. hire date against PPS.')
SET IDENTITY_INSERT [dbo].[ChangeType] OFF
/****** Object:  Table [dbo].[ApptType]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApptType]') AND type in (N'U'))
BEGIN
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
END
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
/****** Object:  Table [dbo].[SalaryGradeMatrix]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalaryGradeMatrix]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SalaryGradeMatrix]') AND name = N'SalaryGradeMatrix_SalaryGradeEffectiveDate')
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
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (172, N'2   ', 1.0000, 2.0000, 3.0000, 4.0000, 5.0000, CAST(0x00009B7300000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (187, N'2   ', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, CAST(0x00009B7400000000 AS DateTime), NULL)
INSERT [dbo].[SalaryGradeMatrix] ([SalaryGradeMarixID], [SalaryGrade], [MinAnnual], [FirstQrtleAnnual], [MidAnnual], [ThirdQrtleAnnual], [MaxAnnual], [EffectiveDate], [SalaryScaleID]) VALUES (206, N'3   ', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, CAST(0x00009B8C00000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SalaryGradeMatrix] OFF
/****** Object:  Table [dbo].[QuartileType]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuartileType]') AND type in (N'U'))
BEGIN
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
END
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
/****** Object:  Table [dbo].[SalarySteps]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalarySteps]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SalarySteps](
	[PkSalaryStep] [int] IDENTITY(101,1) NOT NULL,
	[TitleCode] [char](4) NOT NULL,
	[Step] [char](5) NOT NULL,
	[Annual] [money] NOT NULL,
	[Monthly] [money] NOT NULL,
	[Hourly] [money] NOT NULL,
	[EffectiveDate] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SalarySteps]') AND name = N'SalarySteps_TitleCodeStepEffectiveDateUDX')
CREATE UNIQUE CLUSTERED INDEX [SalarySteps_TitleCodeStepEffectiveDateUDX] ON [dbo].[SalarySteps] 
(
	[TitleCode] ASC,
	[Step] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SalarySteps]') AND name = N'SalarySteps_TitleCodeAnnualIDX')
CREATE NONCLUSTERED INDEX [SalarySteps_TitleCodeAnnualIDX] ON [dbo].[SalarySteps] 
(
	[TitleCode] ASC,
	[Annual] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SalarySteps] ON
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (911, N'4001', N'1    ', 0.0000, 0.0000, 0.0000, CAST(0x00009B7300000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (914, N'4001', N'1    ', 0.0000, 0.0000, 0.0000, CAST(0x00009B7400000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (912, N'4001', N'2    ', 0.0000, 0.0000, 0.0000, CAST(0x00009B7300000000 AS DateTime))
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
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (113, N'4804', N'7.0  ', 55452.0000, 4621.0000, 26.5600, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (114, N'4804', N'7.5  ', 56784.0000, 4732.0000, 27.1900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (115, N'4804', N'8.0  ', 58116.0000, 4843.0000, 27.8300, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 100 total records'
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
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (235, N'7684', N'1.5  ', 38268.0000, 3189.0000, 18.3300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (236, N'7684', N'2.0  ', 39132.0000, 3261.0000, 18.7400, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (237, N'7684', N'2.5  ', 40080.0000, 3340.0000, 19.2000, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 200 total records'
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
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (307, N'9524', N'4.0  ', 38052.0000, 3171.0000, 18.2200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (308, N'9524', N'4.5  ', 38904.0000, 3242.0000, 18.6300, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (309, N'9524', N'5.0  ', 39708.0000, 3309.0000, 19.0200, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 300 total records'
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
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (415, N'9612', N'20.0 ', 55280.0000, 4607.0000, 26.4700, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (416, N'9612', N'21.0 ', 56376.0000, 4698.0000, 27.0000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (417, N'9612', N'22.0 ', 57522.0000, 4793.0000, 27.5500, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 400 total records'
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
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (509, N'9724', N'5.0  ', 37792.0000, 3149.0000, 18.1000, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (510, N'9724', N'6.0  ', 38676.0000, 3223.0000, 18.5200, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (511, N'9724', N'7.0  ', 39523.0000, 3294.0000, 18.9300, CAST(0x000099BA00000000 AS DateTime))
GO
print 'Processed 500 total records'
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (512, N'9724', N'8.0  ', 40482.0000, 3374.0000, 19.3900, CAST(0x000099BA00000000 AS DateTime))
INSERT [dbo].[SalarySteps] ([PkSalaryStep], [TitleCode], [Step], [Annual], [Monthly], [Hourly], [EffectiveDate]) VALUES (513, N'9724', N'9.0  ', 41416.0000, 3451.0000, 19.8400, CAST(0x000099BA00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SalarySteps] OFF
/****** Object:  Table [dbo].[SalaryScale]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalaryScale]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SalaryScale]') AND name = N'SalaryScale_TitleCodeEffectiveDateUDX')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (114, N'4353', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 54306.0000, 55830.4000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (115, N'4354', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 47775.2500, 47333.2400, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (116, N'4355', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (117, N'4356', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 64413.5000, 64413.5000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (118, N'4357', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (119, N'4358', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 67000.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (120, N'4359', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (121, N'4403', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (122, N'4404', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (123, N'4414', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (124, N'4415', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 59906.0000, N'3   ')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (135, N'4672', CAST(0x000099BA00000000 AS DateTime), N'CX', 17, 0.0000, 0.0000, 0.0000, 27042.0000, N'4672')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (136, N'4720', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (137, N'4721', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (138, N'4722', CAST(0x000099BA00000000 AS DateTime), N'CX', 17, 0.0000, 0.0000, 42761.6400, 42511.7800, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (139, N'4723', CAST(0x000099BA00000000 AS DateTime), N'CX', 17, 0.0000, 0.0000, 35982.2300, 36174.0600, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (140, N'4724', CAST(0x000099BA00000000 AS DateTime), N'CX', 17, 0.0000, 0.0000, 32700.0000, 32769.6000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (141, N'4725', CAST(0x000099BA00000000 AS DateTime), N'CX', 13, 0.0000, 0.0000, 46115.2000, 47696.6400, N'4725')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (142, N'4726', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 48124.0000, 46913.5000, N'4726')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (143, N'4727', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 40488.0000, 40488.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (144, N'4728', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (145, N'4761', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (146, N'4768', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (147, N'4802', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 53990.0000, 53990.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (148, N'4803', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (149, N'4804', CAST(0x000099BA00000000 AS DateTime), N'TX', 15, 0.0000, 0.0000, 46722.0000, 48412.9400, N'4804')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (150, N'4805', CAST(0x000099BA00000000 AS DateTime), N'TX', 15, 0.0000, 0.0000, 41646.0000, 39644.0000, N'4805')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (151, N'4811', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (152, N'4821', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (153, N'4826', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (154, N'5062', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 43044.0000, 43044.0000, N'5062')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (155, N'5068', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (156, N'5069', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (157, N'5070', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (158, N'5071', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 60684.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (159, N'5110', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (160, N'5111', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (161, N'5112', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (162, N'5119', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 33178.0000, N'C   ')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (185, N'6102', CAST(0x000099BA00000000 AS DateTime), N'TX', 20, 0.0000, 0.0000, 48444.0000, 47958.0000, N'6102')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (186, N'6108', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 58727.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (187, N'6109', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (188, N'6110', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (189, N'6112', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 37368.0000, 37818.0000, N'6112')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (190, N'6113', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 0.0000, 0.0000, N'6113')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (191, N'6191', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (192, N'6192', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (193, N'6193', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (194, N'6211', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 71778.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (195, N'6212', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 55433.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (196, N'6213', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 50744.5000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (197, N'6214', CAST(0x00009B2A00000000 AS DateTime), N'TX', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6214')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (198, N'6215', CAST(0x00009B2A00000000 AS DateTime), N'TX', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6215')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (217, N'6452', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 60030.5000, 50585.2100, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (218, N'6453', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 43860.9300, 39679.5300, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (219, N'6454', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 36136.0000, 34630.4000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (220, N'6757', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 49489.0000, 49489.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (221, N'6758', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 53724.0000, N'2   ')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (242, N'6974', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 62420.0000, N'4   ')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (255, N'7133', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 61607.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (256, N'7134', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 52139.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (257, N'7135', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 76406.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (258, N'7136', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 76330.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (259, N'7137', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (260, N'7151', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (261, N'7152', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (262, N'7153', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 78828.0000, 78828.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (263, N'7154', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (264, N'7156', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (265, N'7157', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (266, N'7171', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 42936.0000, 44460.0000, N'7171')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (267, N'7172', CAST(0x000099BA00000000 AS DateTime), N'99', 9, 0.0000, 0.0000, 0.0000, 42156.0000, N'7172')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (268, N'7181', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (269, N'7182', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 69827.8000, 71580.8300, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (270, N'7183', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 58556.0000, 58556.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (271, N'7185', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (272, N'7186', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (273, N'7187', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 65782.0000, 64475.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (274, N'7188', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (275, N'7195', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (276, N'7208', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (277, N'7209', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (278, N'7211', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (279, N'7212', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 72334.0000, 72334.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (280, N'7213', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (281, N'7214', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (282, N'7231', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (283, N'7234', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 47267.5000, 48021.4500, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (284, N'7235', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 55590.0000, 55171.1900, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (285, N'7236', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 58919.3300, 57878.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (286, N'7237', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 71327.5000, 70110.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (287, N'7238', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 80816.0000, 72209.2000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (288, N'7239', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 87322.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (289, N'7245', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 59014.0000, 59014.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (290, N'7246', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 61243.0000, 57562.6000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (291, N'7247', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 57243.0000, 58638.7500, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (292, N'7248', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 68901.0000, 68613.3300, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (293, N'7249', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 77041.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (294, N'7250', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 88812.0000, 86508.2500, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (295, N'7273', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (296, N'7280', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (297, N'7281', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 43797.2900, 43797.2900, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (298, N'7282', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 85845.0000, 87027.5000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (299, N'7284', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 50842.3800, 49427.2700, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (300, N'7285', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 59445.3300, 59295.4600, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (301, N'7286', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 66884.6700, 64715.7600, N'4   ')
GO
print 'Processed 200 total records'
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (302, N'7287', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 73159.4400, 72516.2100, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (303, N'7288', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 81453.0000, 80786.6700, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (304, N'7289', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 95643.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (305, N'7290', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (306, N'7291', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (307, N'7292', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 62488.0000, 62488.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (308, N'7293', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 68500.5000, 68500.5000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (309, N'7294', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 80723.7500, 80723.7500, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (310, N'7295', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 89863.0000, 82071.5000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (311, N'7296', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (312, N'7510', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 74660.4300, 76046.4400, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (313, N'7511', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 78907.6000, 74534.7800, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (314, N'7512', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 62151.5000, 58953.5700, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (315, N'7538', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 76223.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (316, N'7539', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (317, N'7540', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 88950.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (318, N'7541', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 73156.0000, 71783.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (319, N'7572', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (320, N'7573', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (321, N'7611', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (322, N'7612', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (323, N'7614', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (324, N'7616', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (325, N'7617', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (326, N'7618', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (327, N'7619', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (328, N'7620', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 61119.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (329, N'7621', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (330, N'7622', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (331, N'7623', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (332, N'7624', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (333, N'7625', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (334, N'7631', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (335, N'7632', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (336, N'7633', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (337, N'7634', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 49657.3300, 51529.2200, N'2   ')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (351, N'7671', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 68566.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (352, N'7672', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 56004.0000, 56004.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (353, N'7675', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (354, N'7676', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (355, N'7678', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 81504.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (356, N'7679', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (357, N'7680', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 68348.0000, 68348.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (358, N'7681', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (359, N'7682', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 76845.0000, 70716.2500, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (360, N'7683', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 50068.0000, 52776.6000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (361, N'7684', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 41034.0000, 41034.0000, N'7684')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (362, N'7686', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (363, N'7693', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (364, N'7694', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (365, N'7695', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (366, N'7696', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (367, N'7698', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 51730.0000, 51203.2500, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (368, N'7702', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (369, N'7703', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 55420.0000, 51792.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (370, N'7704', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 43128.0000, 43128.0000, N'7704')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (398, N'8115', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 86483.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (399, N'8116', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 64356.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (400, N'8118', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 70673.0000, 67502.4300, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (401, N'8119', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 51079.6200, 51127.5000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (402, N'8130', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
GO
print 'Processed 300 total records'
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (403, N'8131', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (404, N'8146', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (405, N'8148', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 47712.0000, 44556.0000, N'8148')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (406, N'8150', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (407, N'8151', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (408, N'8156', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 41500.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (409, N'8170', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 65820.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (410, N'8172', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 60029.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (411, N'8174', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 48029.1700, N'2   ')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (432, N'8522', CAST(0x000099BA00000000 AS DateTime), N'SX', 5, 0.0000, 0.0000, 53112.0000, 54297.6000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (433, N'8523', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 50832.0000, 51026.4000, N'8523')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (434, N'8540', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 43300.3600, 42889.0900, N'8540')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (435, N'8541', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 40956.2700, 37802.5200, N'8541')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (436, N'8542', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 30213.0000, 30120.2700, N'8542')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (437, N'8543', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 28134.0000, 27337.7100, N'8543')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (438, N'8545', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 41875.0000, 41875.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (439, N'8546', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (440, N'8639', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (441, N'8649', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 67006.0000, 67006.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (442, N'8650', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (443, N'8651', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 57146.3300, 57146.3300, N'8651')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (444, N'8653', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 47112.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (445, N'8667', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (446, N'8668', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (447, N'8669', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (448, N'8670', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (449, N'8680', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (450, N'8885', CAST(0x0000929800000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 52525.0000, 52525.0000, N'8885')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (451, N'8915', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (452, N'8936', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (453, N'8937', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'8   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (454, N'8953', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (455, N'8961', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (456, N'8969', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (457, N'8970', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (458, N'8971', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (459, N'8972', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (460, N'8993', CAST(0x0000940500000000 AS DateTime), N'EX', 0, 0.0000, 0.0000, 38837.0000, 38837.0000, N'8993')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (486, N'9139', CAST(0x00009A7100000000 AS DateTime), N'NX', 15, 0.0000, 0.0000, 0.0000, 0.0000, N'9139')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (497, N'9252', CAST(0x0000940500000000 AS DateTime), N'EX', 0, 0.0000, 0.0000, 38712.0000, 38712.0000, N'9252')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (512, N'9323', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (513, N'9324', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 38083.2500, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (514, N'9325', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 42722.6000, 32965.0700, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (515, N'9326', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'B   ')
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
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (535, N'9520', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 75180.0000, 75180.0000, N'9520')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (536, N'9521', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 68648.6700, 68648.6700, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (537, N'9522', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 54912.5000, 54246.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (538, N'9523', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 40236.0000, 40236.0000, N'E   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (539, N'9524', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 35804.0000, 35804.0000, N'9524')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (540, N'9525', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 31926.0000, 31926.0000, N'9525')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (541, N'9526', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'9526')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (542, N'9527', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (543, N'9528', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (544, N'9529', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (545, N'9532', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'7   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (546, N'9533', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (547, N'9538', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (548, N'9539', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (549, N'9540', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'D   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (550, N'9561', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 37880.0000, 37880.0000, N'9561')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (551, N'9562', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 32520.0000, 32010.0000, N'9562')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (552, N'9600', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 48744.0000, N'1   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (553, N'9602', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 36241.2000, 36219.8200, N'9602')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (554, N'9603', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 30663.2700, 30320.7300, N'9603')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (555, N'9604', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'C   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (556, N'9605', CAST(0x000099BA00000000 AS DateTime), N'TX', 9, 0.0000, 0.0000, 26927.2000, 27196.8000, N'9605')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (557, N'9606', CAST(0x000099BA00000000 AS DateTime), N'SX', 0, 0.0000, 0.0000, 26312.0000, 26693.3300, N'9606')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (558, N'9609', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 81093.5000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (559, N'9610', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 60892.1100, 60940.1700, N'9610')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (560, N'9611', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 52316.1200, 51492.4300, N'9611')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (561, N'9612', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 43484.3100, 41931.3800, N'9612')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (562, N'9613', CAST(0x000099BA00000000 AS DateTime), N'RX', 9, 0.0000, 0.0000, 37583.2700, 37157.5600, N'9613')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (563, N'9614', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 71208.8800, 69905.9100, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (564, N'9615', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 62484.1100, 60684.8000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (565, N'9616', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 55131.8800, 55131.8800, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (566, N'9617', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 44208.1600, 44019.2900, N'9617')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (567, N'9720', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (568, N'9721', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 72921.5000, 72921.5000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (569, N'9722', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 65424.0000, 65424.0000, N'9722')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (570, N'9723', CAST(0x000099BA00000000 AS DateTime), N'RX', 25, 0.0000, 0.0000, 43248.0000, 41919.0000, N'9723')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (571, N'9724', CAST(0x000099BA00000000 AS DateTime), N'RX', 9, 0.0000, 0.0000, 41412.0000, 41412.0000, N'9724')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (572, N'9726', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'4   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (573, N'9802', CAST(0x000099BA00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'6   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (574, N'7287', CAST(0x0000984D00000000 AS DateTime), N'99', 0, 0.0000, 0.0000, 73159.4400, 72516.2100, N'5   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (656, N'4001', CAST(0x00009B6E00000000 AS DateTime), N'89', 0, 0.0000, 0.0000, 0.0000, 0.0000, N'3   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (655, N'4672', CAST(0x00009B5A00000000 AS DateTime), N'CX', 1, 0.0000, 0.0000, 0.0000, 27042.0000, N'4672')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (657, N'4001', CAST(0x00009B7300000000 AS DateTime), N'99', 2, 199.0000, 0.0000, 0.0000, 0.0000, N'2   ')
INSERT [dbo].[SalaryScale] ([SalaryScaleID], [TitleCode], [EffectiveDate], [BargainingCode], [NumSalarySteps], [LaborMarketWAS], [LaborMarketMidAnnual], [CollegeAvgAnnual], [CampusAvgAnnual], [SalaryGrade]) VALUES (666, N'4001', CAST(0x00009B7400000000 AS DateTime), N'99', 1, 0.0000, 0.0000, 0.0000, 0.0000, N'2   ')
SET IDENTITY_INSERT [dbo].[SalaryScale] OFF
/****** Object:  View [dbo].[APTDIS_V2]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[APTDIS_V2]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[APTDIS_V2]
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
                      PayEnd > GETDATE()) AND (DOSCode = ''REG'') AND (PayRate IN
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
                                                   PayEnd > GETDATE()) AND (DOSCode = ''REG'') AND (EmployeeID = PPSDataMart.dbo.APTDIS_V.EmployeeID))) AND (TypeCode IN (''2'', ''7'')) AND 
                      (PayRate > 0)
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'APTDIS_V2', NULL,NULL))
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'APTDIS_V2', NULL,NULL))
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'APTDIS_V2', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'APTDIS_V2'
GO
/****** Object:  Table [dbo].[SalaryReviewAnalysis]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalaryReviewAnalysis]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[AllDepartments]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllDepartments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[AllDepartments]
AS
SELECT     TOP (100) PERCENT HomeDeptNo AS DepartmentNumber, Name, Abbreviation AS ShortName, SchoolCode
FROM         PPSDataMart.dbo.Departments AS Departments_1
ORDER BY DepartmentNumber
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'AllDepartments', NULL,NULL))
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
            TopColumn = 3
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
         Filter = 10620
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllDepartments'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'AllDepartments', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllDepartments'
GO
/****** Object:  View [dbo].[Catbert3_vRoles]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Catbert3_vRoles]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Catbert3_vRoles]
AS
SELECT     TOP (100) PERCENT roles.RoleID, roles.Role
FROM         Catbert3.dbo.Applications AS applications INNER JOIN
                      Catbert3.dbo.ApplicationRoles AS applicationRoles ON applications.ApplicationID = applicationRoles.ApplicationID INNER JOIN
                      Catbert3.dbo.Roles AS roles ON applicationRoles.RoleID = roles.RoleID
WHERE     (applications.Abbr = ''ESRA'') AND (roles.Inactive = 0)
ORDER BY roles.Role
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vRoles', NULL,NULL))
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
         Begin Table = "applications"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "roles"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 108
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "applicationRoles"
            Begin Extent = 
               Top = 6
               Left = 444
               Bottom = 123
               Right = 617
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vRoles'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vRoles', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vRoles'
GO
/****** Object:  View [dbo].[Catbert3_vLogin]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Catbert3_vLogin]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Catbert3_vLogin]
AS
SELECT     LoginID, UserID
FROM         Catbert3.dbo.Users
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vLogin', NULL,NULL))
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
         Begin Table = "Users (Catbert3.dbo)"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vLogin'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vLogin', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vLogin'
GO
/****** Object:  View [dbo].[UCDEmployee]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[UCDEmployee]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[UCDEmployee]
AS
SELECT DISTINCT 
                         TOP (100) PERCENT APTDIS_V.EmployeeID + APTDIS_V.TitleCode AS PkEmployee, APTDIS_V.EmployeeID, APTDIS_V.AdministrativeDepartment AS AdminDept, 
                         APTDIS_V.HomeDepartment AS HomeDept, APTDIS_V.WorkDepartment AS WorkDept, 
                         CASE APTDIS_V.HOMEDEPARTMENT WHEN APTDIS_V.WORKDEPARTMENT THEN '''' ELSE 1 END AS Different, APTDIS_V.FullName AS EmpName, 
                         Persons.FirstName, Persons.MiddleName, Persons.LastName, APTDIS_V.TitleCode AS TC, CONVERT(varchar(10), APTDIS_V.HireDate, 101) AS HireDate, 
                         CONVERT(varchar(10), APTDIS_V.ApptBeginDate, 101) AS BeginDate, 
                         CASE APTDIS_V.RATECODE WHEN ''H'' THEN APTDIS_V.PAYRATE * 2080 WHEN ''B'' THEN APTDIS_V.PAYRATE * 12 ELSE APTDIS_V.PAYRATE END AS PayRate, 
                         APTDIS_V.TypeCode AS ApptType, APTDIS_V.Grade AS SalaryGrade, APTDIS_V.TitleUnitCode AS BargainingUnit, APTDIS_V.Step AS SalaryStep
FROM            PPSDataMart.dbo.APTDIS_V AS APTDIS_V INNER JOIN
                         PPSDataMart.dbo.Persons AS Persons ON APTDIS_V.EmployeeID = Persons.EmployeeID
WHERE        (APTDIS_V.PayRate IN
                             (SELECT        MAX(PayRate) AS Expr1
                               FROM            PPSDataMart.dbo.APTDIS_V AS adv
                               WHERE        (APTDIS_V.EmployeeID = EmployeeID) AND (ApptEndDate IS NULL OR
                                                         ApptEndDate > GETDATE()) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                         PayEnd > GETDATE()) AND (DOSCode = ''REG'') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN (''2'', ''7'')))) AND 
                         (APTDIS_V.DistNo IN
                             (SELECT        TOP (1) DistNo
                               FROM            PPSDataMart.dbo.APTDIS_V AS APTDIS_V_1
                               WHERE        (ApptEndDate IS NULL OR
                                                         ApptEndDate > GETDATE()) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                         PayEnd > GETDATE()) AND (DOSCode = ''REG'') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN (''2'', ''7'')))) AND 
                         (APTDIS_V.ApptBeginDate IN
                             (SELECT        MAX(ApptBeginDate) AS Expr1
                               FROM            PPSDataMart.dbo.APTDIS_V AS APTDIS_V_2
                               WHERE        (PayRate > 0) AND (ApptBeginDate <= GETDATE()) AND (ApptEndDate IS NULL OR
                                                         ApptEndDate > GETDATE()) AND (EmployeeID = APTDIS_V.EmployeeID) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                         PayEnd > GETDATE()) AND (DOSCode = ''REG'') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN (''2'', ''7''))))
ORDER BY PkEmployee
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'UCDEmployee', NULL,NULL))
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
      Begin ColumnWidths = 19
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1290
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'UCDEmployee', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UCDEmployee'
GO
/****** Object:  View [dbo].[Departments]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Departments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Departments]
AS
SELECT        TOP (100) PERCENT HomeDeptNo AS DepartmentNumber, Name, Abbreviation AS ShortName, SchoolCode
FROM            PPSDataMart.dbo.Departments AS Departments_1
WHERE        (HomeDeptNo IN
                             (SELECT DISTINCT HomeDeptNo
                               FROM            PPSDataMart.dbo.Departments AS Departments_2
                               WHERE        (HomeDeptNo LIKE ''030%'' or HomeDeptNo in (''065040'', ''065025'') AND HomeDeptNo not IN (''036000'',''036005''))))
ORDER BY Name, ShortName
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Departments', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[8] 2[8] 3) )"
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
               Top = 13
               Left = 14
               Bottom = 130
               Right = 192
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
         Width = 1830
         Width = 2910
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
         Filter = 8865
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Departments'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Departments', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Departments'
GO
/****** Object:  Table [dbo].[EmployeeChanges]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeChanges]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeChanges](
	[EmployeeChangesID] [int] IDENTITY(101,1) NOT NULL,
	[FkEmployee] [char](13) NOT NULL,
	[TitleCode] [char](4) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateChanged] [datetime] NOT NULL,
	[ChangeTypeID] [int] NOT NULL,
	[Comments] [varchar](255) NULL,
 CONSTRAINT [PK_EmployeeChanges] PRIMARY KEY CLUSTERED 
(
	[EmployeeChangesID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeChanges] ON
/****** Object:  View [dbo].[Title.GtEq4001]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Title.GtEq4001]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Title.GtEq4001]
AS
SELECT DISTINCT TOP (100) PERCENT t1.TitleCode, t1.Name AS PayrollTitle, t1.AbbreviatedName, t2.SalaryGrade, t1.UnitCode AS BargainingCode
FROM         PPSDataMart.dbo.Titles AS t1 LEFT OUTER JOIN
                      dbo.SalaryScale AS t2 ON t1.TitleCode = t2.TitleCode
WHERE     (t1.TitleCode >= ''4001'')
ORDER BY t1.TitleCode
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Title.GtEq4001', NULL,NULL))
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
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 6
               Left = 284
               Bottom = 123
               Right = 482
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Title.GtEq4001'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Title.GtEq4001', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Title.GtEq4001'
GO
/****** Object:  View [dbo].[Title.bak]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Title.bak]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Title.bak]
AS
SELECT DISTINCT TOP (100) PERCENT t1.TitleCode, t1.Name AS PayrollTitle, t1.AbbreviatedName, t2.SalaryGrade, t1.UnitCode AS BargainingCode
FROM         PPSDataMart.dbo.Titles AS t1 LEFT OUTER JOIN
                      dbo.SalaryScale AS t2 ON t1.TitleCode = t2.TitleCode
ORDER BY t1.TitleCode
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Title.bak', NULL,NULL))
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
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 6
               Left = 284
               Bottom = 123
               Right = 482
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Title.bak'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Title.bak', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Title.bak'
GO
/****** Object:  View [dbo].[Title]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Title]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Title]
AS
SELECT DISTINCT TOP (100) PERCENT TitleCode, Name AS PayrollTitle, AbbreviatedName, TitleGroup
FROM         PPSDataMart.dbo.Titles AS t1
ORDER BY TitleCode
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Title', NULL,NULL))
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
            TopColumn = 5
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Title', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Title'
GO
/****** Object:  View [dbo].[vUserUnit]    Script Date: 03/24/2010 11:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUserUnit]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vUserUnit]
AS
SELECT     Catbert.dbo.UserUnit.UnitID, Catbert.dbo.UserUnit.UserID, Catbert.dbo.Unit.FIS_Code
FROM         Catbert.dbo.UserUnit INNER JOIN
                      Catbert.dbo.Unit ON Catbert.dbo.UserUnit.UnitID = Catbert.dbo.Unit.UnitID
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vUserUnit', NULL,NULL))
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vUserUnit', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserUnit'
GO
/****** Object:  View [dbo].[vUsers]    Script Date: 03/24/2010 11:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUsers]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vUsers]
AS
SELECT     UserID, FirstName, LastName, EmployeeID, StudentID, UserImage, SID, Inactive, UserKey
FROM         Catbert.dbo.Users
WHERE     (Inactive = 0)
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vUsers', NULL,NULL))
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vUsers', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
/****** Object:  View [dbo].[vUnit]    Script Date: 03/24/2010 11:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUnit]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vUnit]
AS
SELECT     UnitID, FullName, ShortName, PPS_Code, FIS_Code, SchoolCode
FROM         Catbert.dbo.Unit
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vUnit', NULL,NULL))
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
         Begin Table = "Unit (Catbert.dbo)"
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vUnit', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUnit'
GO
/****** Object:  View [dbo].[vLogin]    Script Date: 03/24/2010 11:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLogin]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vLogin]
AS
SELECT     LoginID, UserID
FROM         Catbert.dbo.Login
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vLogin', NULL,NULL))
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vLogin', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLogin'
GO
/****** Object:  StoredProcedure [dbo].[usp_getUnitsInAppByLoginID]    Script Date: 03/24/2010 11:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getUnitsInAppByLoginID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Procedure [dbo].[usp_getUnitsInAppByLoginID]
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getRolesInAppByLoginID]    Script Date: 03/24/2010 11:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getRolesInAppByLoginID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Procedure [dbo].[usp_getRolesInAppByLoginID]
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
' 
END
GO
/****** Object:  Table [dbo].[Scenario]    Script Date: 03/24/2010 11:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Scenario]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CollegeAverages]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CollegeAverages]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[CollegeAverages]
AS
SELECT        TC, ROUND(AVG(PayRate), 2) AS round_avg
FROM            dbo.UCDEmployee
WHERE        (PkEmployee IN
                             (SELECT        PkEmployee
                               FROM            dbo.UCDEmployee AS UCDEmployee_1
                               WHERE        (HomeDept LIKE ''03%'') OR
                                                         (HomeDept IN (''065040'', ''065025'')) AND (HomeDept NOT IN (''036000'', ''036005'')) OR
                                                         (WorkDept IS NOT NULL) AND (WorkDept LIKE ''03%'' OR
                                                         WorkDept IN (''065040'', ''065025'') AND WorkDept NOT IN (''036000'', ''036005''))))
GROUP BY TC
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'CollegeAverages', NULL,NULL))
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
         Begin Table = "UCDEmployee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 224
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CollegeAverages'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'CollegeAverages', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CollegeAverages'
GO
/****** Object:  View [dbo].[Catbert3_vUserUnit]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Catbert3_vUserUnit]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Catbert3_vUserUnit]
AS
SELECT     TOP (100) PERCENT unitAssociations.UnitID, unitAssociations.UserID
FROM         Catbert3.dbo.UnitAssociations AS unitAssociations INNER JOIN
                      Catbert3.dbo.Applications AS applications ON unitAssociations.ApplicationID = applications.ApplicationID
WHERE     (applications.Abbr = ''Esra'') AND (unitAssociations.Inactive = 0)
ORDER BY unitAssociations.UserID, unitAssociations.UnitID
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUserUnit', NULL,NULL))
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
         Begin Table = "unitAssociations"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "applications"
            Begin Extent = 
               Top = 6
               Left = 632
               Bottom = 123
               Right = 802
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
      Begin ColumnWidths = 14
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUserUnit'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUserUnit', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUserUnit'
GO
/****** Object:  View [dbo].[Catbert3_vUsers]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Catbert3_vUsers]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Catbert3_vUsers]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT users.UserID, users.LoginID, users.FirstName, users.LastName, users.EmployeeID, users.StudentID, users.UserImage, users.SID, 
                      users.UserKey, users.Email, users.Phone
FROM         Catbert3.dbo.Users AS users INNER JOIN
                      Catbert3.dbo.Permissions AS permissions ON users.UserID = permissions.UserID INNER JOIN
                      Catbert3.dbo.Applications AS applications ON permissions.ApplicationID = applications.ApplicationID
WHERE     (applications.Abbr = ''ESRA'') AND (users.Inactive = 0)
ORDER BY users.LastName
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUsers', NULL,NULL))
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
         Begin Table = "users"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "permissions"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "applications"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 123
               Right = 604
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
      Begin ColumnWidths = 13
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUsers'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUsers', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUsers'
GO
/****** Object:  View [dbo].[Catbert3_vUserRoles]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Catbert3_vUserRoles]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Catbert3_vUserRoles]
AS
SELECT     TOP (100) PERCENT permissions.UserID, permissions.RoleID
FROM         Catbert3.dbo.Permissions AS permissions INNER JOIN
                      Catbert3.dbo.Applications AS applications ON permissions.ApplicationID = applications.ApplicationID
WHERE     (applications.Abbr = ''ESRA'') AND (permissions.Inactive = 0)
ORDER BY permissions.UserID, permissions.RoleID
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUserRoles', NULL,NULL))
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
         Begin Table = "permissions"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "applications"
            Begin Extent = 
               Top = 6
               Left = 632
               Bottom = 123
               Right = 802
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
      Begin ColumnWidths = 14
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUserRoles'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUserRoles', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUserRoles'
GO
/****** Object:  View [dbo].[Catbert3_vUnit]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Catbert3_vUnit]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Catbert3_vUnit]
AS
SELECT DISTINCT TOP (100) PERCENT unit.UnitID, unit.FullName, unit.ShortName, unit.PPS_Code, unit.FIS_Code, unit.SchoolCode
FROM         Catbert3.dbo.UnitAssociations AS unitAssociations INNER JOIN
                      Catbert3.dbo.Applications AS applications ON unitAssociations.ApplicationID = applications.ApplicationID INNER JOIN
                      Catbert3.dbo.Unit AS unit ON unitAssociations.UnitID = unit.UnitID
WHERE     (applications.Abbr = ''Esra'') AND (unitAssociations.Inactive = 0)
ORDER BY unit.FullName
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUnit', NULL,NULL))
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
         Begin Table = "unitAssociations"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "applications"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 123
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "unit"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 123
               Right = 617
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
      Begin ColumnWidths = 20
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
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUnit'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUnit', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUnit'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Catbert3_vUnit', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Catbert3_vUnit'
GO
/****** Object:  View [dbo].[CampusAverages]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CampusAverages]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[CampusAverages]
AS
SELECT        TC, ROUND(AVG(PayRate), 2) AS round_avg
FROM            dbo.UCDEmployee
WHERE        (PkEmployee IN
                             (SELECT        PkEmployee
                               FROM            dbo.UCDEmployee AS UCDEmployee_1))
GROUP BY TC
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'CampusAverages', NULL,NULL))
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
         Begin Table = "UCDEmployee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 224
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CampusAverages'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'CampusAverages', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CampusAverages'
GO
/****** Object:  View [dbo].[CAES_Title]    Script Date: 03/24/2010 11:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CAES_Title]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[CAES_Title]
AS
SELECT DISTINCT TOP (100) PERCENT t1.TitleCode, t1.Name AS PayrollTitle, t1.AbbreviatedName, t2.SalaryGrade, t1.UnitCode AS BargainingCode
FROM         PPSDataMart.dbo.Titles AS t1 LEFT OUTER JOIN
                      dbo.SalaryScale AS t2 ON t1.TitleCode = t2.TitleCode
WHERE     (t1.TitleCode IN
                          (SELECT DISTINCT TC
                            FROM          dbo.UCDEmployee
                            WHERE      (HomeDept LIKE ''030%'')))
ORDER BY t1.TitleCode
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'CAES_Title', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
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
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 6
               Left = 284
               Bottom = 123
               Right = 482
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CAES_Title'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'CAES_Title', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CAES_Title'
GO
/****** Object:  Default [DF_SalaryReviewAnalysis_IsReclass]    Script Date: 03/24/2010 11:33:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_SalaryReviewAnalysis_IsReclass]') AND parent_object_id = OBJECT_ID(N'[dbo].[SalaryReviewAnalysis]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SalaryReviewAnalysis_IsReclass]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SalaryReviewAnalysis] ADD  CONSTRAINT [DF_SalaryReviewAnalysis_IsReclass]  DEFAULT ((0)) FOR [IsReclass]
END


End
GO
/****** Object:  ForeignKey [FK_EmployeeChanges_ChangeType]    Script Date: 03/24/2010 11:33:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeChanges_ChangeType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeChanges]'))
ALTER TABLE [dbo].[EmployeeChanges]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChanges_ChangeType] FOREIGN KEY([ChangeTypeID])
REFERENCES [dbo].[ChangeType] ([ChangeTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeChanges_ChangeType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeChanges]'))
ALTER TABLE [dbo].[EmployeeChanges] CHECK CONSTRAINT [FK_EmployeeChanges_ChangeType]
GO
/****** Object:  ForeignKey [FK_EmployeeChanges_Employee]    Script Date: 03/24/2010 11:33:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeChanges_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeChanges]'))
ALTER TABLE [dbo].[EmployeeChanges]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChanges_Employee] FOREIGN KEY([FkEmployee])
REFERENCES [dbo].[Employee] ([PkEmployee])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeChanges_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeChanges]'))
ALTER TABLE [dbo].[EmployeeChanges] CHECK CONSTRAINT [FK_EmployeeChanges_Employee]
GO
/****** Object:  ForeignKey [FK_SalaryGradeMatrix_SalaryScale]    Script Date: 03/24/2010 11:33:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalaryGradeMatrix_SalaryScale]') AND parent_object_id = OBJECT_ID(N'[dbo].[SalaryGradeMatrix]'))
ALTER TABLE [dbo].[SalaryGradeMatrix]  WITH CHECK ADD  CONSTRAINT [FK_SalaryGradeMatrix_SalaryScale] FOREIGN KEY([SalaryGrade], [EffectiveDate])
REFERENCES [dbo].[SalaryGradeMatrix] ([SalaryGrade], [EffectiveDate])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalaryGradeMatrix_SalaryScale]') AND parent_object_id = OBJECT_ID(N'[dbo].[SalaryGradeMatrix]'))
ALTER TABLE [dbo].[SalaryGradeMatrix] CHECK CONSTRAINT [FK_SalaryGradeMatrix_SalaryScale]
GO
/****** Object:  ForeignKey [FK_SalaryReviewAnalysis_SalaryScale]    Script Date: 03/24/2010 11:33:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalaryReviewAnalysis_SalaryScale]') AND parent_object_id = OBJECT_ID(N'[dbo].[SalaryReviewAnalysis]'))
ALTER TABLE [dbo].[SalaryReviewAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_SalaryReviewAnalysis_SalaryScale] FOREIGN KEY([TitleCode], [EffectiveDate])
REFERENCES [dbo].[SalaryScale] ([TitleCode], [EffectiveDate])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalaryReviewAnalysis_SalaryScale]') AND parent_object_id = OBJECT_ID(N'[dbo].[SalaryReviewAnalysis]'))
ALTER TABLE [dbo].[SalaryReviewAnalysis] CHECK CONSTRAINT [FK_SalaryReviewAnalysis_SalaryScale]
GO
/****** Object:  ForeignKey [FK_Scenario_SalaryReviewAnalysis]    Script Date: 03/24/2010 11:33:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scenario_SalaryReviewAnalysis]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scenario]'))
ALTER TABLE [dbo].[Scenario]  WITH CHECK ADD  CONSTRAINT [FK_Scenario_SalaryReviewAnalysis] FOREIGN KEY([SalaryReviewAnalysisID])
REFERENCES [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Scenario_SalaryReviewAnalysis]') AND parent_object_id = OBJECT_ID(N'[dbo].[Scenario]'))
ALTER TABLE [dbo].[Scenario] CHECK CONSTRAINT [FK_Scenario_SalaryReviewAnalysis]
GO
