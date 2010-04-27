 SET IDENTITY_INSERT [ESRA].[dbo].[ChangeType] ON

INSERT INTO [ESRA].[dbo].[ChangeType]
           ([ChangeTypeID],
            [Type]
           ,[ShortType]
           ,[Description]) VALUES
('101'	,'AdjustedCareerHireDate',	'HireDate',	'Adjusted University Career Hire Date.'),
('102'	,'AdjustedApptHireDate',	'ApptDate',	'Adjusted Appointment Begin Date in Title.'),
('103'	,'ExperienceBeginDate',	'ExperienceDate',	'Adjusted Experience Begin Date.'),
('104'	,'DepartmentComments',	'DeptComments',	'Generic comments regarding employee entered by Employee''s department.'),
('105'	,'DeansOfficeComments',	'DeansComments',	'Generic comments regarding employee entered by Dean''s Office.'),
('106'	,'PPSCareerHireDateChecked',	'HireDateChecked',	'True to signify that a user has checked the employee''s career hire date against PPS.'),
('107'	,'PPSApptHireDateChecked',	'ApptDateChecked',	'True to signify that a user has checked the employee''s appt. hire date against PPS.')

SET IDENTITY_INSERT [ESRA].[dbo].[ChangeType] OFF