create trigger print_salary
on employee
after insert ---we also have 'instead of delete' , and 'for insert'
as 
begin
select * from inserted  where employee.empid  = inserted.empid
print 'new employee salary inserted is '
end
go