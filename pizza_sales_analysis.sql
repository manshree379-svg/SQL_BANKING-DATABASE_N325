-- 1. Create a database named pizza_sales_analysis ==
CREATE DATABASE pizza_sales_analysis;

-- 2. List all databases --
SHOW DATABASES;

-- 3. Create the following table ---Table Name: order ---
USE pizza_sales_analysis;
CREATE TABLE `order` (
id INT,
date DATE
);

-- 4. Add a column time with datatype time after the date column in the order table --
ALTER TABLE `order`
ADD COLUMN time TIME AFTER date;

-- 5. Rename the table order to orders --
RENAME TABLE `order` TO orders;

-- 6. Add a primary key constraint to the column id on the existing table orders --
ALTER TABLE orders
ADD PRIMARY KEY (id);
