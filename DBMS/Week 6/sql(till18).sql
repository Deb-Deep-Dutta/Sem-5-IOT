/*1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case alias
as WORKER_FIRSTNAME.*/
select upper(first_name)"WORKER_FIRSTMANE" from worker;

/*2. Write An SQL Query To Print The First Three Characters Of FIRST_NAME From
Worker Table.*/
select substr(first_name, 1, 3) from worker;

/*3. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name
Column ‘Amitabh’ From Worker Table.*/
select instr(first_name,'A') from worker where first_name='Amitabh';

/*4. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker
Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.*/
select (first_name||' '||last_name)"Complete_Name" from worker;

/*5. Write An SQL Query To Print All Worker Details From The Worker Table Order By
FIRST_NAME Ascending And DEPARTMENT Descending.*/
select*from worker order by first_name asc,department desc;

/*6. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains
‘A’.*/
select*from worker where first_name like '%a%';

/*7. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With
‘A’.*/
select*from worker where first_name like '%a';

/*8. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between
100000 And 500000.*/
select*from worker where salary between 100000 and 500000;

/*9. Write An SQL Query To Fetch The Count Of Employees Working In The Department
‘Admin’.*/
select count(department) from worker where department='Admin';

/*10. Write An SQL Query To Fetch The No. Of Workers For Each Department In The
Descending Order.*/
select count(worker_id)"No_Workers" from worker group by department order by "No_Workers" asc;

/*11. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.*/
select*from worker w inner join title t on w.worker_id=t.worker_ref_id where t.worker_title='Manager';

/*12. Write An SQL Query To Show Only Odd Rows From A Table.*/
select*from worker where mod(worker_id,2)!=0;

/*13. Write An SQL Query To Show Records From One Table That Another Table Does Not
Have.*/
select*from worker w left outer join title t on w.worker_id=t.worker_ref_id;

/*14. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.*/
select*from worker fetch first 10 rows only;

/*15. Write An SQL Query To Fetch The List Of Employees With The Same Salary*/
select distinct(w.worker_id),w.first_name,w.salary from worker w, worker w1 where w.salary=w1.salary and w.worker_id != w1.worker_id;

/*16. Write An SQL Query To Show All Departments Along With The Number Of People
Working There.*/
select count(worker_id),department from worker group by department;

/*17. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In
Each Department.*/
/*I have first created a copy of the table workers*/
create table tempnew as select*from worker;

select t.department, t.first_name, t.salary from(select max(salary) as TotalSalary, department from worker group by department) tempnew inner join worker t on tempnew.department= t.department and tempnew.TotalSalary = t.salary;

/*18. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For
Each Of Them.
*/
select sum(salary),department from worker group by department;

/**/