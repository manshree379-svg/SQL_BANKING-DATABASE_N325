-- to select the database --
use n325_db;

create database ds;

-- drop the database
drop database ds;

-- Command to create table
CREATE table IF NOT exists employee
(
    emp_id int, emp_name varchar(20),salary double,hiring_date date
);

 -- describe the structure of table --
 desc employee; 
 
 insert into employee(emp_id,emp_name,hiring_date) values(1,'Suresh','2026-08-27');
 
 select *from employee;
 select emp_name from employee;
 
 
 