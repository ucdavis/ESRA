USE [msdb]
GO

/****** Object:  Job [ESRA.dbo.Employee_TimeLengthsRefresher]    Script Date: 07/01/2009 13:26:23 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 07/01/2009 13:26:24 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'ESRA.dbo.Employee_TimeLengthsRefresher', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Refresh ESRA.dbo.Employee YearsOfService and TimeInTitle with updated values by', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [UPDATE TimeInTitle and YearsOfService on existing records]    Script Date: 07/01/2009 13:26:24 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'UPDATE TimeInTitle and YearsOfService on existing records', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE dbo.Employee
SET YearsOfService = CAST(DATEDIFF(m, (CASE ISNULL(dbo.Employee.CareerHireDate, 0)
		WHEN 0 THEN (select HireDate from dbo.UCDEmployee WHERE dbo.Employee.PkEmployee = dbo.UCDEmployee.PkEmployee)
		ELSE dbo.Employee.CareerHireDate END), GETDATE()) AS DECIMAL) / 12,
    TimeInTitle = CAST(DATEDIFF(m, (CASE ISNULL(dbo.Employee.ApptHireDate, 0)
		WHEN 0 THEN (select BeginDate from dbo.UCDEmployee WHERE dbo.Employee.PkEmployee = dbo.UCDEmployee.PkEmployee)
		ELSE dbo.Employee.ApptHireDate END), GETDATE()) AS DECIMAL) / 12,
    YearsOfExperience = CAST(DATEDIFF(m, dbo.Employee.ExperienceBeginDate, GETDATE()) AS DECIMAL) / 12;
', 
		@database_name=N'ESRA', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [INSERT data for all remaining records]    Script Date: 07/01/2009 13:26:24 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'INSERT data for all remaining records', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'INSERT INTO dbo.Employee (
	[PkEmployee]
      ,[EmployeeID]
      ,[TitleCode]
      ,[CareerHireDate]
      ,[ApptHireDate]
      ,[DatesHaveBeenAdjusted]
      ,[DepartmentComments]
      ,[DeansOfficeComments]
      ,[YearsOfService]
      ,[TimeInTitle])
SELECT TOP (100) PERCENT
	UCDEmployee.PkEmployee,
	UCDEmployee.EmployeeID,
	UCDEmployee.TC, 
	dbo.Employee.CareerHireDate,
	dbo.Employee.ApptHireDate,
	dbo.Employee.DatesHaveBeenAdjusted,
	dbo.Employee.DepartmentComments, 
	dbo.Employee.DeansOfficeComments,
	CAST(DATEDIFF(m, (CASE ISNULL(dbo.Employee.CareerHireDate, 0)
		WHEN 0 THEN UCDEmployee.HireDate
		ELSE dbo.Employee.CareerHireDate END), GETDATE()) AS DECIMAL) / 12 AS YearsOfService,
	CAST(DATEDIFF(m, (CASE ISNULL(dbo.Employee.ApptHireDate, 0)
		WHEN 0 THEN UCDEmployee.BeginDate
		ELSE dbo.Employee.ApptHireDate END), GETDATE()) AS DECIMAL) / 12 AS TimeInTitle
FROM         
	dbo.UCDEmployee AS UCDEmployee
	LEFT OUTER JOIN
		dbo.Employee ON UCDEmployee.PkEmployee = dbo.Employee.PkEmployee
WHERE
	(UCDEmployee.HomeDept LIKE ''030%'') 
	AND UCDEmployee.PkEmployee NOT IN (SELECT PkEmployee FROM dbo.Employee); ', 
		@database_name=N'ESRA', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [REORGANIZE EmployeeTimeInTitleIDX]    Script Date: 07/01/2009 13:26:24 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'REORGANIZE EmployeeTimeInTitleIDX', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'ALTER INDEX [Employee_TimeInTitleIDX] ON [dbo].[Employee] REORGANIZE WITH ( LOB_COMPACTION = ON )', 
		@database_name=N'ESRA', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [REORGANIZE Employee_YearsOfServiceIDX]    Script Date: 07/01/2009 13:26:24 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'REORGANIZE Employee_YearsOfServiceIDX', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'ALTER INDEX [Employee_YearsOfServiceIDX] ON [dbo].[Employee] REORGANIZE WITH ( LOB_COMPACTION = ON )
', 
		@database_name=N'ESRA', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [REORGANIZE Employee_YearsOfExperienceIDX]    Script Date: 07/01/2009 13:26:24 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'REORGANIZE Employee_YearsOfExperienceIDX', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'ALTER INDEX [Employee_YearsOfExperienceIDX] ON [dbo].[Employee] REORGANIZE WITH ( LOB_COMPACTION = ON )', 
		@database_name=N'ESRA', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Run ESRA.dboEmployee refresh', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20080915, 
		@active_end_date=99991231, 
		@active_start_time=50000, 
		@active_end_time=235959, 
		@schedule_uid=N'fc5e0135-8faa-4086-a0a2-3fba472e3e86'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


