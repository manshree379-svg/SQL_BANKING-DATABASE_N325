create database  BankingDB;

use BankingDB;

CREATE table IF NOT EXISTS Customers(
	CustomerID int, FirstName varchar(50),
    LastName varchar(50), Email varchar(100),
    Phone varchar(20)
);

desc Customers;

 -- to add new column 'AccountcreationDate'--->DATE--
alter table Customers
add AccountCreationDate date;

insert into Customers
(CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate)
values(101,'Raj','kurve','raj',9881004242,'2025-10-25');

-- to retrieve data from table--
-- syntax: Select * from <table_Name>; --
select *from Customers;

select FirstName,Email,AccountCreationDate
from Customers;


