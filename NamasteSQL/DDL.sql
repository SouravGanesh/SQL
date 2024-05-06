--SQL--> structured query language
--Database are like drives in our system
--schemas are like folders in the drive



--create database called namastesql> right click on database and enter the name
--before running select proper database in top left
--create schema> go to your database>security>right click on schema and create new

--DDL - > data definition language


/*
data types--
integer -> 1,2,3,-1,-2
date - > '2020-11-01'
varchar(100) - > 'baby milk'
decimal(5,2) -> 123.45
*/


create table amazon_orders
(
order_id integer,
order_date date,
product_name varchar(100),
total_price decimal(6,2),
payment_method varchar(20)
);

---constraints

create table a_orders
(
order_id integer  NOT NULL, -- not null constarint
order_date date ,
product_name varchar(100) UNIQUE, -- unique constraint (IT CAN BE NULL AS WELL BUT NOT MORE THAN 1 TIME)
total_price decimal(6,2) ,
payment_method varchar(20) check (payment_method in ('UPI','CREDIT CARD')) default 'UPI', --check constraint with default added
discount integer check (discount<=20) , --check constraint,
category varchar(20) default 'Mens Wear' --default constarint (if said as 'default' in insertion this will be put)
primary key (order_id,product_name) -- primary key can be combination of one or more column && primary key is ..unique + not null constaint
);


--delete a table
drop table amazon_orders;



--change data type of a column
alter table amazon_orders alter column order_date datetime; --DDL
alter table amazon_orders alter column order_id date; --DDL data type should be compatible

alter table amazon_orders alter column product_name varchar(20); --DDL data type should be compatible
alter table amazon_orders alter column order_date datetime; --DDL data type should be compatible
--if table is empty we can change from any datetype to any other compatible data type
--we can change from any datetype to varchar


--add a column in a existing table
alter table amazon_orders add username varchar(20);
alter table amazon_orders add category varchar(20);

--delete a column from an existing table
alter table amazon_orders drop column category ;
