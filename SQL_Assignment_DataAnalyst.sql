CREATE DATABASE analyst_sales_db;

USE analyst_sales_db;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
signup_date DATE,
segment VARCHAR(30)
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
subcategory VARCHAR(50),
unit_price DECIMAL(10,2)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
sales_channel VARCHAR(30),
payment_method VARCHAR(30),
order_status VARCHAR(30),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
discount_pct DECIMAL(5,2),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(101,'Aarav Sharma','Nagpur','Maharashtra','2025-01-15','Retail'),
(102,'Priya Patil','Pune','Maharashtra','2025-02-20','Corporate'),
(103,'Rahul Verma','Mumbai','Maharashtra','2025-03-05','Retail'),
(104,'Sneha Joshi','Nashik','Maharashtra','2025-03-18','SMB'),
(105,'Vikram Singh','Delhi','Delhi','2025-04-10','Corporate'),
(106,'Ananya Rao','Bengaluru','Karnataka','2025-04-25','Retail'),
(107,'Rohan Mehta','Hyderabad','Telangana','2025-05-12','SMB'),
(108,'Neha Kulkarni','Nagpur','Maharashtra','2025-05-30','Retail'),
(109,'Karan Gupta','Jaipur','Rajasthan','2025-06-08','Corporate'),
(110,'Meera Shah','Ahmedabad','Gujarat','2025-06-21','SMB'),
(111,'Aditya Deshmukh','Pune','Maharashtra','2025-07-03','Retail'),
(112,'Isha Kapoor','Delhi','Delhi','2025-07-19','Corporate'),
(113,'Manish Yadav','Indore','Madhya Pradesh','2025-08-02','Retail'),
(114,'Kavya Nair','Kochi','Kerala','2025-08-16','SMB'),
(115,'Siddharth Jain','Mumbai','Maharashtra','2025-09-01','Corporate');

INSERT INTO products VALUES
(201,'Laptop Pro 14','Electronics','Laptops',65000.00),
(202,'Laptop Air 13','Electronics','Laptops',52000.00),
(203,'Wireless Mouse','Electronics','Accessories',1200.00),
(204,'Mechanical Keyboard','Electronics','Accessories',3500.00),
(205,'Office Chair','Furniture','Chairs',8500.00),
(206,'Standing Desk','Furniture','Desks',18000.00),
(207,'Monitor 24 Inch','Electronics','Monitors',12500.00),
(208,'Monitor 27 Inch','Electronics','Monitors',18500.00),
(209,'USB-C Hub','Electronics','Accessories',2200.00),
(210,'Bookshelf','Furniture','Storage',6500.00);

INSERT INTO orders VALUES
(1001,101,'2025-07-02','Online','UPI','Delivered'),
(1002,102,'2025-07-04','Online','Credit Card','Delivered'),
(1003,103,'2025-07-06','Store','Cash','Delivered'),
(1004,104,'2025-07-09','Online','UPI','Delivered'),
(1005,105,'2025-07-12','Online','Credit Card','Cancelled'),
(1006,106,'2025-07-15','Store','Debit Card','Delivered'),
(1007,107,'2025-07-18','Online','UPI','Delivered'),
(1008,108,'2025-07-22','Store','Cash','Returned'),
(1009,109,'2025-07-25','Online','Credit Card','Delivered'),
(1010,110,'2025-07-28','Online','UPI','Delivered'),
(1011,111,'2025-08-02','Store','Debit Card','Delivered'),
(1012,112,'2025-08-05','Online','Credit Card','Delivered'),
(1013,113,'2025-08-09','Online','UPI','Delivered'),
(1014,114,'2025-08-13','Store','Cash','Delivered'),
(1015,115,'2025-08-18','Online','Credit Card','Delivered'),
(1016,101,'2025-08-21','Online','UPI','Delivered'),
(1017,103,'2025-08-24','Store','Cash','Delivered'),
(1018,105,'2025-08-28','Online','Credit Card','Delivered'),
(1019,108,'2025-09-02','Online','UPI','Delivered'),
(1020,110,'2025-09-05','Store','Debit Card','Delivered'),
(1021,112,'2025-09-08','Online','Credit Card','Cancelled'),
(1022,115,'2025-09-11','Online','UPI','Delivered'),
(1023,102,'2025-09-14','Store','Debit Card','Delivered'),
(1024,106,'2025-09-17','Online','Credit Card','Delivered'),
(1025,109,'2025-09-20','Online','UPI','Delivered');

