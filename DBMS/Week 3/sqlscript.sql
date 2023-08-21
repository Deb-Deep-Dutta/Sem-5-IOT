/*1. Show f_name, l_name and job_type from employees.*/
select f_name, l_name, job_type from employee;

/*2. Show employee details in the following fashion:
Employee details
Arun is a manager*/
select (f_name||' is a '||job_type) as "Employee Details" from employee;

/*3. Show the monthly salary details in the following fashion
Monthly Salary Details
Arun’s monthly salary is Rs. 90000*/
select (f_name||q'['s]'||' monthly salary is Rs. '||salary) as "Monthly Salary Details" from employee;

/*4.Show the different department names from department table.*/

select d_name from department;

/*5. Show the employee names who works in ‘Sales’*/
select (f_name||' '||l_name) as "Working in Sales" from employee where dept='Sales';

/*6. Show the employee names who gets salary of more than 50000 per month*/
select (f_name||' '||l_name) as "Salary more than 50000" from employee where salary>50000;

/*7. Show the details of the employee whose manager id is not 1*/
select*from employee where manager_id!=1;

/*8. Show the employee details whose salary ranges between 40000 and 70000*/
select*from employee where salary>=40000 and salary<=70000;

/*9. Show the details of the employees who works under the manager having id 1, 6 and 8*/
select*from employee where manager_id=1 or manager_id=6 or manager_id=8;

/*10. Select the f_name and salary of those employees whose last name starts with ‘K’*/
select f_name, salary from employee where l_name like'K%';

/*11. Select the f_name and salary of those employees whose last name starts with ‘K’ and ends with ‘R’*/
select f_name, salary from employee where l_name like'K%r';

/*12. Show the details of those employees where 3rd letter of l_name is ‘o’*/
select*from employee where l_name like'__o%';

/*13. Select the details of those employees who works as an engineer with monthly salary more than 50000*/
select*from employee where job_type='Engineer' and salary>50000 order by emp_id asc;

/*14. Select the employees whose department is ‘Production’ or monthly salary is more than 60000 per month.*/
select*from employee where dept='Production' or salary>60000 order by emp_id asc;

/*15. Find the minimum salary, maximum salary, total salary, average salary of the employees who work in ‘Sales’ department*/
select min(salary), max(salary), sum(salary), avg(salary) from employee where dept='Sales';

/*16. Find the employee l_name that is first and f_name that is last if they are arranged in an order*/
select f_name, l_name from employee where exists(select l_name from employee order by l_name asc fetch first 1 rows only) order by f_name desc fetch first 1 rows only;

/*17. Find the number of employees working in each department*/
select dept,count(emp_id) from employee group by dept;

/*18. Find the number of departments from employee table*/
select dept from employee where 1=1 group by dept;

/*19. Find the average commission of the employees.*/
select avg(commission) from employee;

/*20. Find the average salaries of the employees department wise*/
select dept, avg(salary) from employee group by dept;

/*21. Find the sum of salary of different job_type according to different departments*/
select sum(salary), job_type from employee where 1=1 group by job_type;

/*22. Find the department name and average salaries of those departments whose average salary is greater than 40000*/
select dept, avg(salary) from employee group by dept having avg(salary)>40000;

/*23. Find the department name and maximum salaries of those departments whose maximum salary is greater than 55000*/
select dept, max(salary) from employee group by dept having max(salary)>55000;

/*24. Display the job_type and total monthly salary for each job_type where total payroll is exceeding 100000*/
select job_type, sum(salary) from employee group by job_type having sum(salary)>100000;

/*25. Display the name of the department having maximum average salary*/
select dept,avg(salary) from employee group by dept order by avg(salary) desc fetch first 1 rows only;
