/*1. The following tables are maintained by a book dealer
AUTHOR(author-id: int, name: string, city: string, country: string)
PUBLISHER(publisher-id: int name: string, city: string, country: string)
CATLOG(book-id: int, title : string, author-id: int, publisher-id: int, category: int, year:
int, price: int)
CATEGORY(category-id: int, description: string)
ORDER-DETAILS(order-no: int, book-id: int, quantity: int)
i) Create above tables by properly specifying the primary keys and the foreign keys.*/

CREATE TABLE author (
      author_id Number(10),
      author_name VARCHAR2(20),
      author_city VARCHAR2(20),
      author_country VARCHAR2(20),
      PRIMARY KEY(author_id));

CREATE TABLE publisher (
      publisher_id Number (10),
      publisher_name VARCHAR2(20),
      publisher_city VARCHAR2(20),
      publisher_country VARCHAR2(20),
      PRIMARY KEY (publisher_id));

CREATE TABLE category (
      category_id Number (10),
      description VARCHAR2(30),
      PRIMARY KEY (category_id) );

CREATE TABLE catalogue(
      book_id Number (10),
      book_title VARCHAR2(30),
      author_id Number (10),
      publisher_id Number (10),
      category_id Number (10),
      year Number (10),
      price Number (10),
      PRIMARY KEY (book_id),
      FOREIGN KEY (author_id) REFERENCES author(author_id),
      FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
      FOREIGN KEY (category_id) REFERENCES category(category_id));

CREATE TABLE orderdetails(
      order_id Number (10),
      book_id Number (10),
      quantity Number (10),
      PRIMARY KEY (order_id),
      FOREIGN KEY (book_id) REFERENCES catalogue(book_id));

/*ii) Enter atleast five tuples for each relation.*/

INSERT INTO author with names as( 
    select 1001,'JK Rowling','London','England' from dual union all
    select 1002,'Chetan Bhagat','Mumbai','India' from dual union all
	select 1003,'John McCarthy','Chicago','USA' from dual union all
	select 1004,'Dan Brown','California','USA' from dual
)select*from names;

INSERT INTO publisher with names as( 
    select 2001,'Bloomsbury','London','England' from dual union all
    select 2002,'Scholastic','Washington','USA' from dual union all
	select 2003,'Pearson','London','England' from dual union all
	select 2004,'Rupa','Delhi','India' from dual
)select*from names;

INSERT INTO category VALUES (3001,'Fiction');
INSERT INTO category VALUES (3002,'Non-Fiction');
INSERT INTO category VALUES (3003,'thriller');
INSERT INTO category VALUES (3004,'action');
INSERT INTO category VALUES (3005,'fiction') ;

INSERT INTO catalogue VALUES (4001,'HP and Goblet Of Fire',1001,2001,3001,2002,600);
INSERT INTO catalogue VALUES (4002,'HP and Order Of Phoenix',1001,2002,3001,2005,650);
INSERT INTO catalogue VALUES (4003,'Two States',1002,2004,3001,2009,65);
INSERT INTO catalogue VALUES (4004,'3 Mistakes of my life',1002,2004,3001,2007,55);
INSERT INTO catalogue VALUES (4005,'Da Vinci Code',1004,2003,3001,2004,450);
INSERT INTO catalogue VALUES (4006,'Angels and Demons',1004,2003,3001,2003,350);
INSERT INTO catalogue VALUES (4007,'Artificial Intelligence',1003,2002,3002,1970,500);

INSERT INTO orderdetails VALUES (5001,4001,5);
INSERT INTO orderdetails VALUES (5002,4002,7);
INSERT INTO orderdetails VALUES (5003,4003,15);
INSERT INTO orderdetails VALUES (5004,4004,11);
INSERT INTO orderdetails VALUES (5005,4005,9);
INSERT INTO orderdetails VALUES (5006,4006,8);
INSERT INTO orderdetails VALUES (5007,4007,2);
INSERT INTO orderdetails VALUES (5008,4004,3);

/*iii) Give the details of the authors who have 2 or more books in the catalog and the price of the books is greater than the average price of the books in the catalog and the year of publication is after 2010.*/

Select author_name, author_id from author 
Where author_id in ( 
Select author_id from catalogue where price > (
Select avg(price) from catalogue )and year >2010 group by author_id having count (*)>=2);

/*iv) Find the author of the book which has maximum sales.*/
/*This query uses a Common Table Expression (CTE) named BookSales to calculate the total sales for each author by joining the catalogue and orderdetails tables. Then, it retrieves the author's name for the author with the maximum sales.*/

WITH BookSales AS (
    SELECT
        c.author_id,
        SUM(od.quantity) AS total_sales
    FROM
        catalogue c
    JOIN orderdetails od ON c.book_id = od.book_id
    GROUP BY
        c.author_id
)
SELECT
    a.author_name AS author_of_max_sales_book
FROM
    BookSales bs
JOIN author a ON bs.author_id = a.author_id
WHERE
    bs.total_sales = (SELECT MAX(total_sales) FROM BookSales);

