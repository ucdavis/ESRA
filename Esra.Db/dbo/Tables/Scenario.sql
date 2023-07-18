CREATE TABLE [dbo].[Scenario] (
    [ScenarioID]             INT            IDENTITY (101, 1) NOT NULL,
    [SalaryReviewAnalysisID] INT            NOT NULL,
    [SelectionType]          VARCHAR (20)   NULL,
    [ScenarioNumber]         INT            NOT NULL,
    [PercentIncrease]        DECIMAL (6, 3) NULL,
    [SalaryAmount]           MONEY          NULL,
    [Approved]               BIT            NULL,
    CONSTRAINT [ScenarioID] PRIMARY KEY CLUSTERED ([ScenarioID] ASC),
    CONSTRAINT [FK_Scenario_SalaryReviewAnalysis] FOREIGN KEY ([SalaryReviewAnalysisID]) REFERENCES [dbo].[SalaryReviewAnalysis] ([SalaryReviewAnalysisID])
);