INSERT INTO order_items VALUES
(1,1001,201,1,5.00),
(2,1001,203,2,10.00),
(3,1002,206,2,5.00),
(4,1002,204,2,0.00),
(5,1003,205,1,10.00),
(6,1003,203,1,0.00),
(7,1004,207,2,5.00),
(8,1005,201,1,0.00),
(9,1006,202,1,8.00),
(10,1006,209,2,5.00),
(11,1007,208,1,10.00),
(12,1007,203,3,5.00),
(13,1008,206,1,0.00),
(14,1009,201,2,7.50),
(15,1009,209,2,5.00),
(16,1010,205,2,12.00),
(17,1011,207,1,5.00),
(18,1011,204,1,0.00),
(19,1012,202,2,10.00),
(20,1013,210,2,5.00),
(21,1013,203,2,0.00),
(22,1014,205,1,5.00),
(23,1015,201,1,6.00),
(24,1015,208,1,8.00),
(25,1016,204,2,10.00),
(26,1016,209,1,5.00),
(27,1017,203,4,10.00),
(28,1018,206,1,8.00),
(29,1018,207,2,5.00),
(30,1019,202,1,5.00),
(31,1019,203,2,0.00),
(32,1020,205,2,10.00),
(33,1021,201,1,0.00),
(34,1022,208,2,7.00),
(35,1023,206,1,5.00),
(36,1023,209,2,10.00),
(37,1024,202,1,5.00),
(38,1024,207,1,5.00),
(39,1025,201,1,10.00),
(40,1025,204,2,5.00);

-- *************************************************************************** --

-- 3) Business Questions — Basic SQL

-- Display all customers from Maharashtra --
SELECT * FROM customers WHERE state = 'Maharashtra';

-- Display all products with a unit price greater than ₹10,000 --
SELECT * FROM products WHERE unit_price > 10000;

-- Find all orders placed through the Online sales channel --
SELECT * FROM orders WHERE sales_channel = 'Online';

-- Display customers who signed up after 1 June 2025 --
SELECT * FROM customers WHERE signup_date > '2025-06-01';

-- Find all delivered orders placed using UPI --
SELECT * FROM orders WHERE order_status = 'Delivered' AND payment_method = 'UPI';

-- Display products belonging to the Electronics category and Accessories subcategory -
SELECT * FROM products WHERE category = 'Electronics' AND subcategory = 'Accessories';

-- Find orders placed between 1 August 2025 and 31 August 2025 ==
SELECT * FROM orders WHERE order_date BETWEEN '2025-08-01' AND '2025-08-31';

-- Display customers whose names start with the letter 'A'--
SELECT * FROM customers WHERE customer_name LIKE 'A%';

-- Display products whose names contain the word 'Monitor' --
SELECT * FROM products WHERE product_name LIKE '%Monitor%';

-- Find orders that were either Cancelled or Returned --
SELECT * FROM orders WHERE order_status IN ('Cancelled', 'Returned');
-- ****************************************************************** --
-- 4) Aggregation and GROUP BY ---

-- Q1. Total customers per state ---
SELECT state, COUNT(*) AS total_customers
FROM customers
GROUP BY state;

-- Q2. Customers per segment--
SELECT segment, COUNT(*) AS total_customers
FROM customers
GROUP BY segment;

-- Q3. Average product price per category --
SELECT category, AVG(unit_price) AS avg_price
FROM products
GROUP BY category;

-- Q4. Max/min product price per category --
SELECT category, MAX(unit_price) AS max_price, MIN(unit_price) AS min_price
FROM products
GROUP BY category;

-- Q5. Total quantity sold per product --
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- Q6. Total orders per sales channel --
SELECT sales_channel, COUNT(*) AS total_orders
FROM orders
GROUP BY sales_channel;

-- Q7. Orders per payment method --
SELECT payment_method, COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method;

-- Q8. Total sales amount generated by each order --
SELECT o.order_id,SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS order_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id;

-- Q9. Total sales per product category (Delivered orders only)--
SELECT p.category,SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

-- Q10. Customers who placed more than one order --
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;
-- **************************************************************** --
-- 5. JOIN-Based Analysis ---

