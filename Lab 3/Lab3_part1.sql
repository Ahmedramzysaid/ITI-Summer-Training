use Company_SD ;
/* Part 1  day  3  */
--  all data about Emp 
select * 
from  Employee ;
-- First name, last name, Salary and Department number.
select Fname , Lname , Salary , Dno
from  Employee ;

-- projects names, locations and the department which is responsible about it.
select Pname  , Plocation , Dnum
from Project 
--- ANNUAL COMM
select Fname  + ' '+ Lname as [Full Name] , (Salary*12)*0.1 as [ANNUAL COMM]
from  Employee


---  he employees Id, name who earns more than 1000 LE monthly
select SSN , Fname+ ' ' +Lname as name 
from  Employee
where Salary > 1000 ;

-- employees Id, name who earns more than 10000 LE annually.


select SSN , Fname+ ' ' +Lname as name 
from  Employee
where Salary*12 > 10000 ;

----  names and salaries of the female employees
select  Fname+ ' ' +Lname as name , Salary	 
from  Employee
where SEX  = 'f' ;


---  department id, name which managed by a manager with id equals 968574.
select   Dnum  ,  Dname ,  MGRSSN 
from Departments 
where MGRSSN  =   968574 


---- ids, names and locations of  the pojects which controled with department 10.

select Pname as name   , Plocation 
from Project 
where Dnum = 10 ;