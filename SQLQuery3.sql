--1 any and all
select distinct(e.name) from employee e , department d where e.deptid = any  (select deptid from department);
select * from employee e, department d where e.salary > 500000 and  d.deptid  = any(select d.deptid from department d where d.deptname like 'e%');
select * from employee e , department d  where e.deptid = d.deptid and d.deptid= all(select deptid from  department where deptname like 'Production');
--2. Fetch all the employees with roleid 3 but not in area = Lajpath Nagar
select * from employee e, department d,location l where roleid = 3 
and d.deptid = e.deptid and  d.locationid = l.locationid and l.area <> 'lajpath nagar';
--3. Fetch dept wise total salary along with the city from location table
select d.deptname ,l.city, sum(e.salary) from employee e , department d, location l where 
d.deptid = e.deptid  and l.locationid = d.locationid group by  d.deptname,l.city;

--4 Fetch the employees whose name contains s but not i
select * from employee e where e.name like '%s%' and name not like '%i%';
--5. Print all the employees with their department name having employee count more than 4 in that particular department.
select d.deptname , count(e.empid) noofemp from employee e, department d where d.deptid = e.deptid group by 
d.deptname having count(e.empid) > 4;
--6. Combine the employee table and address table to fetch a report of employees still not submitted their address.
select * from employee e where e.empid not in (select e1.empid from employee e1 , address a where e1.empid = a.empid);

--6 th with except operator
select e.empid, e.name,e.deptid,e.roleid, e.salary, e.managerid from employee e except select e1.empid, e1.name,e1.deptid,e1.roleid, e1.salary, e1.managerid from employee e1 , address a where e1.empid = a.empid;
--7. Fetch the above report and also print the employee name, their manager name and the department name.
select e.name,e1.name as managername from employee e , employee e1 
where e.managerid = e1.empid and e.empid not in (select e1.empid from employee e1 , address a where e1.empid = a.empid);
--7th with except operator
select e.name,e1.name as managername from employee e , employee e1 
where e.managerid = e1.empid and e.empid in ((select empid from employee)
except (select empid from address));
--8 Fetch the above report but give the total number of employees department wise still not submitted their address.
---with except
select d.deptname , count( e.empid) as noOfEmployees from employee e ,department d
where  d.deptid = e.deptid and 
e.empid in ( select empid from employee except (select empid from address)) group by d.deptname;
---- without except
select d.deptname , count( e.empid) as noOfEmployees from employee e ,department d
where  d.deptid = e.deptid and 
e.empid not in (select e.empid from employee e , address a where a.empid = e.empid) group by d.deptname;

--9.Print max salary department wise
select d.deptname , sum(e.salary) from employee e , department d where 
d.deptid = e.deptid group by  d.deptname order by d.deptname ;

--10 : 10. Print the address from the address table along with the department name and location id.
select a.addressid,a.empid,a.area,a.city,a.pincode,d.deptname,l.locationid from address a , department d, location l , employee e
where e.empid = a.empid and e.deptid = d.deptid and d.locationid = l.locationid;


select * from address;
select * from location;
select * from employee where name like 'adam%';
select * from department;
select * from employee order by name;