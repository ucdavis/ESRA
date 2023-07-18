CREATE TABLE [dbo].[SalaryScale] (
    [SalaryScaleID]        INT         IDENTITY (101, 1) NOT NULL,
    [TitleCode]            CHAR (4)    NOT NULL,
    [EffectiveDate]        DATETIME    NULL,
    [BargainingCode]       CHAR (2)    NULL,
    [NumSalarySteps]       SMALLINT    NULL,
    [LaborMarketWAS]       MONEY       NULL,
    [LaborMarketMidAnnual] MONEY       NULL,
    [CollegeAvgAnnual]     MONEY       NULL,
    [CampusAvgAnnual]      MONEY       NULL,
    [SalaryGrade]          CHAR (4)    NULL,
    [DataSource]           VARCHAR (5) NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SalaryScale_TitleCodeEffectiveDateUDX]
    ON [dbo].[SalaryScale]([TitleCode] ASC, [EffectiveDate] ASC);

