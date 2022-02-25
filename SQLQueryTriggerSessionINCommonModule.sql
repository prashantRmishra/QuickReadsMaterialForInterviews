select * from address;
select * from employee;

create trigger employeeInsert
on employee
for insert
as
begin
rollback
end
insert into employee(name,roleid,deptid,salary,managerid) values('prashant',3,3,56000000,1);
--drop trigger employeeInsert

create trigger employeeUpdate
on employee 
for update
as
begin
declare @oldSalary int
declare @newSalary int
select @oldSalary = salary from deleted -- transaction tables inserted and deleted
select @newSalary = salary from inserted
if(@newSalary> @oldSalary)
rollback
end

--drop trigger employeeUpdate
update employee set salary = 290000 where empid =2;


create view employeeview 
as 
select name,salary from employee;
select * from employeeview;
insert into employeeview values('prashant',4500000);
drop view employeeview