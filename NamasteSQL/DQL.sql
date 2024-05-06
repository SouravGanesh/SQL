-- DQL -> data querying language
select * from amazon_orders;
--limiting columns or selecting specific columns
select product_name,order_date,total_price from amazon_orders;
--limiting rows
select top 1 * from amazon_orders;
--data sorting
select * from amazon_orders
order by order_date desc,product_name,payment_method asc;



--Import excel to database for future 
--right click on your database>tasks>import data>data source=excel> datafile path> destination = ole db provider for sql server

select * from orders;
