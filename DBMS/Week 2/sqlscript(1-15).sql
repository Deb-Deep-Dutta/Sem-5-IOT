/*1. Create a table employee with attributes emp_id, f_name, l_name, job_type, salary, dept, commission, manager_id.*/

create table employee 
( 
    emp_id int, 
    f_name varchar(20), 
    l_name varchar(40), 
    salary int, 
    dept varchar(20), 
    commission int, 
    manager_id int 
);

/*2. Make emp_id as the primary key of employee table.*/

alter table employee
add primary key(emp_id);

/*3. Make f_name and salary NOT NULL type.*/

alter table employee
modify f_name varchar(20) not null;
alter table employee
modify salary int not null

/*4. Add a column date_of_joining in the employee table.*/

alter table employee 
add date_of_joining date;

/*5. Create a table department with attribute d_name, d_loc and HOD_id where d_name is primary key.*/

create table department 
( 
    d_name varchar(30) not null, 
    d_loc varchar(45), 
    primary key(d_name) 
);

/*6. Create a table location with attributes loc_id, city and contact_no.*/

create table location
( 
    loc_id int, 
    city varchar(45),
    contact_no int
);

/*7. Enhance the size of the ‘city’ attribute by 5, in the location table.*/

alter table location
modify city varchar(50);

/*8. Delete the contact_no attribute from the location table.*/

alter table location
drop column contact_no;

/*9. Make the department attribute of the employee table its foreign key referencing the department table.*/

alter table employee
add foreign key(dept) references department(d_name);

/*10. Rename the city attribute to ‘address’ in the location table.*/

alter table location
rename column city to address;

/*11. Rename the location table name to ‘loc’.*/

alter table location
rename to loc;

/*12. Insert the following rows in ‘loc’ table
________________
|loc_id |address|
|_______|_______|
|1      |Kolkata|
|2      |Mumbai |
|_______|_______|*/

insert into loc 
values (1,'Kolkata');
insert into loc 
values (2,'Mumbai');

/*13. Truncate the table ‘loc’.*/

truncate table loc;

/*14. Drop the table ‘loc’.*/

drop table loc

/*15. Insert the following rowsin the department table:
_______________________________
|d_name    | d_loc    | HOD_id |
|__________|__________|________|
|Sales     |  Kol     |   4    |
|Accounts  | Delhi    |   6    |
|Production|  Kol     |   1    |
|Marketing |  Kol     |   2    |
|R & D     |Marketing |   8    |
|__________|__________|________|*/

insert into department 
    values('Sales','Kolkata',4);
insert into department 
    values('Accounts','Delhi',6);
insert into department 
    values('Production','Kolkata',1);
insert into department 
    values('Marketing','Kokata',2);
insert into department 
    values('R & D','Marketing',8);