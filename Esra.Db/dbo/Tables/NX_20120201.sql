CREATE TABLE [dbo].[NX_20120201] (
    [TitleCode]      NVARCHAR (4) NULL,
    [EffectiveDate]  DATETIME     NULL,
    [NumSalarySteps] INT          NOT NULL,
    [Step]           NVARCHAR (5) NULL,
    [DisplayRanking] INT          NULL,
    [Annual]         FLOAT (53)   NULL,
    [Monthly]        FLOAT (53)   NULL,
    [Hourly]         FLOAT (53)   NULL
);

