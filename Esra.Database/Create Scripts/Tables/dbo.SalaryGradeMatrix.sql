USE [ESRA]
GO

/****** Object:  Table [dbo].[SalaryGradeMatrix]    Script Date: 07/01/2009 13:41:46 ******/
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

ALTER TABLE [dbo].[SalaryGradeMatrix]  WITH CHECK ADD  CONSTRAINT [FK_SalaryGradeMatrix_SalaryScale] FOREIGN KEY([SalaryGrade], [EffectiveDate])
REFERENCES [dbo].[SalaryGradeMatrix] ([SalaryGrade], [EffectiveDate])
GO

ALTER TABLE [dbo].[SalaryGradeMatrix] CHECK CONSTRAINT [FK_SalaryGradeMatrix_SalaryScale]
GO


