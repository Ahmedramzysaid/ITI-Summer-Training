

--drop  table Emp
create table Emp(
Id int Primary  key identity(1,1) , 
Name varchar(100)    not null ,
NumberSales  int 
)

alter table Emp  add  CONSTRAINT  C1   Foreign Key (NumberSales)references SalesOffice(Number)
go 
create table Owner (
Id int primary key identity(10,10)  ,
Name Varchar(100) not null 
)

go
create table SalesOffice(
Number int primary key   identity(101,100) , 
Loc varchar(100) not  null  , 
ManageerId int  , 
)
alter table SalesOffice add CONSTRAINT  c2   Foreign Key (ManageerId)references Emp(Id) 

go
create table propety(
PId  int primary key identity(5 , 5 ) , 
Address  varchar(100)   default null , 
City varchar(50)  default 'Alex'  , 
State   varchar(100)  , 
Zip int unique  ,
NumberSales int  , 
)
alter table propety add CONSTRAINT  C3   Foreign Key (NumberSales)references SalesOffice(Number)

go
create table  OwnerProperty(
Owner_Id  int  ,
Pid int ,
Percent_owned decimal(10,10) ,   
Primary  key(Pid ,Owner_Id) ,
) 
alter table OwnerProperty add CONSTRAINT  C4   Foreign Key (Owner_Id)references Owner(Id) 
alter table  OwnerProperty add CONSTRAINT  C5   Foreign Key (Pid)references propety(PId) 
