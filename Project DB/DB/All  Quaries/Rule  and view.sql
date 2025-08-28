use FirstRevsion
select *  from BNO1.propety 

create rule  r1   as  @age > 22   
sp_bindrule 'r1', 'BNO1.propety.Zip';
create view  v1 
as  
select *  
from BNO1.propety

create  or alter View   v2(PO  , z)
as 
select  x.Percent_owned , y.Zip 
from BNO3.OwnerProperty x   inner join BNO1.propety  y on (x.Pid =  y.PId) 
update v2  set PO  = 10   


select  *  from Owner
create nonclustered index i1  on  Owner(Name)



