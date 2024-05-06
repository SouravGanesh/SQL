--1- write a query to get region wise count of return orders
select o.region, count(distinct o.order_id) from orders o
inner join returns r
on o.order_id = r.order_id
group by o.region

--2- write a query to get category wise sales of orders that were not returned
select o.category, sum(o.sales) from orders o
left join returns r
on o.order_id = r.order_id
where r.order_id is null
group by o.category

--3- write a query to print dep name and average salary of employees in that dep .
select dep_name, avg(salary) from employee e
inner join dept d
on e.dept_id = d.dep_id
group by dep_name

--4- write a query to print dep names where none of the emplyees have same salary.
select dep_name from employee e
inner join dept d
on e.dept_id = d.dep_id
group by dep_name
having count(*) = count(distinct salary)

--5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)
select o.sub_category from orders o
left join returns r
on o.order_id = r.order_id
group by o.sub_category
having count(distinct return_reason) = 3
--6- write a query to find cities where not even a single order was returned.
select o.city from orders o
left join returns r
on o.order_id = r.order_id
group by o.city
having count(r.order_id)=0
--7- write a query to find top 3 subcategories by sales of returned orders in east region
select top 3 o.sub_category, sum(sales) from orders o
left join returns r
on o.order_id = r.order_id
where region = 'East'
group by o.sub_category
order by sum(sales)  desc
--8- write a query to print dep name for which there is no employee
select dep_name from dept d 
full outer join employee e
on d.dep_id = e.dept_id
group by dep_name
having count(emp_id) =0

--9- write a query to print employees name for dep id is not avaiable in dept table
select emp_name from employee e
full outer join dept d
on e.dept_id = d.dep_id
where d.dep_id is null

--9- write a query to print emp name, manager name and senior manager name (senior manager is manager's manager)
select e1.emp_name,e2.emp_name as manager_name,e3.emp_name as senior_manager_name
from employee e1
inner join employee e2 on e1.manager_id=e2.emp_id
inner join employee e3 on e2.manager_id=e3.emp_id

--3- orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order.
--write a query to find order ids where there is only 1 product bought by the customer.
select order_id
from orders 
group by order_id
having count(*)=1

--4- write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly reporting to him.
select e2.emp_name as manager_name , string_agg(e1.emp_name,',') as emp_list
from employee e1
inner join employee e2 on e1.manager_id=e2.emp_id
group by e2.emp_name


-- database joins
select o.order_id,o.product_id,r.return_reason
from orders o
inner join returns r on o.order_id=r.order_id;


select o.order_id,o.product_id,r.return_reason, r.order_id as return_order_id
from orders o
left join returns r on o.order_id=r.order_id
;

select r.return_reason,sum(sales) as total_sales
from orders o
inner join returns r on o.order_id=r.order_id
group by r.return_reason;

--cross join
select e.emp_id,e.emp_name,e.dept_id,d.dep_name from 
employee e
inner join dept d on e.dept_id=d.dep_id;

select e.emp_id,e.emp_name,e.dept_id,d.dep_name from 
employee e
left join dept d on e.dept_id=d.dep_id

select e.emp_id,e.emp_name,e.dept_id,d.dep_id,d.dep_name from 
employee e
right join dept d on e.dept_id=d.dep_id;

select e.emp_id,e.emp_name,e.dept_id,d.dep_name from 
dept d
left join employee e on e.dept_id=d.dep_id;

select e.emp_id,e.emp_name,e.dept_id,d.dep_id ,d.dep_name from 
dept d
full outer join employee e on e.dept_id=d.dep_id;

select o.order_id,o.product_id,r.return_reason,p.manager
from orders o
left join returns r on o.order_id=r.order_id
inner join people p on o.region=p.region;
