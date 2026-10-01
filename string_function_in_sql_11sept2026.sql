use n325_db;

create table IF NOT EXISTS company(
	emp_id INT PRIMARY KEY ,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2) default 20000,
    hire_date DATE,
    city VARCHAR(50)
);

INSERT INTO company
	(emp_id,emp_name,department,job_role,salary,hire_date,city)
VALUES
	(101,'Rahul Sharma', 'IT' , 'Developer', 65000, '2021-01-15','Nagpur'),
    (102,'Priya Singh', 'HR' , 'HR Manager', 75000, '2020-05-20','Mumbai'),
    (103,'Amit Kumar', 'IT' , 'Developer', 70000, '2022-03-10','Pune'),
    (104,'Sneha Patil', 'Finance' , 'Accountant', 60000, '2021-07-12','Nagpur'),
    (105,'Rohit Verma', 'IT' , 'Tester', 55000, '2023-02-18','Mumbai'),
    (106,'Neha Joshi', 'HR' , 'Recruiter', 50000, '2022-11-25','Pune'),
    (107,'Vikas Gupta', 'Finance' , 'Manager', 85000, '2019-09-30','Delhi'),
    (108,'Anjali Rao', 'IT' , 'Developer', 80000, '2020-12-05','Delhi'),
    (109,'Suresh Yadav', 'Sales' , 'Executive', 45000, '2023-06-15','Nagpur'),
    (110,'Pooja Mehta', 'Sales' , 'Manager', 70000, '2021-10-10','Mumbai');
    
    select *from company;
    
    ## STRING FUNCTIONS
    SELECT length(emp_name) from company;
    
    SELECT emp_name,length(emp_name) from company;
    
    SELECT emp_name,length(emp_name) as 'No of Characters' from company;
    
    -- CONCAT() --
    SELECT concat(emp_name, ' _ ',department) from company;
    
    -- SUBSTR(string, start_position,length)
    select *from company;
    select city,substr(city,1,3) from company;
    
    select substr(emp_name,2,4),substring(emp_name,2,4) from company;
	select substring(emp_name,2,4) from company;
    
    select emp_name,substr(emp_name,2,4),substring(emp_name,-1,2) from company;
	select substring(emp_name,2,4) from company;
    
    -- TRIM() : Rwmoves unnecessary space --
    SELECT
		emp_name,TRIM(emp_name) AS cleaned_name
     from company;  
     
     select trim('   Nagpur   ') from dual;
	 select length('   Nagpur   '),trim('   Nagpur   ') from dual;
	 select length('   Nagpur   '),length(trim('   Nagpur   ')) from dual;
     
     -- replace(old_str.new_str) --
     select emp_name from company;
     SELECT
     emp_name,
     REPLACE(emp_name,  'a',  '@') as modified_name, replace(emp_name,'g','9'),replace(emp_name,'S','5'),replace(emp_name,'hul','fool')
     FROM company;
     
     ## Mathematical Functions 
     -- 1) round()
     SELECT
		emp_name,
        salary,salary/12,
        ROUND(salary/12, 2) as monthly_salary
	FROM company;
    
    SELECT
		emp_name,
        salary,salary/12,
        ROUND(salary/12, 3) as monthly_salary
	FROM company;
    
    -- 2) FLOOR()
    SELECT
		salary,
        FLOOR(salary / 1000) as rounded_down_salary
	FROM company;
    
    SELECT
		salary/12,
        FLOOR((salary/12) / 1000) as rounded_down_salary
	FROM company;
    
    SELECT
		salary/12,
        FLOOR(salary/12) as rounded_down_salary
	FROM company;
    
    SELECT
		salary/12,
        FLOOR(salary/12)as rounded_down_salary,
        ceil(salary/12) as rounded_high_salary
	FROM company;
        
	-- 3) ABS()
    SELECT ABS(-222) FROM DUAL;
    SELECT
		emp_name,job_role,
        ABS(salary - 60000) as salary_difference
	FROM company;
    
    SELECT
		emp_name,job_role,salary-60000,
        ABS(salary - 60000) as salary_difference
	FROM company;
    
    -- 4) MOD():
