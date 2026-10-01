CREATE DATABASE IF NOT EXISTS shoppingdb;
use shoppingdb;

CREATE TABLE if not exists users (
	user_id INT PRIMARY KEY,
    username VARCHAR(50),
    country VARCHAR(50),
    followers INT 
);

CREATE TABLE if not exists posts (
	post_id INT PRIMARY KEY,
    user_id INT,
    post_text VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT IGNORE INTO users 
	(user_id,username,country,followers)
    VALUES
    (1,'Rahul', 'India',800000),(2,'Priya', 'India',600000),(3,'Amit', 'India',300000),(4,'Sneha', 'USA',900000),
    (5,'John', 'USA',700000),(6,'Emma', 'USA',400000),(7,'Rohan', 'UK',200000),(8,'Sophia', 'UK',100000);
    
    INSERT IGNORE INTO posts 
	(post_id,user_id,post_text)
    VALUES
    (101,1, 'Learning SQL'),(102,1,'Lreaning Python'),(103, 2,'Data Science'),(104, 4, 'Machine Learning'),
    (105,4,'AI Tutorial'),(106, 5, 'Power BI'),(107, 7, 'My First Post');
    
    # Subqueries
    /*
    SELECT column1
    FROM table_name
    WHERE column2 = (
		SELECT column2
        FROM another_table
	);
    */
    
    -- Type - 1
    ## Scalar Subquery: A scalar subquery returns one row and one column, i.e a single value.
    ## A single-row subquery returns only one row/value.
    
    SELECT *FROM users;
    -- 1)  Find average followers      
    SELECT AVG (followers)     
    FROM users;
    
	SELECT ROUND(AVG (followers),2) As 'Average Followers'               ## simple query
    FROM users;  
    
    -- 2) subquery written for find  followers  whose followers are less thane quals to average followers
    SELECT followers
    FROM users
    WHERE followers <= (
		SELECT AVG(followers)
        FROM users
	);
    
    -- 2) find the username whose followers are ;ess thanequals to average followers
    SELECT username,followers
    FROM users
    WHERE followers <= (
		SELECT AVG(followers)
        FROM users
	);
    
  SELECT username,followers,country
    FROM users
    group by username,followers,country
   having followers <= (
		SELECT AVG(followers)
        FROM users
	);
    
    create view followers_less_avg_view as
    SELECT username,followers
    FROM users
	WHERE followers <= (
		SELECT AVG(followers)
        FROM users
	);
     SELECT *FROM  followers_less_avg_view;
     
    -- 3) find the user with maximum followers
    SELECT MAX(followers)
        FROM users;
        
    SELECT username,followers
    FROM users
    WHERE followers = (
		SELECT MAX(followers)
        FROM users
	);
    
     SELECT username,followers,country
    FROM users
    WHERE followers = (
		SELECT MAX(followers)
        FROM users
	);
           
    -- 4) find the user with minimum followers
    SELECT MIN(followers)
        FROM users;
        
    SELECT username,followers
    FROM users
    WHERE followers = (
		SELECT MIN(followers)
        FROM users
	);
    
    SELECT username,followers,country
    FROM users
    WHERE followers = (
		SELECT MIN(followers)
        FROM users
	);
    
    -- 5) find users Above 500,000 followers
    SELECT username,followers,country
    FROM users
    WHERE followers > 500000;
   
   select country from users;
   
   select DISTINCT(country) from users;
   
  select COUNT(DISTINCT(country)) from users;
    
      -- using a sub query
   SELECT username,followers,country
    FROM users
    WHERE followers > (
		SELECT 500000
	);
           
    SELECT DISTINCT username,followers,country
    FROM users
    WHERE followers > (
		SELECT 500000
	);
    
  -- Type-2
  ## Multiple-Row Subquery
  /*
  A multiple-Row Subquery returns multiple rows.It is commonly used with:
  1) IN    2) ANY   3) ALL   4) EXISTS
  */
  
  ## IN WITH SUBQUERY
  SELECT COUNTRY
        FROM users
        GROUP BY country
        HAVING AVG(followers) > 500000;
        
	SELECT COUNTRY,sum(followers)
        FROM users
        GROUP BY country;
       -- HAVING AVG(followers) > 500000;
        
	SELECT COUNTRY,sum(followers)
        FROM users
        GROUP BY country
       HAVING AVG(followers) > 500000;
       
	SELECT COUNTRY,avg(followers)
        FROM users
        GROUP BY country
       HAVING AVG(followers) > 500000;
       
      select country from users where followers > 500000;
      
      select country,followers from users where country in ('INDIA','USA');
      
	select country,SUM(followers) from users GROUP BY country HAVING country IN ('INDIA','USA');
    
    select country,SUM(followers) from users GROUP BY country HAVING country IN (
		SELECT country 
        FROM users
        GROUP BY country
        HAVING AVG(followers) > 500000
	);
      
  -- 1) fIND USERS FROM COUNTRIES WHOSE AVERAGE FOLLOWERS EXCEED 500,000
  SELECT  username,country,followers
	FROM users
    WHERE COUNTRY IN (
		SELECT COUNTRY
        FROM users
        GROUP BY country
        HAVING AVG(followers) > 500000
	);
    
