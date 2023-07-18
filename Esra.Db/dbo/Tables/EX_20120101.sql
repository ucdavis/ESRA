CREATE TABLE [dbo].[EX_20120101] (
    [TitleCode]      NVARCHAR (10)  NULL,
    [PayrollTitle]   NVARCHAR (255) NOT NULL,
    [EffectiveDate]  DATETIME       NULL,
    [NumSalarySteps] INT            NULL,
    [Step]           NVARCHAR (5)   NULL,
    [DisplayRanking] INT            NULL,
    [Annual]         FLOAT (53)     NULL,
    [Monthly]        FLOAT (53)     NULL,
    [Hourly]         FLOAT (53)     NULL
);

