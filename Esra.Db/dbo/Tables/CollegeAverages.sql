CREATE TABLE [dbo].[CollegeAverages] (
    [TitleCode]      VARCHAR (4) NOT NULL,
    [SchoolCode]     VARCHAR (2) NOT NULL,
    [RoundedAverage] MONEY       NULL,
    [NumEmployees]   INT         NULL,
    [EffectiveDate]  DATETIME    NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rounded Average: The average (rounded) salary for the particular title code within the given school/college.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CollegeAverages', @level2type = N'COLUMN', @level2name = N'RoundedAverage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Code: The PPS School Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CollegeAverages', @level2type = N'COLUMN', @level2name = N'SchoolCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Title Code: The PPS Title Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CollegeAverages', @level2type = N'COLUMN', @level2name = N'TitleCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'College Averages: Contains average salary by title code per college, 01 for CAES, 08 for COE.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CollegeAverages';

