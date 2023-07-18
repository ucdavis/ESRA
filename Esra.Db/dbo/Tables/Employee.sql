CREATE TABLE [dbo].[Employee] (
    [PkEmployee]               CHAR (13)      NOT NULL,
    [EmployeeID]               CHAR (9)       NOT NULL,
    [TitleCode]                CHAR (4)       NOT NULL,
    [CareerHireDate]           DATETIME       NULL,
    [PPSCareerHireDateChecked] BIT            NULL,
    [ApptHireDate]             DATETIME       NULL,
    [PPSApptHireDateChecked]   BIT            NULL,
    [ExperienceBeginDate]      DATETIME       NULL,
    [DatesHaveBeenAdjusted]    BIT            NULL,
    [DepartmentComments]       VARCHAR (MAX)  NULL,
    [DeansOfficeComments]      VARCHAR (MAX)  NULL,
    [YearsOfService]           DECIMAL (5, 3) NULL,
    [TimeInTitle]              DECIMAL (5, 3) NULL,
    [YearsOfExperience]        DECIMAL (5, 3) NULL,
    [IsCAES]                   BIT            NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([PkEmployee] ASC)
);


GO
CREATE NONCLUSTERED INDEX [Employee_YearsOfServiceIDX]
    ON [dbo].[Employee]([YearsOfService] ASC);


GO
CREATE NONCLUSTERED INDEX [Employee_YearsOfExperienceIDX]
    ON [dbo].[Employee]([YearsOfExperience] ASC);


GO
CREATE NONCLUSTERED INDEX [Employee_TimeInTitleIDX]
    ON [dbo].[Employee]([TimeInTitle] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Employee_EmployeeIDTitleCodeUDX]
    ON [dbo].[Employee]([EmployeeID] ASC, [TitleCode] ASC);

