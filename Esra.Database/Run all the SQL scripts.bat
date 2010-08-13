REM Instructions:
REM
REM Since the Create ESRA database and Populate with data.sql contains all the table data,
REM it is rather large, and will not run in the query window; therefore, run the "Run all the SQL scripts.bat" 
REM from a CMD shell.
REM
REM 1. Type CMD from the Windows Start Menu's "Search for Programs and Files", and a 
REM		CMD shell should open.
REM 2. Enter the fully-qualified file name for this file, i.e. "Run all the SQL scripts.bat" and press enter.
REM		The batch file should run all the scrips using the SQLCMD.exe utility to execute the
REM		SQL commands.
REM     
REM     Below are some examples of one of the SQLCMD commands:
REM     a. The first and second ones runs SQLCMD using an SQL Script as an input file:
REM        SQLCMD -S Donbot -i "C:\Users\taylor\Documents\SQL Server Management Studio\Projects\Create ESRA from Terry\Create ESRA database and Populate with data.sql" -e
REM        SQLCMD -S Donbot -i "C:\Users\taylor\Documents\SQL Server Management Studio\Projects\Create ESRA from Terry\Create SS Agent Job ESRA dbo.Employee_TimeLenghtsRefresher.sql" -e
REM        
REM     b. The third one executes a system stored procedure that runs a SQL server agent job:   
REM        SQLCMD -S donbot -Q "USE msdb; DECLARE @return_value int; EXEC @return_value = dbo.sp_start_job @job_name = [ESRA.dbo.Employee_TimeLengthsRefresher], @server_name= donbot; SELECT 'Return Value ' = CASE @return_value WHEN 0 THEN '0 - Success' ELSE '1 - Failure' END"
REM
REM Important! You will need to change the database server name, currently "donbot", to 
REM whatever database server you desire to create the ESRA database on.
REM
 
echo %1
echo "Starting to ESRA database and load data..."
SQLCMD -S Donbot -i "C:\Users\taylor\Documents\SQL Server Management Studio\Projects\Create ESRA from Terry\Create ESRA database and Populate with data.sql" -e
echo "Finished creating ESRA database and loading data."
echo "Creating SQL Server Agent job: ESRA dbo.Employee_TimeLenghtsRefresher"
SQLCMD -S Donbot -i "C:\Users\taylor\Documents\SQL Server Management Studio\Projects\Create ESRA from Terry\Create SS Agent Job ESRA dbo.Employee_TimeLenghtsRefresher.sql" -e
echo "Finished creating SQL Server Agent job: ESRA dbo.Employee_TimeLenghtsRefresher"
echo "Starting ESRA dbo.Employee_TimeLenghtsRefresher SQL Server Agent job."
SQLCMD -S donbot -Q "USE msdb; DECLARE @return_value int; EXEC @return_value = dbo.sp_start_job @job_name = [ESRA.dbo.Employee_TimeLengthsRefresher], @server_name= donbot; SELECT 'Return Value ' = CASE @return_value WHEN 0 THEN '0 - Success' ELSE '1 - Failure' END"
echo "ESRA dbo.Employee_TimeLenghtsRefresher SQL Server Agent job has started but will need time to complete running."