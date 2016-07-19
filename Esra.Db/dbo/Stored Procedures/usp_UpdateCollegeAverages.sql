

-- =============================================
-- Author:		Ken Taylor
-- Create date: November 7, 2011
-- Description:	Truncate and re-populate College Averages Table
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateCollegeAverages] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

	TRUNCATE TABLE ESRA.dbo.CollegeAverages;

	INSERT INTO ESRA.dbo.CollegeAverages (TitleCode, SchoolCode, RoundedAverage, NumEmployees, EffectiveDate)
	
	SELECT TitleCode, SchoolCode, RoundedAverage, NumEmployees, EffectiveDate FROM ESRA.dbo.CollegeAveragesV

	--SELECT     TC, '01' AS SchoolCode, ROUND(AVG(PayRate), 2) AS RoundedAverage
	--FROM         dbo.UCDEmployee
	--WHERE     (PkEmployee IN
	--						  (SELECT     PkEmployee
	--							FROM          dbo.UCDEmployee AS UCDEmployee_1
	--							WHERE      (HomeDept LIKE '03%') OR
	--												   (HomeDept IN ('065040', '065025')) AND (HomeDept NOT IN ('036000', '036005')) OR
	--												   (WorkDept IS NOT NULL) AND (WorkDept LIKE '03%' OR
	--												   WorkDept IN ('065040', '065025') AND WorkDept NOT IN ('036000', '036005'))))
	--GROUP BY TC

	--UNION ALL

	--SELECT     TC, '08' AS SchoolCode, ROUND(AVG(PayRate), 2) AS RoundedAverage
	--FROM         dbo.UCDEmployee
	--WHERE     (PkEmployee IN
	--						  (SELECT     PkEmployee
	--							FROM          dbo.UCDEmployee AS UCDEmployee_1
	--							WHERE      ((HomeDept LIKE '024%')  AND (HomeDept NOT IN ('024060', '024005'))) 
	--							OR ((WorkDept IS NOT NULL) AND (WorkDept LIKE '024%' AND WorkDept NOT IN ('024060', '024005')))))
	                                                   
	--GROUP BY TC

END