-- Q1. Order id, customer name, order date, status, channel --
SELECT o.order_id, c.customer_name, o.order_date, o.order_status, o.sales_channel
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Q2. Order id, product name, quantity, unit price, discount --
SELECT oi.order_id, p.product_name, oi.quantity, p.unit_price, oi.discount_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- Q3. Customer, city, product, category, quantity, order date --
SELECT c.customer_name, c.city, p.product_name, p.category, oi.quantity, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Q4. Total revenue per customer (Delivered only) --
SELECT c.customer_name,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name;

Q5. Total revenue per city (Delivered only)
SELECT c.city,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city;
Q6. Top 5 products by total revenue (Delivered only)
SELECT p.product_name,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
-- Q7. Number of distinct products purchased by each customer --
SELECT c.customer_name, COUNT(DISTINCT oi.product_id) AS distinct_products
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name;

-- Q8. Customers who purchased a Laptop product --
SELECT DISTINCT c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_name LIKE '%Laptop%';

-- Q9. Products that never appeared in an order --
SELECT p.*
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- Q10. Total quantity sold by product category --
SELECT p.category, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;
-- ************************************************************* --
-- 6. HAVING and Business KPI Questions--

-- Q1. Categories with total revenue > ₹50,000 (Delivered)--
SELECT p.category,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
HAVING total_revenue > 50000;

-- 2. Customers with Delivered revenue > ₹50,000 --
SELECT c.customer_name,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name
HAVING total_revenue > 50000;

-- Q3. Cities with more than 2 customers --
SELECT city, COUNT(*) AS num_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;

-- Q4. Products with total quantity sold >  --
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
HAVING total_quantity > 5;

-- Q5. Average order value (AOV) for Delivered orders --
SELECT SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered';

-- Q6. Total revenue, orders, customers, AOV for Delivered orders --
SELECT
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered';

-- Q7. Percentage contribution of each category to total Delivered revenue --
SELECT p.category,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS category_revenue,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) * 100 /
        (SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct/100))
         FROM order_items oi2
         JOIN products p2 ON oi2.product_id = p2.product_id
         JOIN orders o2 ON oi2.order_id = o2.order_id
         WHERE o2.order_status = 'Delivered') AS pct_of_total
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

-- Q8. Month with highest Delivered revenue --
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY month
ORDER BY revenue DESC
LIMIT 1;

-- Q9. Payment method generating the most Delivered orders --
SELECT payment_method, COUNT(*) AS delivered_orders
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY delivered_orders DESC
LIMIT 1;

-- Q10. Cancellation rate --
SELECT SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS cancellation_rate_pct
FROM orders;
-- ******************************************************************* --
-- 7. Subqueries — Without CTE --

-- Q1. Products priced above the average product price --
SELECT * FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);

-- Q2. Customers who placed at least one order --
SELECT * FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);

-- Q3. Customers who never placed an order --
SELECT * FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

-- Q4. Products priced above the average price of their own category --
SELECT p1.*
FROM products p1
WHERE p1.unit_price > (
    SELECT AVG(p2.unit_price) FROM products p2 WHERE p2.category = p1.category
);

-- Q5. Second-highest priced product --
SELECT * FROM products
WHERE unit_price = (
    SELECT MAX(unit_price) FROM products
    WHERE unit_price < (SELECT MAX(unit_price) FROM products)
);

-- Q6. Customers whose order count exceeds the average order count per customer --
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > (
    SELECT AVG(cnt) FROM (
        SELECT COUNT(*) AS cnt FROM orders GROUP BY customer_id
    ) t
);

-- Q7. Orders whose total value exceeds the average order value --
SELECT order_id, order_value FROM (
    SELECT o.order_id,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id
) ov
WHERE order_value > (
    SELECT AVG(order_value) FROM (
        SELECT o2.order_id,
               SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct/100)) AS order_value
        FROM orders o2
        JOIN order_items oi2 ON o2.order_id = oi2.order_id
        JOIN products p2 ON oi2.product_id = p2.product_id
        GROUP BY o2.order_id
    ) t
);

-- Q8. Product(s) with the highest unit price --
SELECT * FROM products
WHERE unit_price = (SELECT MAX(unit_price) FROM products);

-- Q9. Customers who purchased at least one Electronics product --
SELECT DISTINCT c.*
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE p.category = 'Electronics'
);

-- Q10. City with the highest total Delivered revenue --
SELECT c.city
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) DESC
LIMIT 1;
-- ******************************************************************* --
-- 8. CASE Expression and Data Segmentation --

