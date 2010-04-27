USE [ESRA]
GO

/****** Object:  Table [dbo].[SalaryScale]    Script Date: 07/01/2009 13:43:13 ******/
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