/*v) Demonstrate how to increase price of books published by specific publisher by 10%.*/

update catalogue 
set price = price*1.10 
where publisher_id in ( Select publisher_id from publisher 
where publisher_name = 'Pearson');

/*2. Consider the following database for BANK.
BRANCH(branch-name: string, branch-city: string, assets: real)
ACCOUNT(accno: int, branch-name: string, balance: real)
DEPOSITOR(customer-name: string, accno: int)
CUSTOMER(customer-name: string, customer-street: string, customer-city: string)
LOAN(loan-no: int, branch-name: string, amount: real)
BORROWER(customer-name: string, loan-no: int)
i) Create the above tables by properly specifying the primary keys and foreign keys.*/

CREATE TABLE branch
     ( branch_name VARCHAR(15),
       branch_city VARCHAR(15),
       assets NUMBER(10,2),
       PRIMARY KEY(branch_name)
     );

     CREATE TABLE account
     ( accno NUMBER(8),
       branch_name VARCHAR(15),
       balance NUMBER(10,2),
       PRIMARY KEY(accno),
       FOREIGN KEY(branch_name) REFERENCES branch(branch_name)ON DELETE CASCADE
     );

CREATE TABLE customer
    ( customer_name VARCHAR(15),
      customer_street VARCHAR(15),
      customer_city VARCHAR(15),
      PRIMARY KEY(customer_name)
    );

    CREATE TABLE loan
    ( loan_number Number(8),
      branch_name VARCHAR(15),
      amount NUMBER(10,2),
      PRIMARY KEY(loan_number),
      FOREIGN KEY(branch_name) REFERENCES branch(branch_name)ON DELETE CASCADE
    );

    CREATE TABLE depositor
    ( customer_name VARCHAR(15),
      accno Number(8),
      PRIMARY KEY(customer_name, accno),
      FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
      FOREIGN KEY(accno) REFERENCES account(accno)
    );

    CREATE TABLE borrower
    ( customer_name  VARCHAR(15),
      loan_number Number(8),
      PRIMARY KEY(customer_name, loan_number),
      FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
      FOREIGN KEY(loan_number) REFERENCES loan(loan_number)
    );

/*ii) Enter atleast five tuples for each relation.*/

insert into branch values('Main','c1',10000);
insert into branch values('b2','c2',20000);
insert into branch values('b3','c3',30000);
insert into branch values('b4','c4',40000);
insert into branch values('b5','c5',50000);

INSERT INTO account VALUES(12,'Main',3000);
INSERT INTO account VALUES(22,'b2',4000);
INSERT INTO account VALUES(32,'b3',5000);
INSERT INTO account VALUES(42,'b4',6000);
INSERT INTO account VALUES(52,'Main',7000);
INSERT INTO account VALUES(62,'b5',7000);

INSERT INTO customer VALUES('cust1','cstreet1','c1');
INSERT INTO customer VALUES('cust2','cstreet2','c2');
INSERT INTO customer VALUES('cust3','cstreet3','c3');
INSERT INTO customer VALUES('cust4','cstreet4','c4');
INSERT INTO customer VALUES('cust5','cstreet5','c5');

INSERT INTO depositor VALUES('cust1',12);
INSERT INTO depositor VALUES('cust2',22);
INSERT INTO depositor VALUES('cust3',32);
INSERT INTO depositor VALUES('cust4',42);
INSERT INTO depositor VALUES('cust1',52);
INSERT INTO depositor VALUES('cust5',62);

INSERT INTO loan VALUES(10,'Main',10000);
INSERT INTO loan VALUES(20,'b2',20000);
INSERT INTO loan VALUES(30,'b3',30000);
INSERT INTO loan VALUES(40,'b4',40000);
INSERT INTO loan VALUES(50,'b5',50000);

INSERT INTO borrower VALUES('cust1',10);
INSERT INTO borrower VALUES('cust2',20);
INSERT INTO borrower VALUES('cust3',30);
INSERT INTO borrower VALUES('cust4',40);
INSERT INTO borrower VALUES('cust5',50);

/*iii) Find all the customers who have atleast two accounts at the main branch.*/

Select customer_name from Depositor 
Where accno in (Select accno from Account where branch_name = 'Main' )
Group by accno,customer_name having count(accno)>=2 ;

/*iv) Find all customer who have an account at all the branches located in a specific city.*/

SELECT d.customer_name
FROM account a,branch b,depositor d
WHERE b.branch_name=a.branch_name AND
a.accno=d.accno AND b.branch_city='c3' GROUP BY d.customer_name
HAVING COUNT(distinct b.branch_name)=(SELECT COUNT(branch_name) FROM branch WHERE branch_city='c3');

/*v) Demonstrate how to delete all account tuples at every branch located in specific city.*/

DELETE FROM account WHERE branch_name IN (SELECT branch_name FROM branch WHERE branch_city = 'c4');

