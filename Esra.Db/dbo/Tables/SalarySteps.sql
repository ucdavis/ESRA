CREATE TABLE [dbo].[SalarySteps] (
    [PkSalaryStep]  INT         IDENTITY (101, 1) NOT NULL,
    [TitleCode]     CHAR (4)    NOT NULL,
    [Step]          CHAR (5)    NOT NULL,
    [Annual]        MONEY       NOT NULL,
    [Monthly]       MONEY       NOT NULL,
    [Hourly]        MONEY       NOT NULL,
    [EffectiveDate] DATETIME    NULL,
    [DataSource]    VARCHAR (5) NULL
);


GO
CREATE NONCLUSTERED INDEX [SalarySteps_TitleCodeAnnualIDX]
    ON [dbo].[SalarySteps]([TitleCode] ASC, [Annual] ASC);


GO
CREATE UNIQUE CLUSTERED INDEX [SalarySteps_TitleCodeStepEffectiveDateUDX]
    ON [dbo].[SalarySteps]([TitleCode] ASC, [Step] ASC, [EffectiveDate] ASC);