-- Q1. Product price category --
SELECT product_name, unit_price,
    CASE
        WHEN unit_price < 5000 THEN 'Budget'
        WHEN unit_price BETWEEN 5000 AND 20000 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_category
FROM products;

-- Q2. Customer classification by total Delivered revenue --
SELECT c.customer_name,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue,
    CASE
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) < 20000 THEN 'Low'
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) BETWEEN 20000 AND 50000 THEN 'Medium'
        ELSE 'High'
    END AS revenue_class
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name;

-- Q3. Order classification by value --
SELECT o.order_id,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS order_value,
    CASE
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) < 10000 THEN 'Small'
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) BETWEEN 10000 AND 30000 THEN 'Medium'
        ELSE 'Large'
    END AS order_category
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id;

-- Q4. Customer activity label by order count --
SELECT customer_id, COUNT(*) AS order_count,
    CASE
        WHEN COUNT(*) = 1 THEN 'New'
        WHEN COUNT(*) = 2 THEN 'Regular'
        ELSE 'Frequent'
    END AS activity_label
FROM orders
GROUP BY customer_id;

-- Q5. Discount category --
SELECT order_item_id, discount_pct,
    CASE
        WHEN discount_pct = 0 THEN 'No Discount'
        WHEN discount_pct BETWEEN 1 AND 5 THEN 'Low Discount'
        WHEN discount_pct BETWEEN 5.01 AND 10 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_category
FROM order_items;
-- ****************************************************************** --
-- 9. Date and String Functions --

-- Q1. Year, month number, month name for each order --
SELECT order_id, YEAR(order_date) AS yr, MONTH(order_date) AS month_num, MONTHNAME(order_date) AS month_name
FROM orders;

-- Q2. Number of orders per month --
SELECT MONTHNAME(order_date) AS month_name, COUNT(*) AS num_orders
FROM orders
GROUP BY MONTHNAME(order_date), MONTH(order_date)
ORDER BY MONTH(order_date);

-- Q3. Customers whose signup date is older than 180 days from 20 Sept 2025 --
SELECT * FROM customers
WHERE DATEDIFF('2025-09-20', signup_date) > 180;

-- Q4. Days between signup and first order date --
SELECT c.customer_name, DATEDIFF(MIN(o.order_date), c.signup_date) AS days_to_first_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name, c.signup_date;

-- Q5. Customer names in uppercase --
SELECT UPPER(customer_name) AS name_upper FROM customers;

-- Q6. Customer name and first 3 characters --
SELECT customer_name, LEFT(customer_name, 3) AS first_3_chars FROM customers;

-- Q7. City names in uppercase and their length --
SELECT UPPER(city) AS city_upper, LENGTH(city) AS city_length FROM customers;

-- Q8. Orders placed on weekends --
SELECT * FROM orders
WHERE DAYOFWEEK(order_date) IN (1, 7);   -- 1 = Sunday, 7 = Saturday

-- Q9. Days between each order date and 20 Sept 2025 --
SELECT order_id, DATEDIFF('2025-09-20', order_date) AS days_since_order FROM orders;

-- Q10. Year and month from order_date, YYYY-MM format --
SELECT order_id, DATE_FORMAT(order_date, '%Y-%m') AS year_month FROM orders;
-- ************************************************************************* --
-- 10. Window Functions — Without CTE --

-- Q1. ROW_NUMBER() of orders per customer, by order date --
SELECT customer_id, order_id, order_date,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
FROM orders;

-- Q2. Rank products by price, highest to lowest --
SELECT product_name, unit_price,
       RANK() OVER (ORDER BY unit_price DESC) AS price_rank
FROM products;

-- Q3. Rank products within each category --
SELECT product_name, category, unit_price,
       DENSE_RANK() OVER (PARTITION BY category ORDER BY unit_price DESC) AS category_rank
FROM products;

-- Q4. Running total of Delivered revenue by order date --
SELECT order_date, order_revenue,
       SUM(order_revenue) OVER (ORDER BY order_date) AS running_total
FROM (
    SELECT o.order_date,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS order_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.order_date
) daily;

-- Q5. Each customer’s previous order date — LAG() --
SELECT customer_id, order_id, order_date,
       LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date
FROM orders;