SELECT
	emp_id,
    MOD(emp_id, 2) as remainder,
    MOD(salary, 2) as salary_remainder
FROM company;

	-- 5) POWER
SELECT
	salary,
    POWER(salary, 2) as salary_square
FROM company;

### COMPARISION OPERATORS
-- 1) GREATEST(): return the largest values
SELECT MAX(SALARY) FROM COMPANY;
SELECT SALARY FROM COMPANY;

SELECT greatest(78,12,781,234,78989,163098) from dual;

SELECT
	department,
    salary,
   GREATEST(salary, 50000) as SALARY_GREATER_THAN_50000
FROM company;

SELECT
	department,
    salary,
   GREATEST(salary, 40000) as SALARY_GREATER_THAN_40000
FROM company;

-- 2) LEAST()
SELECT least(12,11,34,09,46,3) from dual;

SELECT
	emp_name,
    salary,
    LEAST(salary, 60000) as SALARY_LESS_THAN_60000 
FROM company;

## COMPARISION OPERATORS
SELECT *
	FROM company
    WHERE salary > 60000;
    
SELECT department,sum(salary)
FROM company
group by department having sum(salary) > 120000 order by sum(salary);

SELECT department,sum(salary)
FROM company
group by department having sum(salary) > 120000 order by sum(salary) desc;

SELECT department,concat('₹ ',round(sum(salary),0)) as departmentwise_salary
FROM company
group by department having sum(salary) > 120000 order by sum(salary) desc;

-- DISTINCT() --> IT RETURNS UNIQUE VALUE OF COLUMNS --
SELECT DISTINCT CITY FROM company;

SELECT count(DISTINCT CITY) as 'unique cities',
count(city) FROM company;

SELECT count(DISTINCT CITY) as 'unique cities',
count(city) 'TOTAL CITIES' FROM company;

SELECT emp_name,salary
FROM company
WHERE salary = 70000;

-- SALARY INCREASED BY 25% --
SELECT emp_name,salary,salary*1.25 as 'SALARY INCREASED BY 25%'
	FROM company    
    WHERE salary > 70000;
    
SELECT emp_name,salary,salary*1.25 as 'SALARY INCREASED BY 25%'
	FROM company;
    
SELECT emp_name,salary,salary*1.25 as 'SALARY INCREASED BY 25%'
	FROM company    
    WHERE city = 'Nagpur' ;

select salary,salary*(1-0.1)
FROM company;

select salary,salary*(1-0.1), salary*0.9
FROM company;

select salary,salary*(1-0.1), salary*0.9 as 'salary reduced by 10%'
FROM company;

select salary,salary*(1-0.25) as 'salary reduced by 25%', salary*0.9 as 'salary reduced by 10%'
FROM company;

# Not equals to -->   <>
SELECT *
FROM employee
WHERE salary <> 50000;

-- not equals to --> !=
SELECT * FROM company WHERE salary != 50000;

# Comparision based on classification
SELECT *,
	CASE 
		WHEN salary >= 75000 THEN 'HIGH SALARY'
        WHEN salary >= 60000 THEN 'MEDIUM SALARY'
        ELSE 'Low Salary'
	END AS salary_category
FROM employee;

SELECT salary,
	CASE 
		WHEN salary >= 75000 THEN 'HIGH SALARY'
        WHEN salary >= 60000 THEN 'MEDIUM SALARY'
        ELSE 'Low Salary'
	END AS salary_category
FROM company;

## Aggregate functions in sql
-- Aggregation function performs calculation on multiple rows.

SELECT COUNT(emp_id) AS total_employees_in_company
FROM company;

SELECT department,count(*) as 'department_wise_employees' from company group by department;

SELECT COUNT(*) AS total_employees
FROM company;

SELECT department,sum(salary) as total_employees
FROM company group by department;

SELECT department,avg(salary) as total_salary
FROM company 
group by department;

-- MAX()
SELECT department,max(salary) as 'maximum_salary',min(salary) as 'minimum_salary'
FROM company group by department;

-- ALL Aggregation function --
SELECT
	COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM company;
    



     