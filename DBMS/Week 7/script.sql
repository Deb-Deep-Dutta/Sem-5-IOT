/*Q1*/
/*Need to have the previous tables : employee, department*/

create table job_history
(
    emp_id number(10),
    start_date date,
    end_date date,
    job_type varchar(20),
    d_name varchar(20)
);
insert into job_history
with names as(
    select 1, '04-Jun-1998', '30-Jun-2001', 'Engineer', 'Production' from dual union all
	select 2, '09-Feb-1998', '28-Feb-2002', 'Salesman', 'Sales' from dual union all
	select 1, '01-Jul-2001', '31-Dec-2010', 'Manager', 'R&D' from dual union all
	select 4, '27-Dec-2001', '19-Dec-2016', 'Sales_Executive', 'Marketing' from dual union all
	select 2, '01-Mar-2002', '30-Mar-2015', 'Sales_Executive', 'Marketing' from dual union all
	select 2, '01-Apr-2016', '15-Dec-2017', 'Manager', 'Sales' from dual union all
	select 4, '20-Sep-2016', '16-Dec-2017', 'Asst. Manager', 'Sales' from dual union all
	select 6, '16-Jul-2000', '30-Nov-2006', 'Clerk', 'Accounts' from dual union all
	select 5, '20-Mar-2002', '12-Aug-2011', 'Engineer', 'R&D' from dual union all
	select 1, '01-Jan-2011', '31-Jan-2012', 'Engineer', 'Production' from dual
)select*from names;

/*2. Display the previous and current job_types of all the employees.*/

select employee.f_name, employee.job_type as "PrevJob", job_history.job_type as "CurrJob" from employee join job_history on employee.emp_id = job_history.emp_id;

/*3. Display the previous and current department and job_types of all the employees.*/

select employee.f_name, employee.dept as "prevdept", job_history.d_name as "currdept", job_history.job_type from employee
join job_history on employee.emp_id = job_history.emp_id;

/*4. Display the employee id and job_types of the employees who currently have a job title that they held previously.*/
select employee.emp_id, job_history.job_type from employee
join job_history on employee.emp_id = job_history.emp_id
where employee.job_type = job_history.job_type;

/*5. Find the name of those employees who have not changed their jobs once.*/
select employee.f_name || ' ' || employee.l_name as nameofemployee
from employee
join job_history on employee.emp_id = job_history.emp_id
where employee.job_type = job_history.job_type;

/*6. Find the names of the employees who earn more than Chitra.*/
select f_name || ' ' || l_name as nameofemployee
from employee
where salary > (select salary from employee where f_name = 'Chitra');

/*7. Find the details of those employees who have the same job_type as of emp_id 7.*/
select * from employee
where job_type = (select job_type from employee where emp_id = 7);

/*8. Find the details of the employees whose job_type is same as that of emp_id 3 and whose salary is greater than that of emp_id 7.*/
select * from employee
where job_type = (select job_type from employee where emp_id = 3) and salary > (select salary from employee where emp_id = 7);

/*9. Display l_name, job_type and the salary of the employees whose salary is equal to the minimum salary.*/
select l_name, job_type, salary from employee
where salary = (select min(salary) from employee);

/*10. Find the job_type with lowest average salary.*/
select job_type, avg(salary) as average_salary
from employee
group by job_type
having avg(salary) = (select min(avg(salary)) from employee group by job_type);

/*11. Display all the departments that have a minimum salary greater than that of ‘Sales’ department.*/
select dept from employee group by dept
having min(salary) > (select min(salary) from employee where dept = 'Sales');

/*12. Find the employees who earn the same salary for each department.*/
select d_name
from department
where (select min(salary) from employee where job_type = 'Sales') < all
      (select min(salary) from employee where job_type = department.d_name)
group by d_name;

/*13. Display the employees who are not engineers and whose salary is less than that of any engineer.*/
select f_name || ' ' || l_name as nameofemployee
from employee
where job_type != 'Engineer' and salary < (select min(salary) from employee where job_type = 'Engineer');

/*14. Display the employees whose salary is less than the salary of all employees with a job_type ‘Clerk’ and whose job_type is not ‘Clerk’.*/
select f_name || ' ' || l_name as nameofemployee
from employee
where salary < (select min(salary) from employee where job_type = 'Clerk') and job_type != 'Clerk';

/*15. Consider the following database of students enrollment in courses and books adopted
for each course.
STUDENT(regno: string, name: string, major: strong, bdate: date)
COURSE(course-no: int cname: string, dept: string)
ENROLL(reg-no: string, course-no: int, sem: int, marks: int)
BOOK-ADOPTION(course-no: int, sem: int, book-isbn: int)
TEXT(book-isbn: int, book-title: string, publisher: string, author: string)
i) Create the above tables by properly specifying the primary keys and the foreign keys*/

create table student (
    regno VARCHAR2(25),
    name VARCHAR2(25),
    major VARCHAR2(25),
    bdate DATE
);

create table course (
    course_no NUMBER(25),
    cname VARCHAR2(25),
    dept VARCHAR2(25)
);

create table enroll (
    reg_no VARCHAR2(25),
    course_no NUMBER(25),
    sem NUMBER(25),
    marks NUMBER(25)
);

