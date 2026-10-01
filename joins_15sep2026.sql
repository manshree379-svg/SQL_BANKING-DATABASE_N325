use n325_db;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE if not exists customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers
VALUES
(101,'Amit','Nagpur'),
(102,'Priya','Pune'),
(103,'Rahul','Mumbai'),
(104,'Sneha','Delhi'),
(105,'Vikas','Nashik');


CREATE TABLE IF NOT EXISTS orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);
    
INSERT INTO orders
VALUES
(1,101,'Laptop',55000),(2,102,'Mobile',25000),(3,101,'Mouse',1500),(4,103,'Keyboard',3000),
(5,102,'Monitor',12000),(6,106,'Printer',18000);
 
select *from customers;
select *from orders;

 ## INNER JOINS : INNER JOIN RETURNS ONLY THE RECORDS THAT HAVE MATICHING VALUES IN BOTH TABLES
 
 SELECT CUSTOMERS.*,ORDERS.*
 FROM customers
 inner join orders
 on customers.customer_id = orders.customer_id;
 
 -- or inner join above table u can show like this also  --
 
 SELECT c.*,o.*
 FROM customers c
 inner join orders o
 on c.customer_id = o.customer_id;
 
 -- or this way --
 
 SELECT x.*,y.*
 FROM customers x
 inner join orders y
 on x.customer_id = y.customer_id;

## x table all columns selected but in y only amount and product when selected
SELECT x.*,y.amount,y.product
 FROM customers x
 inner join orders y
 on x.customer_id = y.customer_id; 
 
 -- when 2 coulumns selected from custors table and two from orders ---
 SELECT	
	customers.customer_id,
	customers.customer_name,
	orders.product,
	orders.amount
from customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT	
	c.customer_id,
	c.customer_name,
	o.product,
CONCAT('₹  ',o.amount)
from customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- join with table Alises --
SELECT	
	c.customer_id,
	c.customer_name,
	o.product,
	o.amount
from customers As c
INNER JOIN orders As o
ON c.customer_id = o.customer_id;

 ## LEFT JOINS
-- LEFT JOINS RETURNS:
-- 1) ALL RECORDS FROM THE LEFT TABLE
-- 2) MATCHING RECORDS FROM THE RIGHT TABLE
-- 3) NULL RETURNS -->  WHEN THERE IS NO MATCH
-- 4) LEFT JOINS --> LEFT TABLE IS IMPORTANT

SELECT
	c.customer_id,
    c.customer_name,
    o.product,
    o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

## RIGHT JOINS
-- RIGHT JOIN RETURNS:
-- 1) ALL RECORDS FROM THE RIGHT TABLE
-- 2) MATCHING RECORDS FROM THE LEFT TABLE
-- 3) NULL WHEN THERE IS NO MATCH
-- 4)RIGHT JOINS --> RIGHT TABLE IS IMPORTANT --

SELECT
	c.customer_name,
    o.order_id,
    o.product,
    o.amount
FROM customers c
RIGHT JOIN orders O
ON c.customer_id = o.customer_id;

## CROSS JOINS/CARTESIAN JOIN
-- CROSS JOIN PRODUCES THE CARTESIAN PRODUCT OF TWO TABLES
-- IF:
-- TABLE A HAS 5 ROWS
-- TABLE B HAS 6 ROWS
-- IT WILL GENERATE 5 ROWS * 6 ROWS = 30 ROWS --
-- CROSS JOINS WILL GENERATE A VERY LARGE NUMBER OF ROWS --

SELECT
	c.*,
	o.*
FROM customers c
CROSS JOIN orders o;

## SELF JOIN: 
-- 1) A SELF JOIN MEANS JOINING A TABLE WITH ITSELF 
-- 2) IT IS USEFUL WHEN RECORDS WITHIN THE SAME TABLE HAVE RELATIONSHIP WITH EACH OTHER

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees
VALUES
(1,'Amit', NULL),      # 'Amit' is a itself manager
(2,'Priya',1),
(3,'Rahul',1),
(4,'Sneha',2),
(5,'Rocky',3);

SELECT
	e.employee_name As Employee,
    m.employee_name As Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

show tables;

select *from customers;
------------- SELF JOIN -/ EQI JOIN-------------
create table employee_new (
 emp_id INT PRIMARY KEY,emp_name VARCHAR(50),department VARCHAR(100)
);

DESC employee_new;

INSERT INTO employee_new 
VALUES
(1,'Rahul', 'IT'),(2,'Priya','HR'),(3,'Hitesh','IT'),(4,'Gaurav','HR'),(5,'Amit','Finance');

SELECT *FROM employee_new;

SELECT e_n1.emp_name,e_n2.emp_name,e_n1.department,e_n2.department
FROM employee_new e_n1
join employee_new e_n2
ON e_n1.department = e_n2.department;

--- FULL OUTER JOIN  --
-- MySQL does not directly support but we can make full outer join by join union of LEFT JOIN & RIGHT JOIN ----
-- This will give records from both tables, including unmatched records --
-- full join or full oder join: it will return matching and non matching rows from both tables --

SELECT
	c.customer_id,
    c.customer_name,
    o.order_id,
    o.product
FROM customers c
LEFT JOIN orders o
on c.customer_id = o.customer_id;

SELECT
	c.customer_id,
    c.customer_name,
    o.order_id,
    o.product
FROM customers c
RIGHT JOIN orders o
on c.customer_id = o.customer_id;

SELECT
	c.customer_id,
    c.customer_name,
    o.order_id,
    o.product
FROM customers c
LEFT JOIN orders o
on c.customer_id = o.customer_id
                union
SELECT
	c.customer_id,
    c.customer_name,
    o.order_id,
    o.product
FROM customers c
RIGHT JOIN orders o
on c.customer_id = o.customer_id;

## JOINS WITH WHERE CLAUSE: where is used to pass the condion on record or rows
SELECT
	c.*,
    c.customer_name,
    o.customer_id,
    o.amount
FROM customers c
INNER JOIN orders o
on c.customer_id = o.customer_id
WHERE o.amount>12000;

SELECT
	c.*,
    sum(o.amount)
FROM customers c
INNER JOIN orders o
on c.customer_id = o.customer_id
group by o.customer_id;

SELECT
	c.*,
    sum(o.amount)
FROM customers c
INNER JOIN orders o
on c.customer_id = o.customer_id
group by o.customer_id,c.customer_id;
-- having clause is used to filer the group or after group by --
SELECT
	c.*,
    sum(o.amount),o.product
FROM customers c
INNER JOIN orders o
on c.customer_id = o.customer_id
group by o.customer_id,c.customer_id,o.product;

select sum(amount) from orders group by customer_id;









    






 
