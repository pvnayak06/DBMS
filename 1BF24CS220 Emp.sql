create database emp1;
use emp1;
create table dept(deptno int,dname varchar(50),dloc varchar(50),primary key(deptno));
create table project(pno int,ploc varchar(50),pname  varchar(50),primary key(pno));
create table employee(empno int,ename varchar(50),mgr_no int,hiredate date,sal decimal,deptno int,primary key(empno),foreign key(deptno) references dept(deptno));
alter table employee add foreign key(mgr_no) references employee(empno);
create table incentives(empno int,incentive_date date,incentive_amount decimal,primary key(empno,incentive_date),foreign key(empno) references employee(empno));
create table assigned_to(empno int,pno int,job_role varchar(50),primary key(empno,pno),foreign key(empno) references employee(empno),foreign key(pno) references project(pno));
insert into dept values
(10, 'research', 'bengaluru'),
(20, 'sales', 'hyderabad'),
(30, 'marketing', 'mysuru'),
(40, 'hr', 'bengaluru'),
(50, 'finance', 'mumbai'),
(60, 'it', 'pune');
insert into project values
(101, 'bengaluru', 'project 1'),
(102, 'hyderabad', 'project 2'),
(103, 'mysuru', 'project 3'),
(104, 'bengaluru', 'project 4'),
(105, 'pune', 'project 5'),
(106, 'mumbai', 'project 6');
insert into employee values
(1, 'james', null, '2015-01-10', 90000, 10),
(2, 'maria', 1, '2016-03-15', 75000, 10),
(3, 'david', 1, '2017-05-20', 68000, 20),
(4, 'john', 3, '2018-07-25', 55000, 20),
(5, 'Ryan', 1, '2019-09-30', 72000, 30),
(6, 'kyle', 5, '2020-11-05', 50000, 30);
insert into incentives values
(1, '2024-01-15', 5000),
(2, '2024-01-15', 3000),
(3, '2024-02-15', 4000),
(1, '2024-04-15', 5500),
(4, '2024-04-15', 2500),
(5, '2024-05-15', 3500);
insert into assigned_to values
(1, 101, 'project manager'),
(2, 101, 'data scientist'),
(2, 104, 'developer'),
(3, 102, 'sales lead'),
(4, 102, 'sales associate'),
(5, 103, 'marketing head');
select distinct a.empno from assigned_to a join project p on a.pno = p.pno Where ploc in ('Bengaluru', 'Hyderabad', 'Mysuru');
select empno from employee where empno not in(select distinct  empno from incentives);
SELECT E.ENAME,E.EMPNO,E.DEPTNO,A.JOB_ROLE,D.DLOC AS DEPARTMENT_LOCATION,P.PLOC AS PROJECT_LOCATION FROM EMPLOYEE E JOIN DEPT D ON E.DEPTNO = D.DEPTNO JOIN ASSIGNED_TO A ON E.EMPNO = A.EMPNO JOIN PROJECT P ON A.PNO=P.PNO
WHERE D.DLOC=P.PLOC;
select e.ename from employee e where e.empno in(select mgr_no from employee group by mgr_no having count(*)=(select max(empcount) from(select count(*) as empcount from employee where mgr_no is not null group by mgr_no)as
 count));
select e.ename,e.empno,e.deptno,e.mgr_no from employee e join employee m on e.deptno=m.deptno where m.empno=e.mgr_no and e.mgr_no is not null;
select e2.ename,e2.deptno from employee e2 where e2.mgr_no in(select e1.empno from employee e1 where e1.mgr_no is null);
select  e3.ename from employee e3 where e3.empno in(select  mgr_no from employee) and e3.sal>(select avg(e4.sal) from employee e4 where e4.mgr_no=e3.empno); 
select e.* from employee e join incentives i on e.empno=i.empno where i.incentive_date>='2024-01-01' and i.incentive_date<='2024-01-31' and i.incentive_amount=(select distinct incentive_amount from incentives where
incentive_date>='2024-01-01' and i.incentive_date<='2024-01-31' order by incentive_amount desc limit 1 offset 1);





