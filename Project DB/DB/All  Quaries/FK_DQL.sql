select * 
from dbo.Emp
select * 
from dbo.Owner
select * 
from dbo.SalesOffice
select * 
from dbo.OwnerProperty
select * 
from dbo.propety
--- Get all sales offices’ locations.
select x.Loc as Locations 
from  SalesOffice x

select Distinct  x.Loc as Locations 
from  SalesOffice x

-- Find the sales office with the highest Number value.
select  top(1)* 
from SalesOffice x
order by  x.Number Desc 

-- List all sales offices managed by a specific employee.
select  x.Name  ,  Y.*
from Emp x  inner join  SalesOffice y  on(x.Id =  Y.ManageerId)
-- Count how many sales offices each manager controls.
select  x.Name  ,  COUNT(y.Number) as  [Number Sales Office]
from  Emp  x  inner join  SalesOffice  y  on(x.Id =  y.ManageerId)
group  by  x.Name
-- Show sales offices with no assigned manager.
select * 
from  SalesOffice 
where ManageerId is null

-- Find employees who belong to the sales office located in "Cairo".
select  x.* 
from Emp  x  inner  join  SalesOffice y on (x.NumberSales =  y.Number and  y.Loc = 'Cairo')
--  Count the number of employees per sales office.
select y.Number ,  count(*)   
from  Emp x inner join  SalesOffice y on (x.NumberSales =  y.Number)
group  by  y.number
-- Get employees who do not belong to any sales office.


select * 
from  Emp x
where  x.NumberSales is null
-- Find the employee with the smallest Id

select top(1)* 
from Emp
---  
select x.Name  ,z.* 
from Owner  x  inner join  OwnerProperty  y  on(x.Id =  y.Owner_Id)  inner join  propety z  on (y.Pid  = z.PId)
select  count(*) as  [Number Of Owner]
from  Owner 
-- Show employees and the properties sold by their sales office.


select x.*  , z.*
from Emp  x  inner join SalesOffice  y on (x.NumberSales =  y.Number)  inner join  propety  z  on (y.Number =  z.NumberSales)

select  x.*
from Owner  x  inner join  OwnerProperty y  on (x.Id  =  Y.Owner_Id ) inner join  propety z on (z.PId =  y.Pid )  inner join SalesOffice m on (z.NumberSales  =  m.Number)  inner  join Emp k on (k.Id =  m.ManageerId and  k.Name = 'Ahmed')


select  x.*
from Owner  x  inner join  OwnerProperty y  on (x.Id  =  Y.Owner_Id ) inner join  propety z on (z.PId =  y.Pid )  inner join SalesOffice m on (z.NumberSales  =  m.Number)  inner  join Emp k on (k.Id =  m.ManageerId )

-- Find the city with the highest total percent-owned value across all properties.
select  top(1) x.City  ,   y.Percent_owned
from propety  x inner  join OwnerProperty y on (x.PId =  y.Pid) 
order by y.Percent_owned desc