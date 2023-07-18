update  [ESRA].[dbo].[Employee]
set IsCAES = (CASE WHEN PkEmployee in
(Select PkEmployee from [ESRA].[dbo].UCDEmployee where (
(AdminDept like '03%' or AdminDept in ('065040', '065025') AND (AdminDept not IN('036000', '036005')))
OR
(HomeDept like '03%' or HomeDept in ('065040', '065025') AND (HomeDept not IN('036000', '036005')))

OR
(WorkDept is not null AND (WorkDept like '03%' or WorkDept in ('065040', '065025') AND (WorkDept not IN('036000', '036005'))))
)
) THEN 1
ELSE 0
END)