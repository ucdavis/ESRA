USE [ESRA]
GO

/****** Object:  Table [dbo].[SalaryReviewAnalysis]    Script Date: 07/01/2009 13:42:43 ******/
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

ALTER TABLE [dbo].[SalaryReviewAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_SalaryReviewAnalysis_SalaryScale] FOREIGN KEY([TitleCode], [EffectiveDate])
REFERENCES [dbo].[SalaryScale] ([TitleCode], [EffectiveDate])
GO

ALTER TABLE [dbo].[SalaryReviewAnalysis] CHECK CONSTRAINT [FK_SalaryReviewAnalysis_SalaryScale]
GO

ALTER TABLE [dbo].[SalaryReviewAnalysis] ADD  CONSTRAINT [DF_SalaryReviewAnalysis_IsReclass]  DEFAULT ((0)) FOR [IsReclass]
GO


