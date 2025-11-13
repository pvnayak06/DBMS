create database supplier3;
use supplier3;
create table supplier(sid int,sname varchar(30),city varchar(30),primary key(sid));
create table parts(pid int,pname varchar(30),color varchar(30),primary key(pid));
create table catalog(sid int,pid int,cost decimal(10,2),foreign key(sid) references supplier(sid) on delete cascade,foreign key(pid) references parts(pid) on delete cascade);
insert into supplier values
(1, 'acme widget suppliers', 'bengaluru'),
(2, 'global inc', 'mumbai'),
(3, 'steel works', 'pune'),
(4, 'bolt and nut co', 'bengaluru'),
(5, 'red ltd', 'chennai'),
(6, 'green ltd', 'mumbai'),
(7, 'precision tools ltd', 'pune');
insert into parts values
(101,'bolt','red'),
(102,'nut','red'),
(103,'screw','blue'),
(104,'gear','green'),
(105,'clamp','blue'),
(106,'widget','red'),
(107,'welder','green');
insert into catalog values
(1, 101, 10.00),
(3, 102, 5.00),
(1, 106, 7.50),
(4, 107, 25.00),
(2, 101, 11.00),
(3, 102, 5.50),
(4, 103, 8.00),
(7, 104, 52.00),
(5, 105, 38.00);
select distinct p.pname from parts p join catalog c on p.pid=c.pid;
select s.sname from supplier s join catalog c on s.sid = c.sid group by s.sid, s.sname having count(distinct c.pid) = (select count(*) from parts);
select s.sname from supplier s join catalog c on s.sid = c.sid join parts p on p.pid=c.pid group by s.sid, s.sname having count(distinct c.pid) = (select count(*) from parts where color='red');
select p.pname from parts p join catalog c on p.pid=c.pid join supplier s on c.sid=s.sid group by p.pid,p.pname having count(distinct c.sid)=1 and max(s.sname)='acme widget suppliers';
select distinct c.sid,c.pid from catalog c where c.cost>(select avg(cost) from catalog c1 where c1.pid=c.pid);
select distinct p.pname,s.sname from parts p join catalog c on p.pid=c.pid join supplier s on c.sid=s.sid where c.cost=(select max(c1.cost) from catalog c1 where c1.pid=p.pid);