create table book_adoption (
    course_no NUMBER(25),
    sem NUMBER(25),
    book_isbn NUMBER(25)
);

create table text (
    book_isbn NUMBER(25),
    book_title VARCHAR2(25),
    publisher VARCHAR2(60),
    author VARCHAR2(25)
);

/*ii) Enter atleast five tuples for each relation.*/
insert into student (regno, name, major, bdate)
with names as(
    select '10000', 'Paul', 'UG', TO_DATE('2023-07-24', 'YYYY-MM-DD') from dual union all
	select '10001', 'Deol', 'PG', TO_DATE('2023-06-28', 'YYYY-MM-DD')from dual union all
	select '10002', 'Adin', 'UG', TO_DATE('2023-06-09', 'YYYY-MM-DD')from dual union all
	select '10003', 'Andrew', 'PG', TO_DATE('2023-08-07', 'YYYY-MM-DD')from dual union all
	select '10004', 'Devin', 'UG', TO_DATE('2023-09-28', 'YYYY-MM-DD')from dual
)select*from names;

INSERT INTO course (course_no, cname, dept)
with names as 
    (select 501, 'BTech', 'CSE' from dual union all
    select 402, 'BTech', 'CSE(IOT)' from dual union all
	select 603, 'BTech', 'ME' from dual union all
	select 805, 'BTech', 'ECE' from dual union all
	select 107, 'BTech', 'CSIT' from dual
)select*from names;

insert into enroll (reg_no, course_no, sem, marks)
with names as 
    (
    select 'ABC', 501, 2, 85 from dual union all
    select 'DEF', 402, 4, 67 from dual union all
	select 'GHI', 603, 5, 98 from dual union all
	select 'JKL', 805, 1, 56 from dual union all
	select 'MNO', 107, 6, 66 from dual
)select*from names;

insert into book_adoption (course_no, sem, book_isbn)
with names as (
    select 501, 2, 2501 from dual union all
    select 402, 4, 2521 from dual union all
	select 603, 5, 2551 from dual union all
	select 805, 1, 2351 from dual union all
	select 107, 6, 2751 from dual
)select*from names;

insert into text (book_isbn, book_title, publisher, author)
with names as (
    select 2501, 'The Android Odyssey', 'R. A. Townsend Co', 'Paula' from dual union all
    select 2551, 'The Sorcerer Apprentice', 'Florida Sports Magazine', 'Kenway'from dual union all
	select 2751, 'Unraveled Mysteries', 'Com Media Llc', 'Randy'from dual union all
	select 2753, 'Secrets Unveiled', 'Hidden Knowledge Publications', 'Samuel'from dual union all
	select 2521, 'The Unseen Threat', 'Great Woods Family', 'Edward'from dual
)select*from names;

/*iii) Demonstrate how you add a new text book to the database and make this book be adopted by some department.*/
insert into text (book_isbn, book_title, publisher, author) values (2754, 'Exploring Mysteries', 'Knowledge World', 'Sophia');

insert into book_adoption (course_no, sem, book_isbn) values (501, 2, 2754);

/*iv) Produce a list of text books (include Course-no, book-isbn, book-title) in the alphabetical order for courses offered by the ‘Compute Science’ department that use more than two books.*/
INSERT INTO course (course_no, cname, dept)
VALUES (401, 'Computer Networks', 'CSE(IOT)');

INSERT INTO course (course_no, cname, dept)
VALUES (402, 'Internet of Things', 'CSE(IOT)');

INSERT INTO book_adoption (course_no, sem, book_isbn)
VALUES (401, 1, 2751);

INSERT INTO book_adoption (course_no, sem, book_isbn)
VALUES (401, 1, 2752);

INSERT INTO book_adoption (course_no, sem, book_isbn)
VALUES (401, 1, 2753);

INSERT INTO book_adoption (course_no, sem, book_isbn)
VALUES (402, 2, 2752);

INSERT INTO book_adoption (course_no, sem, book_isbn)
VALUES (402, 2, 2753);

INSERT INTO text (book_isbn, book_title, publisher, author)
VALUES (2751, 'Unraveled Mysteries', 'Com Media Llc', 'Randy');

SELECT ba.course_no, ba.book_isbn, t.book_title
FROM book_adoption ba
JOIN text t ON ba.book_isbn = t.book_isbn
JOIN course c ON ba.course_no = c.course_no
WHERE c.dept = 'CSE(IOT)' or c.dept='CSE'
GROUP BY ba.course_no, ba.book_isbn, t.book_title
HAVING COUNT(*) > 2
ORDER BY t.book_title;
/*v) List any department that has all its adopted books published by a specific publisher.*/
INSERT INTO COURSE (course_no, cname, dept)
VALUES (701, 'Data Science', 'Computer Science');

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (701, 1, 2752);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (701, 1, 2753);

SELECT BA.course_no, C.dept
FROM BOOK_ADOPTION BA
JOIN TEXT T ON BA.book_isbn = T.book_isbn
JOIN COURSE C ON BA.course_no = C.course_no
WHERE T.publisher = 'Wonderful Press'
GROUP BY BA.course_no, C.dept
HAVING COUNT(*) = (SELECT COUNT(*) FROM BOOK_ADOPTION WHERE course_no = BA.course_no);
