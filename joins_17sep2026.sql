CREATE DATABASE ShoppingDB;
USE ShoppingDB;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
   product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE ORDERS (
	order_id INT PRIMARY KEY,
   customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

desc orders;

INSERT INTO customers VALUES
	(101,'Rahul Sharma','Nagpur'),(102,'Priya Verma', 'Pune'),
	(103,'Amit Patil', 'Mumbai'),(104,'Sneha Joshi', 'Nashik');
    
INSERT INTO products VALUES
	(201,'Laptop','Electronics',55000),(202,'Keyboard', 'Accessories',1500),
	(203,'Headphones', 'Accessories',2500),(204,'Monitor','Electronics',12000);

INSERT INTO orders VALUES
	(1001,101,201,1,'2026-09-01'),(1002,102,203,2,'2026-09-03'),
	(1003,103,204,1,'2026-09-05'),(1004,101,202,2,'2026-09-07'),
    (1005,104,203,1,'2026-09-10');
    
-- THREE TABLE JOINS --
SELECT c.*,o.*,p.*
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id;

SELECT c.city,sum(p.price)
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id
group by c.city;

SELECT c.city,sum(p.price) As 'Total Amount' 
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id
group by c.city order by sum(p.price) desc;

-- TOP 2 CITY PURCHASE WISE -- DECENDING ORDER --
SELECT c.city,sum(p.price) As 'Total Amount' 
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id
group by c.city order by sum(p.price) desc LIMIT 2;

-- TOP 2 CITY PURCHASE WISE -- ASCENDING ORDER --
SELECT c.city,sum(p.price) As 'Total Amount' 
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id
group by c.city order by sum(p.price) asc LIMIT 2;

SELECT c.*, p.*, o.order_date, monthname(o.order_date)
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN products p ON p.product_id = o.product_id;

SELECT c.*, p.*, o.order_date, dayname(o.order_date)
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN products p ON p.product_id = o.product_id;

SELECT sum(p.price),dayname(o.order_date)
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN products p ON p.product_id = o.product_id
group by dayname(o.order_date); 

SELECT sum(p.price),dayname(o.order_date)
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN products p ON p.product_id = o.product_id
group by dayname(o.order_date) order by sum(p.price) desc; 

SELECT sum(p.price),dayname(o.order_date),c.city
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN products p ON p.product_id = o.product_id
group by dayname(o.order_date),city order by sum(p.price) desc; 

SELECT p.category,dayname(o.order_date),c.city,sum(p.price)
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN products p ON p.product_id = o.product_id
group by p.category,dayname(o.order_date),city order by sum(p.price) desc; 

SELECT c.customer_id,count(o.order_id) As 'Number Of Orders'
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id
group by c.customer_id ;

SELECT c.customer_id,count(o.order_id) As 'Number Of Orders'
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id
group by c.customer_id having count(o.order_id)>1;

SELECT c.customer_id,c.city,count(o.order_id) As 'Number Of Orders'
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id
group by c.customer_id, c.city having count(o.order_id)>1;

SELECT c.customer_id,c.city,p.product_name
FROM customers c
inner join orders o ON c.customer_id = o.customer_id
inner join products p ON p.product_id = o.product_id
group by c.customer_id, c.city ,p.product_name;




