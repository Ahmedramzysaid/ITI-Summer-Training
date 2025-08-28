create Schema  HR   ; 
alter Schema  HR  transfer   Emp 
create Schema  BNO1    
go
alter Schema  BNO1  transfer   propety
go
create Schema  BNO2    
go
alter Schema  BNO2  transfer   SalesOffice

create Schema  BNO3    
go
alter Schema  BNO3  transfer   OwnerProperty 

select *  from Owner 
begin transaction
--insert into  Owner(ID) values(300) 
insert into  Owner(Name) values('Abdo')
--rollback 
commit
-- CREATE SYNONYM synonym_name
--  FOR schema_name.object_name;
create SYNONYM  abdo  for HR.Emp
select  *  from  abdo 
