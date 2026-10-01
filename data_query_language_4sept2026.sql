use bankingdb;

DROP TABLE IF EXISTS student;

CREATE TABLE IF NOT EXISTS student (
    stud_id varchar(50),stud_name varchar(50),address varchar(50),
    city varchar(50)
);

insert into student values(1,'Shashank','RJPM','Lucknow');

alter table student add column DOB date;

desc student;

alter table student modify column stud_name varchar(100);
desc student;
alter table student drop column city;
desc student;
DROP TABLE IF EXISTS teacher;

create table if not exists teacher(
teacher_id int(50), teacher_name varchar(100), hiring_date date,
age int, salary int(100)
);

desc teacher;

insert into teacher values(1,'kamal','2021-08-09',28,50000),
(2,'Reshma','2020-12-12',34,67000),
(3,'Ujjwal','2023-11-23',25,15000),
(4,'Jay','2025-11-10',30,56000);

select *from teacher;

select *from student;

desc student;

alter table student add constraint pk_stud_id primary key(stud_id);

-- rename column --
-- syntax: alter table <table_name> rename column <old column_name> to <new column_name>;
alter table student rename column stud_name to name;

Insert into student values('s01','Gaurav','Dharampeth','2005-10-10'),
('s02','Kunal','Reshimbag','1999-10-08'),('s03','Farhan','Mominpura','1997-12-10'),
('s04','Vaibhav','Vayusena Nagar','2000-11-14'),('s05','Vishal','Pratap Nagar','2009-08-07'),
('s06','Kumar','Ravi Nagar','2005=02-05'),('s07','Dinesh','Sitabuldi','1996-12-12'),
('s08','Tanushree','Medical Square','2009-12-13');

select *from student;

-- how to count total records of table --
-- alias declaration --
select count(*) as 'Number of Students'
from student;

select DOB,month(DOB),monthname(DOB),dayname(DOB),dayofweek(DOB),curdate() as 'Today Date',
datediff(curdate(),DOB) as 'number of day till today', year(datediff(curdate(),DOB)) as 'year'
from student;
-- 1. Create the employee table
CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(100),
    City VARCHAR(50),
    salary INT
);

-- 2. Insert some sample data
INSERT INTO employee VALUES 
    (101, 'Amit', 'Nagpur', 45000),
    (102, 'Priya', 'Pune', 55000),
    (103, 'Rahul', 'Nagpur', 48000),
    (104, 'Sneha', 'Mumbai', 60000),
    (105, 'Ravi', 'Pune', 52000);

-- 3. Now run your original queries
SELECT * FROM employee;



select City,count(*) as 'Number of Employee'
from employee
group by City
order by City desc;

