--1. Print the highest salary department wise. Along with that also print the 
--particular employee name who has received the highest salary		
select e.name,d.deptname ,e.salary as salary from employee e , department d where 
 e.deptid = d.deptid 
  and (select distinct (count(e2.salary)) from employee e2 where d.deptid = e2.deptid and e2.salary > e.salary) =0
 order by d.deptname;
--2Fetch the employees and create a password of the combination of their name and dob (3 characters of name, convert the date to number and join it			
select e.name ,ed.email ,ed.dob, concat(substring(e.name,0,4),convert (int,cast(ed.dob as datetime))) as passord from employee e, employeeDetails ed where e.empid = ed.empid;
--3.Fetch the employee details and display the salary with the rupee symbol. Also print the monthly salary on the basis of the salary			
select e.empid,e.name, FORMAT(e.salary, 'C', 'hi-in') 'Annual Salary', FORMAT(e.salary/12, 'C', 'hi-in') 'Monthly Salary' from employee e;
-- 4	Fetch the employee name and dob. Print the date in 10/11/2021 format			
select e.name ,convert(NVARCHAR, ed.dob, 103) as dob from employee e ,employeeDetails ed where e.empid = ed.empid;
--5 Rank the employees according to their salaries. HINT (use RANK()) . Highest salary should receive first rank			
select e.name,e.salary,rank() over (order by salary desc) rank from employee e ;