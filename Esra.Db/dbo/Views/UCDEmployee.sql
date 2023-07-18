
CREATE VIEW [dbo].[UCDEmployee]
AS
SELECT     TOP (100) PERCENT PkEmployee, EmployeeID, AdminDept, HomeDept, WorkDept, Different, EmpName, FirstName, MiddleName, LastName, TC, HireDate, BeginDate, 
                      PayRate, ApptType, SalaryGrade, BargainingUnit, SalaryStep, (CASE WHEN (HomeDept LIKE '030%') OR
                      (HomeDept IN ('065040', '065025', '065130')) AND (HomeDept NOT IN ('036000', '036005')) THEN '01' WHEN (HomeDept LIKE '024%') AND 
                      (HomeDept NOT IN ('024060', '024005')) THEN '08' WHEN (HomeDept LIKE '011%') AND (HomeDept NOT IN ('011001', '011019', '011060', '011096')) OR
                      (HomeDept IN ('040260', '061133')) THEN '22' ELSE NULL END) AS SchoolCode
FROM         dbo.AllUCDEmployees
WHERE     (HomeDept LIKE '030%') OR
                      (HomeDept LIKE '024%') AND (HomeDept NOT IN ('024060', '024005')) OR
                      (HomeDept IN ('065040', '065025', '065130')) AND (HomeDept NOT IN ('036000', '036005')) OR
                      (HomeDept LIKE '011%') AND (HomeDept NOT IN ('011001', '011019', '011060', '011096')) OR
                      (HomeDept IN ('040260', '061133'))
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'UCDEmployee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[37] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AllUCDEmployees"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 13
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'UCDEmployee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UCDEmployee (view): Filtered list of all UCD employees whose home department is in AAES, meaning (HomeDept LIKE ''030%'' OR HomeDept IN (''065040'', ''065025'', ''065130'')) AND HomeDept NOT IN (''036000'', ''036005'')', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'UCDEmployee';

