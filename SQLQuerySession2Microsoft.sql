select * from employee;
select * from location where city not in( 'Bangalore','Delhi');
--fetch all the location where pincode start with 1
select * from location where pincode like '1%';
-- using union operator 
/*
it is join without mapping first column from first table to second column in second table
rules are datatype should match and column name should also match
*/
select area,city from location union select area,city from address;
select area,city from location union all select area,city from address;-- all the rows from both the table
--intersect : it will only fetch only common things
select area,city from location intersect select area,city from address;-- intersection
--except operator
-- to eleminate all the common
select area,city from location except select area,city from address;
------------we want the locationid,city and noofemployees in that location
select l.locationid,a.city,count(a.empid) as noofemp from location l, department d,employee e,address a
where l.locationid = d.locationid and d.deptid = e.deptid 
and a.empid = e.empid
group by 
l.locationid,a.city
order by 1,2 desc;

select * from employee;
select * from location;
select * from address;
--query given for practice
select e.name from employee e,department d,location l
where e.deptid = d.deptid and d.locationid = l.locationid
and l.city = 'mumbai';
---a better approach for above query would have been
select * from employee e,address a where e.empid = a.empid and a.city = 'Mumbai';
-- 
select * from employee e where deptid in (
select deptid from department where deptname ='sales');

select d.deptname, l.locationid, count(e.empid) as noofempoyees from employee e,department d,location l
where e.deptid = d.deptid and d.locationid = l.locationid group by d.deptname, l.locationid; 
-- abetter approach for above would have been
------finish practice


--select emp details where location is mumbai

--join
select e.empid,e.name,e.roleid,e.deptid, e.salary from employee e , address a where a.empid = e.empid and city = 'mumbai';

--correlated subquery
select * from employee e where exists(select a.empid from address a where a.empid = e.empid and city='mumbai');
-----------------

--select emp details where location is mumbai and department is not enginneering

--join
select e.empid,e.name,e.roleid,e.deptid, e.salary from employee e ,department d, address a where 
d.deptid = e.deptid and 
d.deptname <> 'Engineering' and
a.empid = e.empid and city = 'mumbai';

-- subquery
select * from employee e where exists (select d.deptid from department d where d.deptid = e.deptid and d.deptname <> 'engineering')
and exists (select a.empid from address a where a.empid = e.empid and city = 'mumbai');
-----------------

------------
select a.city, count(a.empid) as noofemp 
from location l, department d, Employee e, address a
where l.locationid = d.locationid
AND
d.deptid = e.deptid
AND
a.empid = e.empid
group by a.city
order by 1;
---subquery
select a.city, count(a.empid) as noofemp 
from location l, department d, Employee e, address a
where exists(select * from department  where l.locationid = d.locationid AND d.deptid = e.deptid AND a.empid = e.empid)
group by a.city
order by 1;
-----------------------------------
select e.name, a.city,l.locationid from Employee e, address a, department d, location l
where
e.empid = a.empid
and
e.deptid = d.deptid
and
d.locationid = l.locationid
and a.city='Mumbai';
---subquery
select e.name, a.city,l.locationid from Employee e, address a, department d, location l
where
exists(select * from address where e.empid = a.empid and e.deptid = d.deptid and d.locationid = l.locationid and a.city='Mumbai');

-----------------------------------
select * from address;

alter table employee add managerid int;
alter table employee add foreign key (managerid) references employee(empid) on delete no action on update no action;

------------------------------------












