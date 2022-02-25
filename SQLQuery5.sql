/*
Procedures and triggers
Procedures :is instruction which you bunch and keep it to
execute anytime;
system store procedure : sp_help 'employee'
similarly we can also create our own procedures 
select * from employee e , department d where e.deptid = d.deptid and e.deptid =4;
same can be used to create stored procedures 
create proceure get_emp_details_with_deptname as 
select * from employee e , department d where e.deptid = d.deptid and e.deptid =4;

*/select * from employee e , department d where e.deptid = d.deptid and e.deptid =4;
--create procedures as 
--but this is static for deptid 4
create procedure get_emp_details_with_deptname as 
select * from employee e , department d where e.deptid = d.deptid and e.deptid =4;
exec get_emp_details_with_deptname;
--dynamic procedure will be
create procedure get_emp_details_with_deptname @deptid int
as 
select * from employee e , department d where e.deptid = d.deptid and e.deptid =@deptid;
exec get_emp_details_with_deptname 4;
--we can also deop the procedure 
drop procedure get_emp_details_with_deptname;
----triggers: special type of stored procedures
create table marks(stuid int primary key identity, sub1 int , sub2 int , sub3 int , total_marks int , percetile float);
--now lets create trigger to calculate percentage based on the marks
create trigger student_marks
on marks
after insert  -- After the insert happens the trigger will run.
as
Begin --start point of the trigger
update marks set total_marks = marks.sub1+marks.sub2+marks.sub3,percentile = (marks.sub1+marks.sub2+marks.sub3/3)
from inserted -- a table where the inserted values are stored temporarly
where marks.stuid = inserted.stuid
print 'Trigger fired and data updated successfully'
end
go
 insert into marks(sub1,sub2,su3) values (2,2,2); -- After the insert happens the trigger will run.























