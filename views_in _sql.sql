use bankingdb;

show TABLES;

CREATE TABLE customerss (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    age INT,
    balance DECIMAL(12,2)
);

DESC customerss;

-- drop table customerss;

INSERT INTO customerss
(customer_id,customer_name ,city ,age,balance )
    VALUES
    (101,'Rahul Sharma','Nagpur',28,45000.00),
    (102,'Priya Patil','Pune',32,72000.00),
    (103,'Amit Verma','Mumbai',25,38000.00),
    (104,'Sneha Joshi','Nagpur',30,65000.00),
    (105,'Rohan Deshmukh','Pune',35,85000.00);
    
    -- Display Records of original table
    SELECT * FROM customerss;     # original table or base table
    
    create view citywise_highest_balance_view as
    select city,sum(balance)
    from customerss
    group by city order by sum(balance) desc;
    
      -- Display Records of virtual/temporary table
    SELECT * FROM citywise_highest_balance_view;  # it gives u citywise all records
    
    desc citywise_highest_balance_view;    # gives u two records mention while select
    
    -- find view/virtual tables in mysql --
    show full tables where table_type = "VIEW";
    
    
    -- order by-- normal query
    select *
    from customerss
    order by balance DESC;
           
    -- GROUP bY
    select city,COUNT(*) AS total_customers
    from customerss
    order by city;
    
       
                                                 -- convert above normal query in VIEW
    
    -- GROUP bY query in VIEW
    
    cREATE OR REPLACE VIEW citywise_nu_cust_view AS
    select city,COUNT(*) AS total_customers
    from customerss                                          # This will overwrite the old view with your new query without
																#you having to drop it first.
	group by city;
    
    SELECT * FROM citywise_nu_cust_view;
    SELECT city,avg(balance) from customerss GROUP BY CITY;
    
    -- MODIFY THE EXISTING VIEW
    CREATE OR REPLACE VIEW citywise_nu_cust_view AS
    SELECT city,avg(balance) from customerss GROUP BY CITY;
																# This will overwrite the old view with your new query without
																#you having to drop it first.
	-- HAVING
    select city,SUM(balance) AS TOTAL_BALANCE
    from customerss
	GROUP by city
    HAVING AVG(balance) > 40000;
    
     -- HAVING
    select city,AVG(balance) AS AVG_BALANCE
    from customerss
	GROUP by city
    HAVING AVG(balance) > 40000;
    
    -- HAVING WITH VIEW
    CREATE VIEW avg_gt_40000 as
    select city,AVG(balance) AS AVG_BALANCE
    from customerss
	GROUP by city
    HAVING AVG(balance) > 40000; 
   
   SELECT * FROM avg_gt_40000;
	SELECT *from avg_gt_40000 where city = 'Pune';
    
    -- HAVING
    select city,SUM(balance) AS TOTAL_BALANCE
    from customerss
	GROUP by city
    HAVING sum(balance) > 100000;
    
    -- HAVING with view
    create view premium_city_view  as
    select city,SUM(balance) AS TOTAL_BALANCE
    from customerss
	GROUP by city
    HAVING sum(balance) > 100000;
    
    SELECT * FROM premium_city_view;
    
    -- HAVING with create or replace view----CHANGE IN EXISTING VIEW---
    create or replace view premium_city_view  as
    select city,SUM(balance) AS TOTAL_BALANCE
    from customerss
	GROUP by city
    HAVING sum(balance) > 100000 and city = 'Nagpur';
    
    SELECT * FROM premium_city_view;
           
   --  -- CREATE A SIMPLE VIEW
--     CREATE VIEW customer_view AS
--     SELECT
-- 		customer_id,
--         customer_name,
--         CITY,
--         BALANCE
-- 	FROM customerss;
  
 --  SELECT * FROM customer_view;    

-- CREATE A VIEW WITH CAKCULATED COLUMNS
-- CREATE VIEW customer_balance_status AS
SELECT 
		customer_id,
		customer_name,
		balance,
        CASE
			WHEN balance >= 50000 THEN 'HIGH BALANCE'
            ELSE 'LOW BALANCE'
		END AS balance_status
	from customerss;
    
CREATE VIEW customer_balance_status AS
SELECT 
		customer_id,
		customer_name,
		balance,
        CASE
			WHEN balance >= 50000 THEN 'HIGH BALANCE'
            ELSE 'LOW BALANCE'
		END AS balance_status
	from customerss;
   
SELECT * FROM customer_balance_status;
    
    -- create view with WHERE
CREATE VIEW high_balance_customers AS
SELECT
		customer_id,
		customer_name,
		city,
        balance
        from customerss
        WHERE balance > 50000;
        
	-- display view
    SELECT * 
    FROM high_balance_customers;
    
    -- BANKING ANALYSIS WITH AGGREGATE FUNCTIONS --
    SELECT
			city,
            count(*) as 'Number of Customers',
            min(balance) as'Minimum Balance',
            max(balance) as 'Maximum Balance',
            avg(balance) as 'Average Balance',
            sum(balance) as 'Total Balance'
		from customerss
        group by city;
        
  create view banking_analysis_view as      
	SELECT
			city,
            count(*) as 'Number of Customers',
            min(balance) as'Minimum Balance',
            max(balance) as 'Maximum Balance',
            avg(balance) as 'Average Balance',
            sum(balance) as 'Total Balance'
		from customerss
        group by city;

SELECT * 
    FROM banking_analysis_view;
    