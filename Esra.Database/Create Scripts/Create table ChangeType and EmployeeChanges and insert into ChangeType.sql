 USE [ESRA]
GO
/****** Object:  Table [dbo].[ChangeType]    Script Date: 07/07/2009 15:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChangeType] ON
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (101, N'CareerHireDate', N'HireDate', N'Adjusted University Career Hire Date.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (102, N'ApptHireDate', N'ApptDate', N'Adjusted Appointment Begin Date in Title.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (103, N'ExperienceBeginDate', N'ExperienceDate', N'Adjusted Experience Begin Date.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (104, N'DepartmentComments', N'DeptComments', N'Generic comments regarding employee entered by Employee''s department.')
INSERT [dbo].[ChangeType] ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (105, N'DeansOfficeComments', N'DeansComments', N'Generic comments regarding employee entered by Dean''s Office.')
SET IDENTITY_INSERT [dbo].[ChangeType] OFF
/****** Object:  Table [dbo].[EmployeeChanges]    Script Date: 07/07/2009 15:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_EmployeeChanges_ChangeType]    Script Date: 07/07/2009 15:50:48 ******/
ALTER TABLE [dbo].[EmployeeChanges]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChanges_ChangeType] FOREIGN KEY([ChangeTypeID])
REFERENCES [dbo].[ChangeType] ([ChangeTypeID])
GO
ALTER TABLE [dbo].[EmployeeChanges] CHECK CONSTRAINT [FK_EmployeeChanges_ChangeType]
GO
/****** Object:  ForeignKey [FK_EmployeeChanges_Employee]    Script Date: 07/07/2009 15:50:48 ******/
ALTER TABLE [dbo].[EmployeeChanges]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChanges_Employee] FOREIGN KEY([FkEmployee])
REFERENCES [dbo].[Employee] ([PkEmployee])
GO
ALTER TABLE [dbo].[EmployeeChanges] CHECK CONSTRAINT [FK_EmployeeChanges_Employee]
GO
