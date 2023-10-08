/*19. Consider the following relations for an order processing database application in a company.
CUSTOMER (Cust #: int, Cname: string, City: string)
ORDER (Order #: int, Odate: date, Cust #: int, Ord-Amt: int) ORDER-ITEM (Order #: int, Item #:int, qty: int)
ITEM (Item #: int, Unit Price: int)
SHIPMENT (Order #: int, Warehouse #: int, Ship-Date: date) WAREHOUSE (Warehouse #: int,City: string)
i) Create the above tables by properly specifying the primary keys and the foreign keys.*/

-- create table customer
create table customer 
( 
 cust# number(5), 
 cname varchar2(15) not null, 
 city varchar2(15), 
 primary key(cust#) 
); 
-- create table customer order
create table custorder 
( 
 order# number(5) constraint pk1 primary key, 
 odate date, 
 cust# number(5) references customer(cust#), 
 ord_amt number(5) 
 ); 
-- create table item
create table item 
( 
 item number(5) constraint pk2 primary key, 
 unitprice number(9,2) not null 
 ); 
-- create table order item
create table order_item 
( 
 order# number (5), 
 item number (5), 
 qty number(4), 
 foreign key(order#) references custorder(order#), 
 foreign key(item) references item(item), 
 primary key(order#,item) 
 ); 
--create table warehouse 
create table warehouse 
 ( 
 warehouse# number(5), 
 city varchar2(15), 
 primary key(warehouse#) 
 ); 
-- create table shipment
create table shipment 
 ( 
 order# number(5), 
 warehouse# number(5), 
 ship_date date, 
 foreign key(order#) references custorder(order#), 
 foreign key(warehouse#) references 
 warehouse(warehouse#),
primary key(order#,warehouse#) 
 );

/*ii) Enter at least five tuples for each relation.*/

-- in customer
insert into customer
with names as(
    select 1,'ABC','BLORE' from dual union all
    select 2,'DEF','KOLAR' from dual union all
    select 3,'GHI','BLORE' from dual union all
    select 4,'JKL','CHITTOR' from dual union all
    select 5,'MNO','MYSORE' from dual
)select*from names;

-- in order
insert into custorder
with names as(
    select 1,to_date('01-JAN-06','dd-mon-yy'),2,5000.5 from dual union all
    select 2,to_date('26-APR-06','dd-mon-yy'),3,2500 from dual union all
    select 3,to_date('27-APR-06','dd-mon-yy'),3,1000 from dual union all
    select 4,to_date('30-APR-06','dd-mon-yy'),5,1000 from dual union all
    select 5,to_date('25-MAR-06','dd-mon-yy'),1,5000 from dual
)select*from names;

-- in item
insert into item
with names as(
    select 1,2500 from dual union all
    select 2,5000 from dual union all
    select 3,1000 from dual union all
    select 4,5 from dual union all
    select 5,200 from dual
)select*from names;

-- in order item
insert into order_item values(1,2,1);
insert into order_item
    values (1,4,1);
insert into order_item
    values (2,1,1);
insert into order_item
    values (3,5,5);
insert into order_item
    values (4,2,2);

-- in warehouse
insert into warehouse
with names as(
    select 1,'BLORE' from dual union all
    select 2,'KOLAR' from dual union all
    select 3,'CHITTOR' from dual union all
    select 4,'MLORE' from dual union all
    select 5,'MYSORE' from dual
)select*from names;

-- in shipment
insert into shipment
    values (1,1,to_date('30-APR-06','dd-mon-yy'));
insert into shipment
    values (2,2,to_date('29-APR-06','dd-mon-yy'));
insert into shipment
    values (3,2,to_date('24-APR-06','dd-mon-yy'));
insert into shipment
    values (4,5,to_date('30-APR-06','dd-mon-yy'));
insert into shipment
    values (5,3,to_date('01-JUN-06','dd-mon-yy'));
/*insert into shipment
    values (6,1,to_date('01-JUN-06','dd-mon-yy'));*/

/*iii) Produce a listing: CUSTNAME, NO_OF_ORDERS, AVG_ORDER_AMT, where the middle column is the total number of orders by the customer and the last column is the average order amount for that customer*/

select c.cname,count(*),avg(o.ord_amt)
from customer c, custorder o
where c.cust# = o.cust# group by c.cname;

/*iv) List the Order# for the orders that were shipped from all the warehouses that the company has in a specific city*/

select order# from warehouse w, shipment s where w.warehouse# = s.warehouse# and city='BLORE';

/*v) Demonstrate how you delete Item# 10 from the ITEM table and make that field null in the ORDER- ITEM table.*/

delete from item where item=10;
update oder_item set item=NULL where item=10;

/*20. Create a table Emp(e_no, e_name, e_phone, e_addr,e_salary) to store records of 10 employees:*/

create table emp (
  e_no number(4),
  e_name varchar2(50),
  e_phone varchar2(15),
  e_addr varchar2(100),
  e_salary number(10, 2)
);

/*i) Alter the data type of e_no from number to varchar*/

alter table emp
modify e_no varchar(20);

/*ii) Alter table by setting e_no as primary key*/

alter table emp
add primary key(e_no);

/*iii) Alter table by adding a column e_pin*/

alter table emp
add e_pin varchar(25);

/*iv) Update the phone number of an employee in the table*/

-- first add values into columns

insert into emp(e_no,e_name,e_phone,e_addr,e_salary)
with names as(
    select 'E001', 'John Doe', '123-456-7890', '123 Main St', 50000.00 from dual union all
    select 'E002', 'Jane Smith', '987-654-3210', '456 Elm St', 60000.00 from dual union all
    select 'E003', 'Michael Johnson', '555-555-5555', '789 Oak St', 55000.00 from dual union all
    select 'E004', 'Sarah Williams', '333-444-5555', '987 Maple St', 62000.00 from dual union all
    select 'E005', 'David Lee', '777-888-9999', '234 Pine St', 53000.00 from dual union all
    select 'E006', 'Emily White', '222-111-3333', '567 Birch St', 58000.00 from dual union all
    select 'E007', 'Robert Brown', '666-777-8888', '789 Cedar St', 60000.00 from dual union all
    select 'E008', 'Jennifer Davis', '111-222-3333', '123 Walnut St', 59000.00 from dual union all
    select 'E009', 'William Moore', '444-555-6666', '345 Redwood St', 55000.00 from dual union all
    select 'E010', 'Linda Wilson', '888-999-1111', '678 Willow St', 62000.00 from dual
)select*from names;
-- then update the phone number of 1st employee

update emp set e_phone = '987-654-3210' where e_no = 'E001';

/*21. Create a table Dept(dept_no, dept_name,e_no, dept_loc,dept_hod) to store records of 10 departments*/

create table dept (
  dept_no varchar(10),
  dept_name varchar(50),
  e_no varchar(20),
  dept_loc varchar(100),
  dept_hod varchar(50)
);

-- add data

insert into dept
with names as(
    select 'D001', 'HR Department', 'E001', 'New York', 'John Smith' from dual union all
    select 'D002', 'Finance Department', 'E002', 'Chicago', 'Alice Johnson' from dual union all
    select 'D003', 'Marketing Department', 'E003', 'Los Angeles', 'David Brown' from dual union all
    select 'D004', 'IT Department', 'E004', 'San Francisco', 'Sarah Davis' from dual union all
    select 'D005', 'Operations Department', 'E005', 'Dallas', 'Michael Wilson' from dual union all
    select 'D006', 'Sales Department', 'E006', 'Houston', 'Emily Lee' from dual union all
    select 'D007', 'Customer Service Department', 'E007', 'Miami', 'Robert Moore' from dual union all
    select 'D008', 'Research and Development', 'E008', 'Seattle', 'Jennifer White' from dual union all
    select 'D009', 'Quality Assurance Department', 'E009', 'Boston', 'William Brown' from dual union all
    select 'D010', 'Production Department', 'E010', 'Denver', 'Linda Johnson' from dual
)select*from names;

/*i) Create the reference between Emp and Dept table with e_no attribute.*/

alter table dept
add foreign key(e_no) references emp(e_no);

/*ii) Assign dept_no as primary key.*/

alter table dept
add primary key(dept_no);

/*iii) Update the dept_hod for one department.*/

update dept set dept_hod = 'Randi Zuckerberg' where dept_no = 'D001';

/*v) Delete one department.*/

delete from dept where dept_no='D002';

/*22. Solve the following queries
i) Write a query to find the employee name and dept_hod whose dept_hod is SAY, “John”.*/

select e_name,dept_hod from emp natural join dept  where substr(dept_hod,1,4)='John';

/*ii) Write a query to find the average salary of the employee of CSE department.*/

select avg(e_salary) from emp natural join dept where dept_name='Customer Service Department';