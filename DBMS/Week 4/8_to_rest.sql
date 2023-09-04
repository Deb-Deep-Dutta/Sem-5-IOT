/*create a copy of both the tables to keep the original intact*/
create table emp_1 as select*from employee;
create table dept_1 as select*from department;

/*8. Show the employee details with a revised salary. The salary is incremented in the following
way:
a. 10% for sales department
b. 20% for marketing department
c. No increment for others*/
update emp_1
set salary=case
when dept='Sales' then salary*1.1
when dept='Marketing' then salary*1.2
else salary*1
end;

/*9. Determine the tax for each employee in production department based on the monthly salary.
The tax rate are as per the following data:
Monthly Salary   Range Rate
0 – 19,999           0%
20,000 – 39,999      9%
40,000 – 59,999     20%
60,000 – 79,999     30%
80,000 or more      45%*/
alter table emp_1
add rate int;
update emp_1 set rate=case
    when salary between 0 and 19000 then 0
    when salary between 20000 and 39000 then salary*0.09
    when salary between 40000 and 59000 then salary*0.2
    when salary between 60000 and 79000 then salary*0.3
    when salary>=80000 then salary*0.45
    else salary*1
end

/*10. Find the Cartesian product between Employee and Department table.*/
select *from emp_1 cross join dept_1;

/*11. Show the employee names and the respective department location.*/
select (f_name||' '||l_name)"Employee Name", d_loc from emp_1 e cross join dept_1 d where e.dept=d.d_name;

/*12. Give an example of the following joins considering employee and department tables.
k. Natural join*/
select*from emp_1 natural join dept_1;
/*l. Inner join*/
select*from emp_1 e inner join dept_1 d on e.dept=d.d_name;
/*m. Left outer join*/
select*from emp_1 e left outer join dept_1 d on e.dept=d.d_name;
/*n. Right outer join*/
select*from emp_1 e right outer join dept_1 d on e.dept=d.d_name;
/*o. Full outer join*/
select*from emp_1 e full outer join dept_1 d on e.dept=d.d_name;

/*Question 13*/
/*First need to create the tables and insert all the values*/
create table locations(
    location_id int,
    street_address varchar(60),
    postal_code varchar(15),
    city varchar(25),
    state_province varchar(30),
    country_id varchar(5) not null
);
create table countries(
    country_id varchar(5) not null,
    country_name varchar(25),
    region_id int
);
insert into locations(location_id,street_address,postal_code,city,state_province,country_id)
with names as(
    select 1000,'1297 Via Cola di Rie','989','Rome','','IT' from dual union all
    select 1100,'93091 Calle della Te','10034','Venice','','IT' from dual union all
    select 1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP' from dual union all
    select 1300,'0450 Kamiya-cho','6823','Hiroshima','','JP' from dual union all
    select 1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US' from dual union all
    select 1500,'2011 Interiors Blvd','99236','South San','California','US' from dual union all
    select 1600,'2007 Zegora St','50090','South Brun','New Jersey','US' from dual union all
    select 1700,'2004 Charade Rd','98199','Seattle','Washington','US' from dual union all
    select 1800,'147 Spadina Ave','MSV 2L7','Toronto','Ontarion','CA' from dual
)
select*from names;
insert into countries(country_id,country_name,region_id)
with names as(
    select 'AR','Argentina',2 from dual union all
    select 'AU','Australia',3 from dual union all
    select 'BE','Belgium',1 from dual union all
    select 'BR','Brazil',2 from dual union all
    select 'CA','Canada',2 from dual union all
    select 'CH','Switzerland',1 from dual union all
    select 'CN','China',3 from dual union all
    select 'DE','Germany',1 from dual
)
select*from names;
select location_id, street_address,city,state_province,country_name from locations natural join countries;

/*Question 14*/
select (f_name||' '||l_name)"Employee Name", dept, d_loc from emp_1 e natural join dept_1 d where e.dept=d.d_name;