-- 2) NOT IN WITH SUBQUERY
SELECT COUNTRY
        FROM users
        GROUP BY country
		HAVING AVG(followers) > 500000;
        
-- fIND USERS who are not FROM COUNTRIES WHOSE AVERAGE FOLLOWERS above 500,000
SELECT  username,country,followers
	FROM users
    WHERE COUNTRY NOT IN (
		SELECT COUNTRY
        FROM users
        GROUP BY country
        HAVING AVG(followers) > 500000
	);

## 3) ANY WITH Subquery
-- ANY compares a value with at least one value returned by the subquery.
SELECT followers
        FROM users
        WHERE country = 'UK';
        
-- Q. finds users whose followers are greater than at least one of these values.
SELECT  username,followers
	FROM users
    WHERE followers > ANY (
		SELECT followers
        FROM users
        WHERE country = 'UK'
	);
    
    SELECT followers from users where country = any('INDIA','CHINA');
    
    SELECT  username,followers
	FROM users
    WHERE followers = ANY (
		SELECT followers
        FROM users
        WHERE country = 'UK'
	);

## 4) ALL WITH Subquery
-- ALL compares a value with at least one value returned by the subquery.
SELECT followers
        FROM users
        WHERE country = 'UK';
        
-- Q. finds users whose followers are greater than at least one of these values.
SELECT  username,followers
	FROM users
    WHERE followers > ALL (
		SELECT followers
        FROM users
        WHERE country = 'UK'
	);
        
    ## 5) EXISTS WITH Subquery
-- EXISTS CHECKS WHETHER the subquery RETURNS at least one RECORD.
        
-- Q. finds users who have created at least one post.
SELECT  user_id,username
	FROM users u
    WHERE EXISTS (
		SELECT 1
        FROM posts p
        WHERE p.user_id = u.user_id
	);

 ## 6) NOT EXISTS WITH Subquery      
-- Q. finds users who have NEVER created A post.

SELECT  user_id,username
	FROM users u
    WHERE NOT EXISTS (
		SELECT 1
        FROM posts p
        WHERE p.user_id = u.user_id
	);
    
## Type - 3---(24-sep-2026)--
## Correlated Subquery: A correlated subquery references a column from the outer query and is evaluated 

-- Q. find users whose followers are greater than their countrys average
select *from users;

SELECT country,avg(followers)
FROM users 
group by country order by avg(followers) desc; 		## finds the average number of followers per country, sorted from highest to lowest 
														## average.

    -- Q. find users whose followers are greater than their countrys average
    
   SELECT
	u1.username,
    u1.country,
    u1.followers
FROM users u1
WHERE u1.followers > (
	SELECT AVG (u2.followers)
    FROM users u2
    WHERE u2.country = u1.country
);

-- Q. find users whose followers are smaller than their countrys average
SELECT
	u1.username,
    u1.country,
    u1.followers
FROM users u1
WHERE u1.followers < (
	SELECT AVG (u2.followers)
    FROM users u2
    WHERE u2.country = u1.country
);

-- Q. find users above their country average
SELECT
	u.username,
    u.country,
    u.followers
FROM users u
WHERE u.followers > (
	SELECT AVG (x.followers)
    FROM users x
    WHERE x.country = u.country
);
    
-- Q. find users equal and above their country average
SELECT
	u1.username,
    u1.country,
    u1.followers
FROM users u1
WHERE u1.followers >= (
	SELECT AVG (u2.followers)
    FROM users u2
    WHERE u2.country = u1.country
);

-- Q. find users equal and smaller their country average
SELECT
	u1.username,
    u1.country,
    u1.followers
