Create database insurance;
create table insurance.person(driver_id varchar(10),d_name varchar(20),address varchar(20),primary key(driver_id));
create table insurance.car(reg_no varchar(10),model varchar(10),year int,primary key(reg_no));
create table insurance.accident(report_no int,a_date date,location varchar(10),primary key(report_no));
create table insurance.owns(driver_id varchar(10),reg_no varchar(10),primary key(driver_id,reg_no),foreign key(driver_id) references person(driver_id),foreign key(reg_no) references car(reg_no) );
create table insurance.participated(driver_id varchar(10),reg_no varchar(10),report_no int,damage_amount int,primary key(driver_id,reg_no,report_no),
foreign key(driver_id) references person(driver_id),foreign key(reg_no) references car(reg_no),foreign key(report_no) references accident(report_no)  );
use insurance;
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
insert into car values('KA052250','Honda',2001);
insert into car values('KA052251','BMW',2001);
insert into car values('KA052252','Ferrari',2001);
insert into car values('KA052253','Nissan',2001);
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
                    ('A01','KA052250',001,25000),
                    ('A02','KA052251',002,25000),
                    ('A03','KA052252',003,25000),
                    ('A04','KA052253',004,25000),
                    ('A05','KA052254',005,25000);
                    
select * from person;
select * from car;
select * from accident;
select * from owns;
select * from participated;
