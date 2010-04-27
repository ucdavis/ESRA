USE [ESRA]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeChanges_ChangeType]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeChanges]'))
ALTER TABLE [dbo].[EmployeeChanges] DROP CONSTRAINT [FK_EmployeeChanges_ChangeType]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeChanges_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeChanges]'))
ALTER TABLE [dbo].[EmployeeChanges] DROP CONSTRAINT [FK_EmployeeChanges_Employee]
GO

USE [ESRA]
GO

/****** Object:  Table [dbo].[EmployeeChanges]    Script Date: 03/24/2010 11:29:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeChanges]') AND type in (N'U'))
DROP TABLE [dbo].[EmployeeChanges]
GO

USE [ESRA]
GO

/****** Object:  Table [dbo].[EmployeeChanges]    Script Date: 03/24/2010 11:29:40 ******/
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

ALTER TABLE [dbo].[EmployeeChanges]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChanges_ChangeType] FOREIGN KEY([ChangeTypeID])
REFERENCES [dbo].[ChangeType] ([ChangeTypeID])
GO

ALTER TABLE [dbo].[EmployeeChanges] CHECK CONSTRAINT [FK_EmployeeChanges_ChangeType]
GO

ALTER TABLE [dbo].[EmployeeChanges]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChanges_Employee] FOREIGN KEY([FkEmployee])
REFERENCES [dbo].[Employee] ([PkEmployee])
GO

ALTER TABLE [dbo].[EmployeeChanges] CHECK CONSTRAINT [FK_EmployeeChanges_Employee]
GO


