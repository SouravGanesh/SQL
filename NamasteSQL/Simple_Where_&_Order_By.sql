
--1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
select * from orders where customer_name like '_a_d%';
--2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 
select * from orders where order_date between '2020-12-01' and '2020-12-31';
--3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)
select * from orders where ship_mode not in ('Standard Class', 'First Class') and ship_date > '2020-11-30';
--4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)
select * from orders where customer_name not like 'A%n';
--5- write a query to get all the orders where profit is negative (1871 rows)
select * from orders where profit < 0;
--6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
select * from orders where profit = 0 or quantity < 3;
--7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers (815 rows)
select * from orders where region = 'South' and discount>0;
--8- write a query to find top 5 orders with highest sales in furniture category 
select top 5 * from orders where category = 'Furniture' order by sales desc;
--9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)
select * from orders where category in ('Furniture', 'Technology') and order_date between '2020-01-01' and '2020-12-31';
--10-write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)
select * from orders where order_date between '2020-01-01' and '2020-12-31' and ship_date between '2021-01-01' and '2021-12-31';


--- filtering null values 
select * from orders
where city is null;
select * from orders
where city is not null ;


select top 5*
from orders 
order by order_date desc;

--to get distinct value of a column
select distinct order_date from orders
order by order_date;

select distinct ship_mode,segment from orders;

select distinct * from orders;
---filters-----
select * from orders
where ship_mode='First Class';

select * from orders
where order_date='2020-12-08';

select order_date,quantity 
from orders
where quantity != 5
order by quantity desc;


select * from orders
where order_date < '2020-12-08'
order by order_date desc
;


select * from orders
where order_date between '2020-12-08' and '2020-12-12'
order by order_date desc

select * from orders
where quantity between 3 and 5
order by quantity desc;

select distinct ship_mode from orders
where ship_mode in ('First Class','Same Day');


select * from orders
where quantity in (3, 5 , 4)
order by quantity desc;

select distinct ship_mode from orders
where ship_mode not in ('First Class','Same Day');


select distinct ship_mode from orders
where ship_mode >= 'Second Class'

select order_date, ship_mode,segment from orders
where ship_mode = 'First Class' and segment='Consumer'


select order_date, ship_mode,segment from orders
where ship_mode = 'First Class' or segment='Consumer'

select distinct ship_mode from orders
where ship_mode in ('First Class','Same Day');

select * from orders
where ship_mode = 'First Class' or ship_mode='Same Day'; --or filter always increase rows

select * from orders where quantity>5 and order_date<'2020-11-08' -- and will decrease;

select *,profit/sales as ratio,profit*sales,getdate() as total
from orders
where order_date between  '2022-11-01 12:00:00' and  '2022-11-01 12:40:00'
order by order_date
;
--pattern matching like operator
select order_id,order_date,customer_name
from orders
where customer_name like 'Chris%';

select order_id,order_date,customer_name
from orders
where customer_name like '%t';

select order_id,order_date,customer_name
from orders
where customer_name like '%ven%';


select order_id,order_date,customer_name,upper(customer_name) as name_upper
from orders
where upper(customer_name) like 'A%A' ;


select order_id,order_date,customer_name
from orders
where customer_name like '_l%' ;
--%--0 or more any characters
-- _ - > one character

select order_id,order_date,customer_name
from orders
where customer_name like 'C[albo]%'


select order_id,order_date,customer_name
from orders
where customer_name like 'C[^albo]%';


select order_id,order_date,customer_name
from orders
where order_id like 'CA-20[][1-2]%'
order by customer_name
