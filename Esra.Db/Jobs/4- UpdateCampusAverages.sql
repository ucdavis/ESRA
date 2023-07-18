update ESRA.dbo.SalaryScale
  set CollegeAvgAnnual = (Select RoundedAverage from [ESRA].[dbo].[CollegeAverages] where SalaryScale.TitleCode = CollegeAverages.TitleCode AND SchoolCode = '01')
  
  update ESRA.dbo.SalaryScale
  set CampusAvgAnnual = (Select round_avg from [ESRA].[dbo].[CampusAverages] where SalaryScale.TitleCode = CampusAverages.TC)
  
  update ESRA.dbo.SalaryScale 
  set CampusAvgAnnual = 0.00
  where CampusAvgAnnual is null;
  
  update ESRA.dbo.SalaryScale 
  set CollegeAvgAnnual = 0.00
  where CollegeAvgAnnual is null;
  
  update ESRA.dbo.SalaryScale 
  set LaborMarketMidAnnual = 0.00
  where LaborMarketMidAnnual is null;
  
  update ESRA.dbo.SalaryScale 
  set LaborMarketWAS = 0.00
  where LaborMarketWAS is null;
  
  update ESRA.dbo.SalaryScale 
  set NumSalarySteps = 0
  where NumSalarySteps is null;
  
  update [ESRA].[dbo].Employee 
  set YearsOfExperience = null 
  where ExperienceBeginDate is null