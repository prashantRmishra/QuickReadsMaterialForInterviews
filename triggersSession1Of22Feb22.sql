--triggers
--creating view
--view are used for creating subtable table that will have specific table
    --view are more sucure that normal tables 
--column that you want the user tho see
create view viewname as
select column1,column2 from table_name;

---now use view as 
select * from viewname;
--imp for view 
    -- We can insert, from view and changes will be affected in the original table provided that given 
        -- view has scope of not null tables as well
         --example , below view opration will work
            create view employeeview 
            as 
            select name,salary from employee;
            select * from employeeview;
            insert into employeeview values('prashant',4500000);
            drop view employeeview 
        -- also if the view is created for a join query then also we can insert value if we add column of one table at 
        -- a time for insert but if we try to insert values in all the columns of the view (created on the join queury of two tables ) then it wont work
        -- as we can not insert into two tables at the same time.
    --update
     delete on the view
   

--what happnes when select * from tableName is rame
--it does following
    --Syntax check 1
    --resource check 2 
    --optimizatoin check 3 
    --excecution plan created 4
    --excecuted 5


--creating index (required for optimization of the query)
create index indexName on tablename(coulumnName);
-- droping index
drop indexName;

--trigger syntax
create trigger triggerName
on tableName
for [update | delete | insert | instead of insert] -- instead of insert is for doing some operation 
as
begin
--some statement the 
end

---create trigger so that let say a column (SCORE) value should be increasing for insert or update 
--let say the table name is ExternalCandidates
create trigger triggerName
on ExternalCandidate
for update
as 
begin
declare @oldScore int 
declare @newScore int 
select @oldScore = score from ExternalCandidate 
select @newScore  = score from ExternalCandidate 
if(@newScore <= @oldScore) 
rollback
end

---task create trigger for insert and update.  

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