 USE [ESRA]
GO
/****** Object:  Table [dbo].[SelectionType]    Script Date: 07/01/2009 15:39:55 ******/
SET IDENTITY_INSERT [dbo].[SelectionType] ON
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (101, N'Minimum', N'Min', N'Minimum', N'02')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (102, N'First Qrtle', N'1st', N'First Quartile', N'03')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (103, N'Midpoint', N'Mid', N'Midpoint', N'04')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (104, N'Third Qrtle', N'3rd', N'Third Quartile', N'05')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (105, N'Maximum', N'Max', N'Maximum', N'06')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (106, N'Labor Market WAS', N'Labor Mkt WAS', N'Labor Market WAS', N'07')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (107, N'Labor Market Mid', N'Labor Mkt Mid', N'Labor Market Mid', N'08')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (108, N'College Average', N'College AVG', N'College Average', N'09')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (109, N'Campus Average', N'Campus AVG', N'Campus Average', N'10')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (110, N'Salary Step', N'Step', N'Salary Step', N'11')
INSERT [dbo].[SelectionType] ([SelectionTypeID], [Type], [ShortType], [Description], [SortOrder]) VALUES (111, N'None', N'None', N'No selection type selected', N'01')
SET IDENTITY_INSERT [dbo].[SelectionType] OFF
/****** Object:  Table [dbo].[QuartileType]    Script Date: 07/01/2009 15:39:55 ******/
SET IDENTITY_INSERT [dbo].[QuartileType] ON
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (101, N'Minimum', N'Min', NULL)
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (102, N'First Qrtle', N'1st', NULL)
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (103, N'Midpoint', N'Mid', NULL)
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (104, N'Third Qrtle', N'3rd', NULL)
INSERT [dbo].[QuartileType] ([QuartileTypeID], [Type], [ShortType], [Description]) VALUES (105, N'Maximum', N'Max', NULL)
SET IDENTITY_INSERT [dbo].[QuartileType] OFF
/****** Object:  Table [dbo].[PayRateType]    Script Date: 07/01/2009 15:39:55 ******/
SET IDENTITY_INSERT [dbo].[PayRateType] ON
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (101, N'Annual', N'A', NULL)
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (102, N'Mounthly', N'M', NULL)
INSERT [dbo].[PayRateType] ([PayRateTypeID], [Type], [ShortType], [Description]) VALUES (103, N'Hourly', N'H', NULL)
SET IDENTITY_INSERT [dbo].[PayRateType] OFF
/****** Object:  Table [dbo].[ApptType]    Script Date: 07/01/2009 15:39:55 ******/
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (1, N'Contract', N'CON', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (2, N'Regular/Career', N'CAR', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (3, N'Limited', N'LIM', N'(formerly casual)')
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (4, N'Casual/Restricted - Students', N'CAS/R', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (5, N'Academic', N'ACAD', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (6, N'Per Diem', N'PER D', NULL)
INSERT [dbo].[ApptType] ([ApptTypeID], [Type], [ShortType], [Description]) VALUES (7, N'Regular/Career Partial Year', N'C/PYR', NULL)
