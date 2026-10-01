use bankingdb;

-- 1) ROW_NUMBER() --

SELECT
*,
	row_number()
    over(order by salary desc)
from employee;
    
    -- 2) Assign rank to each employee w.r.to salary --
    SELECT
		SALARY,
        RANK() over(order by salary desc)
	from employee;
    -- *************************************************************************************************************** --
    /*
    Topic:Mastering SQL Window Functions
    
    1) Understanding OVER()
    
    2) Using RANK(), DENSE_RANK() AND ROW_NUMBER()
    
    3) CALCULATING rUNNING tOTALS WITH SUM() OVER()
    
    */
    
    use bankingdb;
    
    CREATE TABLE IF NOT EXISTS sales(
		sale_id INT PRIMARY KEY,
        employee_name VARCHAR(50),
        department VARCHAR(50),
        sale_date DATE,
        amount DECIMAL(10,2)
	);
    
    desc sales;
    
    -- Insert data
    INSERT INTO sales
    (sale_id, employee_name, department, sale_date, amount)
    VALUES
    (1,'Amit', 'Electronics','2026-01-05', 50000),
    (2,'Priya', 'Electronics','2026-01-10', 75000),
    (3,'Rahul', 'Electronics','2026-01-15', 75000),
    (4,'Sneha', 'Electronics','2026-01-20', 90000),
    (5,'Vikas', 'Clothing','2026-01-05', 40000),
    (6,'Neha', 'Clothing','2026-01-10', 60000),
	(7,'Rohit', 'Clothing','2026-01-15', 60000),
	(8,'Pooja', 'Clothing','2026-01-20', 85000),
	(9,'Karan', 'Furniture','2026-01-05',30000),
	(10,'Anjali', 'Furniture','2026-01-10',55000);
    
    SELECT *from sales;
    
    # Windows functions
    
    -- 1) Assign row number
    SELECT
		*,row_number() over( ORDER BY amount DESC) AS 'ROW NUMBER',
        RANK() over( ORDER BY amount DESC) AS 'RANK()',
		dense_rank() over( ORDER BY amount DESC) AS 'DENSE_RANK()'
	FROM sales;
    
    -- 2) PARTITION BY --
    SELECT department,amount,
		rank()
        over(partition by department order by amount desc) as 'department rank',
        dense_rank()
        over(partition by department order by amount desc) as 'department dense rank',
        sum(amount)
        over(partition by department order by amount desc) as 'running total department_wise'
                
	FROM sales;
        
     -- 3) Percentage_wise contribution of each department --
     SELECT
		employee_name,department,
        round(amount/sum(amount) over( partition by department)*100,2) as 'departmentwise_contribution'
        
	FROM sales;
    select *from sales;
    
        -- LAG() --> COMPARE WITH THE PREVIOUS RECORDS --
	SELECT
		sale_id,department,amount,sale_date,amount,
        lag(amount) over( order by sale_date)
	FROM sales;
    
        -- LEAD() --> COMPARE CURRENT VALUE WITH THE NEXT VALUE --
	SELECT
		sale_id,department,amount,sale_date,amount,
        lead(amount) over( order by sale_date)
	FROM sales;
    
    -- LAG() and lead() --
    SELECT
		sale_id,department,amount,sale_date,amount,
        lag(amount) over( order by sale_date),
        lead(amount) over( order by sale_date)
	FROM sales;
    
    -- Running Total with use of sum() --
    SELECT
		sale_id,department,sale_date,amount,
        sum(amount) over( partition by department order by sale_date) as 'Running_Total'
	FROM sales;
  
        -- Average sale departmentwise --
	SELECT
		sale_id,department,sale_date,amount,
        concat('₹ ' ,Round(avg(amount) over( partition by department order by sale_date),2)) as 'Average Sales'
	FROM sales;
    
    -- FIRST_VALUE & LAST_VALUE --
     SELECT
		department,amount,
        first_value(amount) over( partition by department order by amount desc) as 'First_Value',
        
		last_value(amount) over( partition by department order by amount desc rows between unbounded preceding and unbounded following) as 'Last_Value'
	FROM sales;
    
    -- NTILE() -- Divides rows into a spcified number of approximately equal groups --
    SELECT department,amount,ntile (6) over(order by amount desc) as amount_6_quartile
		from sales;
    
    SELECT department,amount,ntile (4) over(order by amount desc) as amount_4_quartile
		from sales;
        
        
    -- completed window function --------------
    
   
    # calculate total sales across all rows
    
    # calculate average sales
    
    
    
    
    
    
    