FROM users u1
WHERE u1.followers <= (
	SELECT AVG (u2.followers)
    FROM users u2
    WHERE u2.country = u1.country
);

## Subquery in FROM
/*
A Subquery, inside from is called a
1) Derived table	2) Table Subquery 	3) Inline View

It behaves like a temporary table and must have an alias in MySQL.
*/

SELECT
		country,
        AVG(followers) As avg_followers
FROM users
GROUP BY country;

SELECT
		country_data.country,
        country_data.avg_followers
FROM (
	SELECT
		country,
        AVG(followers) As avg_followers
FROM users
GROUP BY country
) AS country_data
WHERE country_data.avg_followers > 500000;



SELECT
		country_data.country,
        country_data.avg_followers
FROM (
	SELECT
		country,
        AVG(followers) As avg_followers
FROM users
GROUP BY country
) AS country_data;

SELECT*
FROM (
SELECT 
	country,
    COUNT(*) AS total_users,
    AVG(followers) As avg_followers
	FROM users
GROUP BY country
) AS country_summary;

SELECT*
FROM (
SELECT 
	country,
    COUNT(user_id) AS total_users,
    AVG(followers) As avg_followers
	FROM users
GROUP BY country
) AS country_summary;

select *from country_summary;

create view country_summary_view as
SELECT*
FROM (
SELECT 
	country,
    COUNT(user_id) AS total_users,
    AVG(followers) As avg_followers
	FROM users
GROUP BY country
) AS country_summary;

select *from country_summary_view;

select *from country_summary_view where country = 'India';

SELECT*
FROM (
SELECT 
	country,
    COUNT(user_id) AS total_users,
    AVG(followers) As avg_followers
	FROM users
GROUP BY country
having country = 'USA'
) AS country_summary_USA;
    
 SELECT*
FROM (
SELECT 
	country,
    COUNT(user_id) AS total_users,
    AVG(followers) As avg_followers
	FROM users
GROUP BY country
having country = 'USA'
) AS country_summary WHERE country ='USA';

SELECT*
FROM (
SELECT 
	country,
    COUNT(user_id) AS total_users,
    AVG(followers) As avg_followers
	FROM users
GROUP BY country

) AS country_summary WHERE country ='USA';

SELECT*
FROM (
SELECT 
	country,
    COUNT(user_id) AS total_users,
    AVG(followers) As avg_followers
	FROM users
GROUP BY country

) AS country_summary WHERE country IN ('UK','INDIA');


## derived table with where clause
SELECT*
FROM (
SELECT 
	country,
	AVG(followers) As avg_followers
	FROM users
GROUP BY country
having country = 'UK'
) AS country_data
 WHERE avg_followers > 500000;
 
 SELECT*
FROM (
SELECT 
	country,
	AVG(followers) As avg_followers
	FROM users
GROUP BY country
having country = 'UK'
) AS country_data
 WHERE avg_followers < 500000;
 
 ## subquery in WHERE clause
 -- subquery in where clause are commonly used for filtering
 select *from posts;
 select distinct user_id from posts;
 
 -- Q.1: find user who have posts
 
SELECT username
    FROM users
    WHERE user_id IN (
			SELECT user_id
            FROM posts
	);
    
    SELECT user_id,username
    FROM users
    WHERE user_id IN (
			SELECT user_id
            FROM posts
	);
  
  SELECT user_id,username
    FROM users
    WHERE user_id IN (
    1,2,4,5,7);
    
    SELECT user_id,username
    FROM users
    WHERE user_id IN (
     select distinct user_id from posts);

   -- Q.2: find user without posts
 
SELECT username
    FROM users
    WHERE user_id NOT IN (
			SELECT user_id
            FROM posts
	);

  ## NESTED SUBQUERY:A Subquery can contain another subquery  
SELECT country
			 FROM users
             WHERE username = 'Rahul';
 ----------------------------------------------            -----------------------------
    SELECT AVG(followers)
        FROM users
    WHERE COUNTRY = ( 
			SELECT country
			 FROM users
             WHERE username = 'Rahul');
	--------------------------------------------------------------------------------------
		
   SELECT username, followers
    FROM users
    WHERE followers > ( 
		SELECT AVG(followers)
        FROM users
    WHERE COUNTRY = ( 
			SELECT country
			 FROM users
             WHERE username = 'Rahul')
             
		);
	

       
	