-- Q6. Each customer’s next order date — LEAD() --
SELECT customer_id, order_id, order_date,
       LEAD(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_date
FROM orders;

-- Q7. Each customer’s cumulative Delivered revenue --
SELECT customer_id, order_date, order_revenue,
       SUM(order_revenue) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_revenue
FROM (
    SELECT o.customer_id, o.order_id, o.order_date,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS order_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.order_id, o.customer_id, o.order_date
) t;

-- Q8. Each customer’s % contribution to total Delivered revenue --
SELECT customer_id, total_revenue,
       total_revenue * 100 / SUM(total_revenue) OVER () AS pct_contribution
FROM (
    SELECT o.customer_id,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.customer_id
) t;

-- Q9. Highest-value order for each customer (window function, non-CTE) --
SELECT customer_id, order_id, order_value FROM (
    SELECT o.customer_id, o.order_id,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS order_value,
           RANK() OVER (PARTITION BY o.customer_id
                        ORDER BY SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) DESC) AS rnk
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id, o.order_id
) t
WHERE rnk = 1;

-- Q10. Compare each order’s value with the customer’s previous order value --
SELECT customer_id, order_id, order_date, order_value,
       LAG(order_value) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order_value,
       order_value - LAG(order_value) OVER (PARTITION BY customer_id ORDER BY order_date) AS value_change
FROM (
    SELECT o.customer_id, o.order_id, o.order_date,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id, o.customer_id, o.order_date
) t;
-- ********************************************************************************** --
-- 11. Advanced Data Analyst Case Study (July – September 2025) --

-- Q1. Customer-level report --
SELECT c.customer_name, c.city, c.segment,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(oi.quantity) AS total_quantity,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date BETWEEN '2025-07-01' AND '2025-09-30'
GROUP BY c.customer_name, c.city, c.segment;

-- Q2. Customers with no purchases in the window + inactivity count --
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE c.customer_id NOT IN (
    SELECT DISTINCT customer_id FROM orders
    WHERE order_date BETWEEN '2025-07-01' AND '2025-09-30'
);

SELECT COUNT(*) AS inactive_customer_count
FROM customers c
WHERE c.customer_id NOT IN (
    SELECT DISTINCT customer_id FROM orders
    WHERE order_date BETWEEN '2025-07-01' AND '2025-09-30'
);

-- Q3. Product-level report with category rank by revenue --
SELECT p.product_name, p.category,
       SUM(oi.quantity) AS quantity_sold,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS revenue,
       AVG(oi.discount_pct) AS avg_discount,
       RANK() OVER (PARTITION BY p.category
                    ORDER BY SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) DESC) AS category_rank
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_date BETWEEN '2025-07-01' AND '2025-09-30'
GROUP BY p.product_name, p.category;

-- Q4. Online vs Store comparison --
SELECT o.sales_channel,
       COUNT(DISTINCT o.order_id) AS order_count,
       SUM(oi.quantity) AS total_quantity,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date BETWEEN '2025-07-01' AND '2025-09-30'
GROUP BY o.sales_channel;

-- Q5. Monthly Delivered revenue and month-over-month change --
SELECT month, revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
       revenue - LAG(revenue) OVER (ORDER BY month) AS mom_change
FROM (
    SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY month
) monthly;

-- Q6. Each category’s revenue contribution % --
SELECT p.category,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS category_revenue,
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) * 100 /
          (SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct/100))
           FROM order_items oi2
           JOIN products p2 ON oi2.product_id = p2.product_id
           JOIN orders o2 ON oi2.order_id = o2.order_id
           WHERE o2.order_status = 'Delivered') AS pct_contribution
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

-- Q7. Orders above the overall average Delivered order value --
SELECT order_id, order_value FROM (
    SELECT o.order_id,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.order_id
) ov
WHERE order_value > (
    SELECT AVG(order_value) FROM (
        SELECT o2.order_id,
               SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct/100)) AS order_value
        FROM orders o2
        JOIN order_items oi2 ON o2.order_id = oi2.order_id
        JOIN products p2 ON oi2.product_id = p2.product_id
        WHERE o2.order_status = 'Delivered'
        GROUP BY o2.order_id
    ) t
);

-- Q8. Repeat customers and their repeat-order count --
SELECT customer_id, COUNT(*) AS repeat_order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Q9. Cancellation rate and return rate --
SELECT
    SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS cancellation_rate_pct,
    SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS return_rate_pct
FROM orders;

