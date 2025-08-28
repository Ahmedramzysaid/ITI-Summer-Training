use Company_SD ; 

-- 1.	Display (Using Union Function  
select D.Dependent_name as [Child] ,  concat(E.Fname , ' ' , E.Lname)   as [Name parents] 
from  Employee E inner join  Dependent D on(E.SSN =  D.ESSN and E.Sex = 'F' and D.Sex ='F') 
union 
select D.Dependent_name as [Child] ,  concat(E.Fname , ' ' , E.Lname) 
from  Employee E inner join  Dependent D on(E.SSN =  D.ESSN and E.Sex = 'M' and D.Sex ='M') 



-- 2. 2.	For each project, list the project name and the total hours per week (for all employees) spent on that project.
select P.Pname ,  sum(wf.Hours)/7  as [total hours] 
from  Project p  right outer join Works_for wf on (p.Pnumber = wf.Pno)  
group  by  P.Pname ;

--- 3.	Display the data of the department which has the smallest employee ID over all employees' ID.
select  top(1)D.Dname 
from  Departments D inner join Employee E  on (D.Dnum =  E.Dno) 
order by  E.SSN ; 
-- 4.	For each department, retrieve the department name and the maximum, minimum and average salary of its employees
select D.Dname , min(E.Salary) as [maximum] , max(E.Salary) as [minimum ]  , AVG(E.Salary) as [average ]
from Departments  D right outer join  Employee E on (D.Dnum =  E.Dno)
group by  D.Dname 
-- 5.	List the full name of all managers who have no dependents
select concat(E.Fname , ' ' , E.Lname ) as[Full Name]
from  Employee E 
where  E.Superssn  not in (select D.ESSN
from  Dependent D
)
--  6  For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.
select  D.Dnum , D.Dname , count(E.SSN)as [number of EMP]
from Departments D inner join  Employee  E on(D.Dnum =  E.Dno) 
group by D.Dnum  , D.Dname
having AVG(Salary) <  (select Avg(x.Salary)
from  Employee x 
)


-- 7.	Retrieve a list of employee’s names and the projects names they are working on ordered by department number and within each department, ordered alphabetically by last name, first name.
select  CONCAT(E.Fname , ' ' ,  E.Lname) as [Name Emp] ,  Pname  as [Project Name]
from Employee  E inner join Works_for wf on (wf.ESSn =  E.SSN) inner join Project P on (P.Pnumber= wf.Pno)  inner join   Departments D on (D.Dnum =  P.Dnum)
order by  D.Dnum  , E.Lname , E.Fname ;

----  8.	Try to get the max 2 salaries using sub query
select top(2)E.Salary  as [Max  Salary]
from  Employee  E
order by E.Salary desc
-- 9.	Get the full name of employees that is similar to any dependent name
select CONCAT (Fname , ' ' , Lname ) as[Full name]  
from  Employee  E inner join  Dependent D on(D.ESSN = E.SSN)
where D.Dependent_name like '%'+E.Lname or   D.Dependent_name like '%'+E.Fname

--  10.	Display the employee number and name if at least one of them have dependents (use exists keyword) 

select  E.SSN , concat(E.Fname , ' ' ,  E.Lname) as Fullname
from Employee E 
where EXISTS  (select* 
from  Dependent D
where E.SSN =  D.ESSN
)
--- 11.	In the department table insert new department called "DEPT IT”, with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'
insert into  Departments (Dname , Dnum , [MGRStart Date] ,MGRSSN)
values('DEPT IT' , 100 , 1-11-2006 , 112233) ;
-- 12 
-- a.	First try to update her record in the department table
update Departments  set  MGRSSN = 968574 where Dnum  = 100 ;
-- b.	Update your record to be department 20 manager.
update Employee set Dno = 20 where SSN = 102672 ; 
-- c.	Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)
update Employee set Superssn = 102672 where SSN = 102672 ;

--- 13
update Employee set Superssn = null,  Dno = null where SSN = 223344 ;
update Employee set Superssn =  null  where Superssn = 223344 ;
delete from Works_for where ESSn =  223344 ;
delete from Dependent where ESSN =  223344 ;
update Departments  set   MGRSSN = null where MGRSSN = 223344  ;
delete from   Employee where SSN = 223344 ;

--- 14 14.	Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30%
update Employee  set Salary =  Salary *1.3 
from  Employee E inner join Works_for wf on (E.SSN = wf.ESSn) inner join  Project p on (p.Pnumber = wf.Pno and p.Pname  ='Al Rabwah' )
