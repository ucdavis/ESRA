CREATE TABLE [dbo].[SalaryReviewAnalysis] (
    [SalaryReviewAnalysisID]  INT           IDENTITY (101, 1) NOT NULL,
    [ReferenceNumber]         VARCHAR (50)  NULL,
    [DateInitiated]           DATETIME      NOT NULL,
    [DateApproved]            DATETIME      NULL,
    [DepartmentComments]      VARCHAR (MAX) NULL,
    [DeansOfficeComments]     VARCHAR (MAX) NULL,
    [InitiatedByReviewerName] VARCHAR (64)  NOT NULL,
    [DepartmentNumber]        CHAR (6)      NULL,
    [ApprovedScenarioID]      INT           NULL,
    [TitleCode]               CHAR (4)      NOT NULL,
    [EffectiveDate]           DATETIME      NULL,
    [IsReclass]               BIT           CONSTRAINT [DF_SalaryReviewAnalysis_IsReclass] DEFAULT ((0)) NOT NULL,
    [CurrentTitleCode]        CHAR (4)      NULL,
    [PkSRAEmployee]           INT           NULL,
    CONSTRAINT [PkSalaryReviewAnalysis] PRIMARY KEY CLUSTERED ([SalaryReviewAnalysisID] ASC),
    CONSTRAINT [FK_SalaryReviewAnalysis_SalaryScale] FOREIGN KEY ([TitleCode], [EffectiveDate]) REFERENCES [dbo].[SalaryScale] ([TitleCode], [EffectiveDate])
);

