USE [ESRA]
GO

/****** Object:  Table [dbo].[Scenario]    Script Date: 07/01/2009 13:44:14 ******/
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

ALTER TABLE [dbo].[Scenario]  WITH CHECK ADD  CONSTRAINT [FK_Scenario_SalaryReviewAnalysis] FOREIGN KEY([SalaryReviewAnalysisID])
REFERENCES [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID])
GO

ALTER TABLE [dbo].[Scenario] CHECK CONSTRAINT [FK_Scenario_SalaryReviewAnalysis]
GO


