CREATE TABLE my_companies
(
company_id int,
company_name varchar(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;
CREATE TABLE orders
(
order_id int,
company_id int,
order_date date
);
INSERT INTO orders VALUES(11, 101, '17-Apr-2020');
INSERT INTO orders VALUES(22, 102, '18-Apr-2020');
INSERT INTO orders VALUES(33, 103, '19-Apr-2020');
INSERT INTO orders VALUES(44, 104, '20-Apr-2020');
INSERT INTO orders VALUES(55, 105, '21-Apr-2020');
SELECT * FROM orders;

CREATE TABLE workers
(
id int,
name varchar(50),
state varchar(50),
salary int,
company varchar(20)
);
DROP table workers;

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

--UNION ALL: DOES THE SAME WITH UNION ,JUST IT RETURNS REPEATED RECORD IF THERE IS

--FIND THE STATE WHOSE SALARY IS GREATER THAN 300,EMPLOYEE NAMES WHOSE SALARY LESS THAN 200 WITH DUPLICATION

SELECT state AS "State or Employee Name",salary
FROm workers
WHERE salary>3000

UNION ALL

SELECT name AS "State or Employee Name",salary
FROM workers 
WHERE salary <2000;

--INTERSECT (operator : 1) Returns the common records of 2 queries 2 )it reeturns unique data

--find all common employee names whose salary is greater than 2000 and the company name is IBM,APPLE or MICROSOFT
SELECT name
FROM workers
WHERE salary >2000
INTERSECT
SELECT name
FROM workers
WHERE company IN('IBM', 'APPLE', 'MICROSOFT');

--MINUS Operator: it returns the uncommon data from query1 and from query2

--find the employee names whose salary is less than 3000 and not working in Google
SELECT name
FROM workers
WHERE salary  <3000

EXCEPT

SELECT name
FROM workers
WHERE company= 'GOOGLE';


--JOINS  1)INNER JOIN :returns the common data
--       2)LEFT JOIN :returns the data from the first table
--       3)RIGHT JOIN: returns the data from second table 
--       4)FULL JOIN:returns the data from both tables
--       5)SELF JOIN : you will have a single table but you will use it as if 2 tables.

--INNER JOIN
--select company name, order id, order date for common companies

SELECT mc.company_name,o.order_id,o.order_date
FROM my_companies mc INNER JOIN orders o
ON o.company_id=mc.company_id;


--LEFT JOIN
--get the order id and order date for the companies in my companies
SELECT o.order_id,o.order_date
FROM my_companies mc LEFT JOIN orders o
ON o.company_id=mc.company_id;


--RIGHT JOIN
--get order id and order date for the companies orders table

SELECT mc.company_name,o.order_id,o.order_date
FROM my_companies mc RIGHT JOIN orders o
ON o.company_id=mc.company_id;


--FULL JOIN
--get order id and order date for every company
SELECT mc.company_name,o.order_id,o.order_date
FROM my_companies mc FULL JOIN orders o
ON o.company_id=mc.company_id;

--SELF JOIN

--

CREATE TABLE worker
(
id int,
name varchar(20),
title varchar(60),
manager_id int
);
INSERT INTO worker VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO worker VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO worker VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO worker VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM worker;

--create a table which displays the manager of employees
SELECT w1.name AS "Employee Name",w2.name  as "Manager Name"
From worker w1 INNER JOIN worker w2
ON w1.manager_id=w2.id;