/*3. Consider the following database for ORDER PROCESSING.
CUSTOMER(cust-no: int, cname: string, city: string)
ORDER(orderno: int, odate: date, ord-amt: real)
ORDER_ITEM(orderno: int, itemno:int, qty: int)
ITEM(itemno: int, unitprice: real)
SHIPMENT(orderno: int, warehouseno: int, ship-date: date)
WAREHOUSE(warehouseno: int, city: string)
i) Create the above tables by properly specifying the primary keys and the foreign keys*/

CREATE TABLE CUST
(
CUST_no NUMBER(5),
CNAME VARCHAR2(15) NOT NULL,
CITY VARCHAR2(15),
PRIMARY KEY(Cust_no)
);

CREATE TABLE CUSTORDER
(
ORDER_no NUMBER(5) CONSTRAINT PK1 PRIMARY KEY,
ODATE DATE,
CUST_no NUMBER(5) REFERENCES CUST(CUST_no),
ORD_AMT NUMBER(5)
);

CREATE TABLE ITEM
(
ITEM NUMBER(5) CONSTRAINT PK2 PRIMARY KEY,
UNITPRICE NUMBER(9,2) NOT NULL
);

CREATE TABLE ORDER_ITEM
(
ORDER_no NUMBER (5),
ITEM NUMBER (5),
QTY NUMBER(4),
FOREIGN KEY(ORDER_no) REFERENCES CUSTORDER(ORDER_no),
FOREIGN KEY(ITEM) REFERENCES ITEM(ITEM),
PRIMARY KEY(ORDER_no,ITEM)
);

CREATE TABLE WAREHOUSE
(
WAREHOUSE_no NUMBER(5),
CITY VARCHAR2(15),
PRIMARY KEY(WAREHOUSE_no )
);

CREATE TABLE SHIPMENT
(
ORDER_no NUMBER(5),
WAREHOUSE_no NUMBER(5),
SHIP_DATE DATE,
FOREIGN KEY(ORDER_no) REFERENCES CUSTORDER(ORDER_no),
FOREIGN KEY(WAREHOUSE_no) REFERENCES
WAREHOUSE(WAREHOUSE_no) ,
PRIMARY KEY(ORDER_no,WAREHOUSE_no)
);

/*ii) Enter atleast five tuples for each relation.*/

insert into cust values(1,'ABC','BLORE');
insert into cust values(2,'DEF', 'KOLAR');
insert into cust values(3, 'GHI', 'BLORE');
insert into cust values(4, 'JKL','CHITTOR');
insert into cust values(5,'MNO', 'MYSORE');

insert into CUSTORDER values(1, '01-JAN-06', 2, '5000.5');
insert into CUSTORDER values(2, '26-APR-06', 3, 2500);
insert into CUSTORDER values(3, '27-APR-06', 3, 1000);
insert into CUSTORDER values(4, '30-APR-06', 5, 1000);
insert into CUSTORDER values(5, '25-MAY-06', 1, 5000);
insert into CUSTORDER values(6, '01-JUL-06', 2, 6000);

insert into ITEM values(1, 2500);
insert into ITEM values(2, 5000);
insert into ITEM values(3, 1000);
insert into ITEM values(4, 5);
insert into ITEM values(5, 200);

insert into ORDER_ITEM values(1, 2, 1);
insert into ORDER_ITEM values(1, 4, 1);
insert into ORDER_ITEM values(2, 1, 1);
insert into ORDER_ITEM values(3, 5, 5);
insert into ORDER_ITEM values(4, 2, 2);

insert into WAREHOUSE values(1, 'BLORE');
insert into WAREHOUSE values(2, 'KOLAR');
insert into WAREHOUSE values(3, 'CHITTOR');
insert into WAREHOUSE values(4, 'MLORE');
insert into WAREHOUSE values(5, 'MYSORE');

insert into SHIPMENT values(1, 1, '30-APR-06');
insert into SHIPMENT values(2, 2, '29-APR-06');
insert into SHIPMENT values(3, 2, '24-APR-06');
insert into SHIPMENT values(4, 5, '30-APR-06');
insert into SHIPMENT values(5, 3, '01-JUN-06');
insert into SHIPMENT values(6, 1, '01-JUN-06');

/*iii) List the order number and ship date for all orders shipped from particular warehouse*/

SELECT ORDER_no,ship_date
 FROM WAREHOUSE W, SHIPMENT s WHERE W.WAREHOUSE_no=S.WAREHOUSE_no AND CITY='BLORE';

 /*iv) Produce a listing: customer name, no of orders, average order amount*/

 Select c.cname, sum(o.orderID), avg(co.ord_amt)
From cust c, custorder co
Join order_item o
On o.order_no = co.order_no and c.cust_no = co.cust_no;

/*v) List the orders that were not shipped within 30 days of ordering.*/

select order_no from order_item join custorder on order_item.cust_no=custorder.cust_no join shipment on custorder.order_no=shipment.order_no where MONTHS_BETWEEN(shipment.ship_date,custorder.odate)>1;