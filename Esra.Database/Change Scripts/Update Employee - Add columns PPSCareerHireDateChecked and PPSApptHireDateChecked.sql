USE [Esra];
GO

ALTER TABLE dbo.Employee ADD "PPSCareerHireDateChecked" bit NULL;
ALTER TABLE dbo.Employee ADD "PPSApptHireDateChecked" bit NULL;
GO

ALTER TABLE dbo.SRAEmployee ADD "PPSCareerHireDateChecked" bit NULL;
ALTER TABLE dbo.SRAEmployee ADD "PPSApptHireDateChecked" bit NULL;
GO

SET IDENTITY_INSERT [dbo].ChangeType ON;
INSERT INTO dbo.ChangeType ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (106, N'PPSCareerHireDateChecked', N'HireDateChecked', N'True to signify that a user has checked the employee''s career hire date against PPS.');
INSERT INTO dbo.ChangeType ([ChangeTypeID], [Type], [ShortType], [Description]) VALUES (107, N'PPSApptHireDateChecked', N'ApptDateChecked', N'True to signify that a user has checked the employee''s appt. hire date against PPS.');
SET IDENTITY_INSERT [dbo].[SelectionType] OFF;
GO


