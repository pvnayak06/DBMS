create database bankDB3;
use bankDB3;
Create table branch(branch_name varchar(50),branch_city varchar(50),assets decimal(15,2),primary key(branch_name));
Create table bankaccount(accno int,branch_name varchar(50),balance decimal(15,2),primary key(accno),foreign key(branch_name) references branch(branch_name));
Create table bankcustomer(customer_name varchar(50),customer_street varchar(50),customer_city varchar(50),primary key(customer_name));
Create table depositer(customer_name varchar(50),accno int,primary key(customer_name,accno),foreign key(customer_name) references bankcustomer(customer_name),
foreign key(accno) references bankaccount(accno));
Create table loan(loan_number int,branch_name varchar(50),amount decimal(15,2),primary key(loan_number),foreign key(branch_name) references branch(branch_name));
INSERT INTO Branch VALUES
('SBI_ResidencyRoad', 'Bangalore', 9000000),
('SBI_Jayanagar', 'Bangalore', 8000000),
('SBI_MG_Road', 'Bangalore', 8500000),
('SBI_Connaught', 'Delhi', 7000000),
('SBI_KarolBagh', 'Delhi', 7500000);
INSERT INTO BankAccount VALUES
(1, 'SBI_Jayanagar', 25000),
(2, 'SBI_ResidencyRoad', 30000),
(3, 'SBI_MG_Road', 45000),
(8, 'SBI_ResidencyRoad', 52000),
(10, 'SBI_ResidencyRoad', 40000);
INSERT INTO BankCustomer VALUES
('Avinash', 'Bull_Temple_Road', 'Bangalore'),
('Dinesh', 'Bannergatta_Road', 'Bangalore'),
('Mohan', 'NationalCollege_Road', 'Bangalore'),
('Nikil', 'Akbar_Road', 'Delhi'),
('Ravi', 'Prithviraj_Road', 'Delhi');
INSERT INTO depositer VALUES
('Dinesh', 2),
('Avinash', 8),
('Dinesh', 10),
('Mohan', 3),
('Nikil', 1);
INSERT INTO Loan VALUES
(101, 'SBI_ResidencyRoad', 150000),
(102, 'SBI_Jayanagar', 120000),
(103, 'SBI_MG_Road', 100000),  
(104, 'SBI_Connaught', 200000),
(105, 'SBI_ResidencyRoad', 175000);
select branch_name,(assets/100000) as assets_in_lakhs from branch;
select d.customer_name,b.branch_name from depositer d join bankaccount b on d.accno=b.accno group by b.branch_name,d.customer_name having count(*)>=2;
create view  loan1_sum as select branch_name, sum(amount) as lo_sum from loan group by branch_name;
select * from loan1_sum;
select c.customer_name from bankcustomer c where not exists(select b.branch_name from branch b where b.branch_city='delhi' and not exists(select * from depositer d join bankaccount a on
 d.accno=a.accno where d.customer_name=c.customer_name and a.branch_name=b.branch_name));
update bankaccount set balance=balance*1.05;
select distinct d.customer_name from depositer d join bankaccount a on d.accno=a.accno and a.branch_name="sbi_bangalore" where d.customer_name in (select customer_name from loan where branch_name='SBI bangalore');
select branch_name from branch where assets>all(select assets from branch where branch_city='bangalore');




