use Company_SD 
--- Display the Department id, name and id and the name of its manager.
select D.Dnum , D.Dname , E.SSN ,  E.Fname + ' '+E.LName  as name
from  Departments D inner join  Employee E on  (D.MGRSSN= E.SSN)

-- Display the name of the departments and the name of the projects under its control.
select D.Dname as [Name of Department] , P.Pname as [Name of Project]
from Departments D   inner  join Project P on (D.Dnum =  P.Dnum)

--- Display the full data about all the dependence associated with the name of the employee they depend on him/her.
--select SSn , Fname  +' '+ Lname
--from  Employee
select  D.* , P.Fname+ ' '+ P.Lname as [Depend Name]
from  Employee P inner join  Dependent D on(P.SSN =  D.ESSN)



--- Id, name and location of the projects in Cairo or Alex city.
Select  Pnumber , Pname , Plocation 
from  Project 
where  city in ('alex' ,  'cairo') ;
--- rojects full data of the projects with a name starts with "a" letter.
Select  *
from  Project 
where  Pname  like 'a%' ;
---- all the employees in department 30 whose salary from 1000 to 2000 LE monthly.
select* 
from Employee
where Dno = 30  and Salary  between  1000 and 2000
  
--- names of all employees in department 10 who works more than or equal 10 hours per week on "AL Rabwah" project.
select E.Fname  , E.Lname 
from  Employee  E inner join Works_for wf on (wf.ESSn=  e.SSN) inner join Project P on(P.Pnumber = wf.Pno and P.Pname = 'AL Rabwah' and wf.Hours >= 10)  ;
---  names of the employees who directly supervised with Kamel Mohamed.
select  x.Fname , x.Lname
from Employee x  inner  join Employee y  on (X.Superssn = y.SSN and y.Fname+ ' ' +y.Lname = 'Kamel Mohamed')
 
--- etrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
select  Fname , Lname  
from Employee E  inner join  Works_for wf on(E.SSN = wf.ESSn) inner join Project P on (wf.Pno =  P.Pnumber)
order by  P.Pname
---- For each project located in Cairo City, find the project number, the controlling department name, the department manager last name, address and birthdate.
select  P.Pnumber , D.Dnum , E.Lname  ,  E.Address,E.Bdate
from  Project  P  inner join  Departments D on (P.Dnum =  D.Dnum and P.City ='cairo') inner join Employee E on (E.SSN =  D.MGRSSN)


--- Display All Data of the managers
select Distinct y.* 
from Employee x   left outer join Employee  y on (y.SSN = x.Superssn )  

-- Display All Employees data and the data of their dependents even if they have no dependents.
select  x.* 
from  Employee x   right outer join  Dependent D  on (x.SSN=  D.ESSN)
-- Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000.

insert into  Employee(SSN , Salary  ,Dno , Superssn )  values (102672 , 3000 , 30  , 112233 ) ;

--- Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or supervisor number to him.

insert into  Employee(SSN , Salary  ,Dno , Superssn )  values (102660 , null , 30  , null ) ;
-------------------------------------------------------------------------------------------------
update Employee  set Salary *=1.2  where SSN =  102672 ; 

-------------------------------------------------------------------------------------------------
select P.Pname --, P.City
from Project  P 
where P.City = 'cairo' 
union 
select P.Pname -- ,   P.City
from Project P
where P.City = 'alex' 

select P.Pname --, P.City
from Project  P 
where P.City = 'cairo' 
union all
select P.Pname -- ,   P.City
from Project P
where P.City = 'alex' 

-------------------------------------------------------------------------------------------------

select wf.ESSN
from Works_for wf inner join Project P ON wf.Pno = P.Pnumber
where P.Dnum = 10
INTERSECT
select wf.ESSN
from Works_for wf inner join Project P ON wf.Pno = P.Pnumber
where P.Dnum = 30
-------------------------------------------------------------------------------------------------
select wf.ESSN
from Works_for wf inner join Project P ON wf.Pno = P.Pnumber
where P.Dnum = 10
EXCEPT
select wf.ESSN
from Works_for wf inner join Project P ON wf.Pno = P.Pnumber
where P.Dnum = 30