-- Q10. Final management query --
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN o.order_status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    SUM(CASE WHEN o.order_status = 'Returned' THEN 1 ELSE 0 END) AS returned_orders,
    (SELECT SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100))
     FROM orders o2
     JOIN order_items oi ON o2.order_id = oi.order_id
     JOIN products p ON oi.product_id = p.product_id
     WHERE o2.order_status = 'Delivered'
       AND DATE_FORMAT(o2.order_date, '%Y-%m') = DATE_FORMAT(o.order_date, '%Y-%m')) AS revenue,
    (SELECT SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) / COUNT(DISTINCT o3.order_id)
     FROM orders o3
     JOIN order_items oi ON o3.order_id = oi.order_id
     JOIN products p ON oi.product_id = p.product_id
     WHERE o3.order_status = 'Delivered'
       AND DATE_FORMAT(o3.order_date, '%Y-%m') = DATE_FORMAT(o.order_date, '%Y-%m')) AS avg_order_value
FROM orders o
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m');
-- ****************************************************************************************** --
-- 12. Challenge Questions --

-- Q1. Third-highest priced product, no LIMIT/OFFSET, no CTE --
SELECT * FROM products p1
WHERE 2 = (
    SELECT COUNT(DISTINCT p2.unit_price)
    FROM products p2
    WHERE p2.unit_price > p1.unit_price
);

-- Q2. Second-highest revenue-generating customer --
SELECT customer_id, total_revenue FROM (
    SELECT o.customer_id,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue,
           DENSE_RANK() OVER (ORDER BY SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) DESC) AS rnk
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.customer_id
) t
WHERE rnk = 2;

-- Q3. Most expensive product purchased by each customer --
SELECT customer_id, product_name, unit_price FROM (
    SELECT o.customer_id, p.product_name, p.unit_price,
           RANK() OVER (PARTITION BY o.customer_id ORDER BY p.unit_price DESC) AS rnk
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
) t
WHERE rnk = 1;

-- Q4. Customers who purchased from more than one category --
SELECT o.customer_id, COUNT(DISTINCT p.category) AS category_count
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.customer_id
HAVING COUNT(DISTINCT p.category) > 1;

-- Q5. Product category with the highest average discount --
SELECT p.category, AVG(oi.discount_pct) AS avg_discount
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_discount DESC
LIMIT 1;

-- Q6. Order containing the maximum total quantity --
SELECT order_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY order_id
ORDER BY total_quantity DESC
LIMIT 1;

-- Q7. First product purchased by every customer --
SELECT customer_id, product_name FROM (
    SELECT o.customer_id, p.product_name,
           ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date, oi.order_item_id) AS rn
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
) t
WHERE rn = 1;

-- Q8. Customers whose latest order was Delivered --
SELECT customer_id FROM (
    SELECT customer_id, order_status,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
) t
WHERE rn = 1 AND order_status = 'Delivered';

-- Q9. Products whose revenue is above the average revenue of all products --
SELECT product_name, total_revenue FROM (
    SELECT p.product_name,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.product_name
) t
WHERE total_revenue > (
    SELECT AVG(total_revenue) FROM (
        SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct/100)) AS total_revenue
        FROM order_items oi2
        JOIN products p2 ON oi2.product_id = p2.product_id
        GROUP BY p2.product_id
    ) t2
);
-- Q10. Top 3 products in every category by revenue (window function, no CTE) --
SELECT category, product_name, total_revenue, rnk FROM (
    SELECT p.category, p.product_name,
           SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) AS total_revenue,
           RANK() OVER (PARTITION BY p.category
                        ORDER BY SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct/100)) DESC) AS rnk
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.category, p.product_name
) t
WHERE rnk <= 3
________________________________________
Notes on Assumptions
•	All “revenue” aggregations use quantity * unit_price * (1 - discount_pct/100) and filter to order_status = 'Delivered', per the assignment’s Quick Reference note — except plain “display revenue per order/product/category” listings that don’t mention status, which include all orders regardless of status.
•	No WITH clauses are used anywhere; multi-level aggregation instead uses derived tables (subqueries in the FROM clause), which is standard SQL and distinct from a CTE.
•	Window function questions (Section 10, and Section 12 Q2/Q7/Q8/Q10) wrap the window function in a derived table where a filter on the window result (e.g. rnk = 1) is required, since window functions can’t be referenced directly i





