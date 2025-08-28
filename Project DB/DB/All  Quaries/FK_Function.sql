create Function  Getdata(@id int)
returns    varchar(100) 
as  
begin
 declare @emp  varchar(100) 
select @emp = x.Name from dbo.Owner x where @id  = Id 
return  @emp 

end

select dbo.Getdata(170)  

 create function tbl(@id int )
 returns  table  as
 return (
 select * 
 from dbo.Owner
 where @id =  dbo.Owner.Id
 )

 select * 
 from  tbl(170) 

 create function  Said (@id int)
 returns    @A table (
 Pid  int ,  
 name varchar(100)  
 ) as 
 begin
 insert  into @A (Pid ,  name) 
 
 select  * 
 from  Owner
 where Owner.Id =  @id 
 return  
 end 

 select * 
 from  Said(170)


 
 