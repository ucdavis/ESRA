CREATE TABLE [dbo].[SalaryGradeMatrix] (
    [SalaryGradeMarixID] INT         IDENTITY (101, 1) NOT NULL,
    [SalaryGrade]        CHAR (4)    NOT NULL,
    [MinAnnual]          MONEY       NULL,
    [FirstQrtleAnnual]   MONEY       NULL,
    [MidAnnual]          MONEY       NULL,
    [ThirdQrtleAnnual]   MONEY       NULL,
    [MaxAnnual]          MONEY       NULL,
    [EffectiveDate]      DATETIME    NULL,
    [SalaryScaleID]      INT         NULL,
    [DataSource]         VARCHAR (5) NULL,
    CONSTRAINT [PK_SalaryGradeMatrix] PRIMARY KEY CLUSTERED ([SalaryGradeMarixID] ASC),
    CONSTRAINT [FK_SalaryGradeMatrix_SalaryScale] FOREIGN KEY ([SalaryGrade], [EffectiveDate]) REFERENCES [dbo].[SalaryGradeMatrix] ([SalaryGrade], [EffectiveDate])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SalaryGradeMatrix_SalaryGradeEffectiveDate]
    ON [dbo].[SalaryGradeMatrix]([SalaryGrade] ASC, [EffectiveDate] ASC);

