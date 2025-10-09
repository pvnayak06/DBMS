Create database insurance2;
create table insurance2.person(driver_id varchar(10),d_name varchar(20),address varchar(20),primary key(driver_id));
create table insurance2.car(reg_no varchar(10),model varchar(10),year int,primary key(reg_no));
create table insurance2.accident(report_no int,a_date date,location varchar(10),primary key(report_no));
create table insurance2.owns(driver_id varchar(10),reg_no varchar(10),primary key(driver_id,reg_no),foreign key(driver_id) references person(driver_id),foreign key(reg_no) references car(reg_no) );
create table insurance2.participated(driver_id varchar(10),reg_no varchar(10),report_no int,damage_amount int,primary key(driver_id,reg_no,report_no),
foreign key(driver_id) references person(driver_id),foreign key(reg_no) references car(reg_no),foreign key(report_no) references accident(report_no)  );
use insurance2;
desc person;
desc car;
desc accident;
desc owns;
desc participated;
insert into person values('A01','richard','srinivas nagar');
insert into person values('A02','john','srinivas nagar');
insert into person values('A03','ryan','srinivas nagar');
insert into person values('A04','dane','srinivas nagar');
insert into person values('A05','kyle','srinivas nagar');
insert into car values('KA052250','Honda',2000);
insert into car values('KA052251','BMW',2001);
insert into car values('KA052252','Ferrari',2001);
insert into car values('KA052253','Nissan',2000);
insert into car values('KA052254','Mclaren',2001);
insert into accident values(001,'2001-12-22','tolgate');
insert into accident values(002,'2001-12-22','tolgate');
insert into accident values(003,'2001-12-22','tolgate');
insert into accident values(004,'2001-12-22','tolgate');
insert into accident values(005,'2001-12-22','tolgate');
insert into owns values
                     ('A01','KA052250'),
                    ('A02','KA052251'),
                    ('A03','KA052252'),
                    ('A04','KA052253'),
                    ('A05','KA052254');
                   
                    
insert into participated values
                    ('A01','KA052250',001,23000),
                    ('A02','KA052251',002,24000),
                    ('A03','KA052252',003,25000),
                    ('A04','KA052253',004,26000),
                    ('A05','KA052254',005,28000);
                    
select * from person;
select * from car;
select * from accident;
select * from owns;
select * from participated;
select * from participated order by damage_amount desc;
select * from car order by year asc;
select count(*) from car where model='Nissan';
select count(*) from car where year=2000;
select avg(damage_amount)
from participated;
delete from participated where damage_amount < (select * from (select avg(damage_amount)
from participated) as avg_amount);
select * from participated;
select max(damage_amount) from participated;
select d_name from person where driver_id in (select driver_id from participated where damage_amount > (select avg(damage_amount)
from participated)
);



