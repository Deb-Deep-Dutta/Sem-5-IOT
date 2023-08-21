/*1. Create a table BTech_2nd with attributes E_no, Year, Sec, C_Roll, Name, DOB having E_no as primary key using constraint.*/
create table btech_2nd 
( 
    e_no int not null, 
    year int, 
    sec char, 
    c_roll smallint, 
    name varchar(60), 
    dob date, 
    primary key(e_no) 
);

desc btech_2nd

/* 2. Add the columns Mob_No, DOA (date of admission) to the 1st table.*/
alter table btech_2nd 
    add mob_no int;

alter table btech_2nd 
    add doa date;

desc btech_2nd

/*3. Create an empty table BTech_3rd from the above existing table.*/
create table btech_3rd as 
    select*from btech_2nd;

desc btech_3rd

/*4. Drop the columns Mob No, DOA (date of admission) to the 2nd table.*/
alter table btech_3rd 
    drop column mob_no;

alter table btech_3rd 
    drop column doa;

desc btech_3rd

/*5. Make C_roll and DOA as not null in the 1st table.*/
alter table btech_2nd 
modify c_roll smallint not null;

alter table btech_2nd 
modify doa date not null;

desc btech_2nd

/*6. Change the length of the Year and name attribute in the 2nd table.*/
alter table btech_3rd 
modify year smallint;

alter table btech_3rd 
modify name varchar(50);

/*To get the final output.*/
desc btech_3rd


desc btech_2nd


