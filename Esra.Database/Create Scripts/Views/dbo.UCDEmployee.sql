USE [ESRA]
GO

/****** Object:  View [dbo].[UCDEmployee]    Script Date: 07/01/2009 13:35:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[UCDEmployee]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT APTDIS_V.EmployeeID + APTDIS_V.TitleCode AS PkEmployee, APTDIS_V.EmployeeID, APTDIS_V.HomeDepartment AS HomeDept, 
                      APTDIS_V.WorkDepartment AS WorkDept, CASE APTDIS_V.HOMEDEPARTMENT WHEN APTDIS_V.WORKDEPARTMENT THEN '' ELSE 1 END AS Different, 
                      APTDIS_V.FullName AS EmpName, Persons.FirstName, Persons.MiddleName, Persons.LastName, APTDIS_V.TitleCode AS TC, CONVERT(varchar(10), 
                      APTDIS_V.HireDate, 101) AS HireDate, CONVERT(varchar(10), APTDIS_V.ApptBeginDate, 101) AS BeginDate, 
                      CASE APTDIS_V.RATECODE WHEN 'H' THEN APTDIS_V.PAYRATE * 2080 WHEN 'B' THEN APTDIS_V.PAYRATE * 12 ELSE APTDIS_V.PAYRATE END AS PayRate, 
                      APTDIS_V.TypeCode AS ApptType, APTDIS_V.Grade AS SalaryGrade, APTDIS_V.TitleUnitCode AS BargainingUnit, APTDIS_V.Step AS SalaryStep
FROM         PPSDataMart.dbo.APTDIS_V AS APTDIS_V INNER JOIN
                      PPSDataMart.dbo.Persons AS Persons ON APTDIS_V.EmployeeID = Persons.EmployeeID
WHERE     (APTDIS_V.PayRate IN
                          (SELECT     MAX(PayRate) AS Expr1
                            FROM          PPSDataMart.dbo.APTDIS_V AS adv
                            WHERE      (APTDIS_V.EmployeeID = EmployeeID) AND (ApptEndDate IS NULL OR
                                                   ApptEndDate > GETDATE()) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                   PayEnd > GETDATE()) AND (DOSCode = 'REG') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN ('2', '7')))) AND 
                      (APTDIS_V.DistNo IN
                          (SELECT     TOP (1) DistNo
                            FROM          PPSDataMart.dbo.APTDIS_V AS APTDIS_V_1
                            WHERE      (ApptEndDate IS NULL OR
                                                   ApptEndDate > GETDATE()) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                   PayEnd > GETDATE()) AND (DOSCode = 'REG') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN ('2', '7')))) AND 
                      (APTDIS_V.ApptBeginDate IN
                          (SELECT     MAX(ApptBeginDate) AS Expr1
                            FROM          PPSDataMart.dbo.APTDIS_V AS APTDIS_V_2
                            WHERE      (ApptBeginDate <= GETDATE()) AND (ApptEndDate IS NULL OR
                                                   ApptEndDate > GETDATE()) AND (EmployeeID = APTDIS_V.EmployeeID) AND (PayBegin <= GETDATE()) AND (PayEnd IS NULL OR
                                                   PayEnd > GETDATE()) AND (DOSCode = 'REG') AND (EmployeeID = APTDIS_V.EmployeeID) AND (TypeCode IN ('2', '7'))))
ORDER BY PkEmployee

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "APTDIS_V"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Persons"
            Begin Extent = 
               Top = 6
               Left = 290
               Bottom = 123
               Right = 504
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
      Begin ColumnWidths = 9
         Width = 284
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
      Begin ColumnWidths = 11
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
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UCDEmployee'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UCDEmployee'
GO


