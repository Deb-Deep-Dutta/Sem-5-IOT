--1. Show the use of upper and lower function.
select upper('hello world'), lower('HOW ARE YOU') from dual

--2. Show the use of concat, instr and length function
select concat('Hello ','World') as "Concatenated String" from dual;
select instr('Hello World','o') as "First Occurance" from dual;
select length('Hello World') as "Length of String" from dual;

/*3. Show the use of the following functions on numeric values:
a. Sqrt()
b. Power()
c. Ceil()
d. Substr()
e. Max()
f. min()
g. Round()
h. avg()
i. count()
j. Exp()
k. mod()*/
select sqrt(65) as "Square Root" from dual;
select power(5,3) as "Power" from dual;
select ceil(5.203) as "Ceiling" from dual;
select substr('Hello World',-2,3) as "Sub String" from dual;
select round(23.321654981421684,3) as "Round to" from dual;
select count(*) as "Count" from dual;
select exp(6) as "Exponent" from dual;
select mod(645131541168412,132564) as "Remainder" from dual;

/*4. Solve the following queries
a. Find the ceiling and floor value of 14.887.
b. Find out the round-off 17.49989.
c. Calculate 8^7.*/
select ceil(14.887) as "Ceiling", floor(14.887) as "Floor", round(17.49989) as "Round", power(8,7) as "Power" from dual;

--5. Show the current date
select to_char(current_date,'dd-mm-yyyy') as "Current Date" from dual;
--or select current_date as "Current Date" from dual;

--6. Find the total experience of the employees in weeks who works in Sales department
select emp_id, f_name, l_name, round((to_date(sysdate,'dd-mon-yyyy')-to_date(date_of_joining,'dd-mon-yyyy'))/7) as "Experience in Weeks" from employee where dept='Sales' order by emp_id;

/*7. Display the use of the following functions on date
a. Months_between*/
select months_between(to_date(sysdate,'dd-mm-yyyy'),to_date('20-04-2003','dd-mm-yyyy')) as "Month Difference" from dual;

--b. Add_months
select add_months(sysdate,3) as "Months" from dual;

--c. Next_day
select next_day(sysdate,4) as "Day" from dual;

--d. Last_day
select last_day(sysdate) as "Last" from dual;

--e. Round
select round(sysdate) as "Rounded" from dual;

--f. Trunc
select trunc(systimestamp,'y') as "Truncated" from dual;

--g. To_char*/
select to_char(systimestamp,'DD-MON-YYYY HH24:MI:SS TZH:TZM') as "Formatted Date" from dual;