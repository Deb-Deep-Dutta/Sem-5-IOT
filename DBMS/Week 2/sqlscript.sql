/*16. Insert the following rows in the employee table:*/
insert into employee (emp_id,f_name,l_name,job_type,salary,dept,date_of_joining) 
    with names as ( 
    select 1, 'Arun','Khan','Manager',90000,'Production',to_date('04-Jan-1998','dd-mon-yyyy') from dual union all 
    select 2, 'Barun','Kumar','Manager',80000,'Marketing',to_date('09-Feb-1998','dd-mon-yyyy') from dual union all 
    select 6, 'Floki','Dutt','Accounts',70000,'Accounts',to_date('16-Jul-2000','dd-mon-yyyy') from dual union all 
    select 8, 'Saul','Good','Engineer',60000,'R & D',to_date('06-Sep-2014','dd-mon-yyyy') from dual 
    ) 
select*from names;

insert into employee (emp_id,f_name,l_name,job_type,salary,dept,manager_id,date_of_joining) 
    with names as ( 
    select 3, 'Chitra','Kapoor','Engineer',60000,'Production',1,to_date('08-Jan-1998','dd-mon-yyyy') from dual union all 
    select 4, 'Dheeraj','Mishra','Manager',75000,'Sales',4,to_date('27-Dec-2001','dd-mon-yyyy') from dual union all 
    select 5, 'Emma','Dutt','Engineer',55000,'Production',1,to_date('20-Mar-2002','dd-mon-yyyy') from dual union all 
    select 7, 'Dheeraj','Kumar','Clerk',40000,'Accounts',6,to_date('01-Jul-2016','dd-mon-yyyy') from dual union all 
    select 9, 'Mou','Bhat','Clerk',30000,'Sales',4,to_date('08-Mar-2018','dd-mon-yyyy') from dual union all 
    select 11, 'Bobby','Deol','Engineer',35000,'R & D',8,to_date('17-Oct-2017','dd-mon-yyyy') from dual 
    ) 
select*from names;

insert into employee (emp_id,f_name,l_name,job_type,salary,commission,dept,manager_id,date_of_joining) 
with names as( 
    select 10, 'Sunny','Deol','Salesman',20000,10000,'Marketing',2,to_date('31-Mar-2001','dd-mon-yyyy') from dual union all 
    select 12, 'Amir','Khan','Salesman',15000,5000,'Marketing',2,to_date('11-Jan-2013','dd-mon-yyyy') from dual 
) 
select*from names;

/*17. Show the values of departmental table.*/
select*from department;

/*18. Select the department names and their locations.*/
select d_name , d_loc from department;

/*19. Show the employees f_name , l_name , salary and the salary after 1000rs. Bonus.*/
select f_name, l_name, salary, salary+1000 from employee;

/*20. Show the employees annual salary with a 1000rs. Yearly bonus and the annual salary with a 100rs. Monthly bonus.*/
select salary+1000, salary+(100*12) from employee;

/*21. Show f_name as NAME and annual salary as ANNSAL from the employee table*/
select f_name as NAME, salary as ANNSAL from employee;

/*22. Show the l_name as LasT AND 100rs. Incremented salary as NewSal*/
update employee 
set salary=(salary+100);
select l_name as LasT, salary as NewSal from employee;

/*23. Show the emp_id, f_name, l_name, job_type of the employee getting highest salary.*/
SELECT emp_id, f_name, l_name, job_type 
FROM employee 
where salary in 
( 
    select max(salary) 
    from employee 
    group by emp_id 
) 
order by salary desc 
    fetch first 1 rows only;

/*24. Show the emp_id, f_name, l_name, job_type of the employee getting minimum salary.*/
SELECT emp_id, f_name, l_name, job_type 
FROM employee 
where salary in 
( 
    select min(salary) 
    from employee 
    group by emp_id 
) 
order by salary asc 
    fetch first 1 rows only;

/*25. Show the average salary of employees in the employee table.*/
select avg(salary) from employee;

