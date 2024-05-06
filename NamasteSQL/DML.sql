--DML -> data Manipulation language
insert into amazon_orders values(1,'2022-10-01','Baby Milk',30.5,'UPI');
insert into amazon_orders values(2,'2022-10-02','Baby Powder',130,'Credit Card');

insert into amazon_orders values(3,'2022-10-01','Baby cream',30.5,'UPI');
insert into amazon_orders values(4,'2022-10-02','Baby soap',130,'Credit Card');

--to delete data
delete from amazon_orders;


-- to insert default value we cannot write query where we just pass values (if we do that we have to pass all values ottherwise error) passing '' or blank or null dont work
-- so we can specify the column name while passing an dnot include the default one or just say default in value place
insert into a_orders(order_id,order_date,product_name,total_price,payment_method) 
values(7,'2022-10-01','Shirts',132.5,'UPI');
insert into a_orders(order_id,order_date,product_name,total_price,payment_method) 
values(null,'2022-10-01','Shirts',132.5,default);

select * from a_orders ;


delete from amazon_orders; -- delete all data (rows)
delete from a_orders where product_name='jeans' ; --DML --delete with a filter condition


-------------- update-- DML
update a_orders
set discount=10; --updates all the rows with this value for column discount

update a_orders
set discount=10
where order_id=2;

update a_orders
set product_name='jeans2' , payment_method='CREDIT CARD'
where  product_name='jeans'
