
create table location (locationid int identity(1,1) primary key, area varchar(20) not null, city varchar(20) not null, pincode varchar(6) 
check(len(pincode)=6));

create table department (deptid int identity(1,1) primary key,deptname varchar(30) not null, locationid int ,
foreign key (locationid) references location(locationid) on delete cascade);

create table role (roleid int identity(1,1) primary key, rolename varchar(20) not null);

create table employee (empid int identity(1,1) primary key,name varchar(30) not null, roleid int, deptid int, salary int check(salary > 120000),
foreign key (roleid) references role(roleid) on delete cascade,foreign key (deptid) references department(deptid) on delete cascade);

create table employeeDetails( empid int identity(1,1), email varchar(40) unique, contactno varchar(10) check(len(contactno)=10),
age int check(age > 18),dob date, primary key(empid,email));

create table address (addressid int identity (1,1) primary key, empid int , area varchar(20) not null,city varchar(20) not null , pincode varchar(6) check(len(pincode)=6),
foreign key (empid) references employee(empid) on delete cascade);
--------------------
exec sp_help location;
exec sp_help department;
exec sp_help role;
--Inserting into location table
drop table employeeDetails;
drop table employee;
truncate table employeeDetails;
drop table address;
drop table department;
drop table location;

-----------
select  * from employee;
select * from employeeDetails;
select * from location;
select * from address;
select * from department;
select * from role;



--update location set locationid =3 where locationid =8;