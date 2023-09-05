/*I have created a copy of employee table to keep the original intact*/
create table emp_1 as select*from employee

/*1. Find the Cartesian product between Employee and Department table.*/
select*from emp_1 cross join department;

/*2. Show the employee names and the respective department location.*/
select (f_name||' '||l_name)"Employee Name",d_loc from emp_1 e inner join department d on e.dept=d.d_name;

/*3. Find the employee name and date of joining who are working in Delhi.*/
select (f_name||' '||l_name)"Employee Name",date_of_joining from emp_1 e inner join department d on e.dept=d.d_name where d.d_loc='Delhi';

/*Question 4*/
create table emp_address(
emp_id int not null,
city varchar(30),
district varchar(35),
state_ varchar(20),
foreign key(emp_id) references emp_1(emp_id)
);
insert into emp_address(emp_id)
insert into emp_address(emp_id,city,district,state_)
with names as(
select 1,'Suri','Birbhum','WB' from dual union all
select 2,'Kolkata','Kolkata','WB' from dual union all
select 3,'Bhubaneswar','Khurda','Odisha' from dual union all
select 4,'Durgapur','Burdwan','WB' from dual union all
select 5,'Noida','GB Nagar','UP' from dual union all
select 6,'Secunderabad','Hyderabad','Telengana' from dual union all
select 7,'Derhadun','Derhadun','Uttarakhand' from dual union all
select 8,'Asansol','Burdwan','WB' from dual union all
select 9,'Siliguri','Darjeeling','WB' from dual union all
select 10,'Kolkata','Kolkata','WB' from dual union all
select 11,'Jalpaiguri','Jalpaiguri','WB' from dual union all
select 12,'New Delhi','New Delhi','Delhi' from dual
)select*from names;

/*5. Display the name of employees, department location and the city name the employee
belongs to, from the Employee, Department and Emp_Address tables.*/
select (f_name||' ' ||l_name)"Employee Name",d_loc,city from emp_1 e inner join department d on e.dept=d.d_name inner join emp_address ea on e.emp_id=ea.emp_id;

/*6. Find the name of each department’s manager.*/
select (f_name||' ' ||l_name)"Manager Name" from emp_1 where job_type='Manager';

/*7. Create ‘Job_Grades’ table and insert the following values:"values given in PDF in image format"*/
create table job_grades(
grade varchar(1),
lowest_sal int,
highest_sal int
);
insert into job_grades(grade,lowest_sal,highest_sal)
with names as(
select 'A',10000,24999 from dual union all
select 'B',25000, 49999 from dual union all
select 'C',50000,100000 from dual
)select*from names;

/*8. Display the employee names with their respective job grades and salary.*/
select (f_name||' ' ||l_name)"Employee Name",grade,salary from emp_1 e inner join job_grades j on e.salary>=j.lowest_sal and e.salary<=j.highest_sal order by salary desc;

/*9. Insert two rows in Employee table having ‘NULL’ values in dept field.*/
insert into emp_1 (emp_id,f_name,l_name,job_type,salary,commission,manager_id,date_of_joining) 
    with names as ( 
    select 13,'Dolly','Gupta','Salesman',8000,2000,2,to_date('02-Feb-2019','dd-mon-yyyy') from dual union all 
    select 14,'Sahrukh','Khan','Salesman',18000,2800,2,to_date('12-MAR-2009','dd-mon-yyyy') from dual
)select*from names;

/*10. Insert two rowsin Department table.*/
/*I have created a copy of the department table to keep original intact*/
create table dept_1 as select*from department
insert into dept_1(d_name,d_loc,hod_id)
with names as(
select 'Customer Support','Kol',11 from dual union all
select 'Legal','Delhi',5 from dual
)select*from names;

/*11. Perform the following joins considering Employee and Department tables.
a. Natural join*/
select*from emp_1 natural join dept_1;
/*b. Inner join*/
select*from emp_1 e inner join dept_1 d on e.dept=d.d_name;
/*c. Left outer join*/
select*from emp_1 e left outer join dept_1 d on e.dept=d.d_name;
/*d. Right outer join*/
select*from emp_1 e right outer join dept_1 d on e.dept=d.d_name;
/*e. Full outer join*/
select*from emp_1 e full outer join dept_1 d on e.dept=d.d_name;