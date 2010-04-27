USE [ESRA]
GO

/****** Object:  Table [dbo].[SalarySteps]    Script Date: 07/01/2009 13:43:41 ******/
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


