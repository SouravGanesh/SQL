--Run the following command to add and update dob column in employee table
alter table  employee add dob date;
SELECT *FROM employee;
update employee set dob = dateadd(year,-1*emp_age,getdate());
SELECT *FROM employee;

--1- write a query to print emp name , their manager name and diffrence in their age (in days)  
--for employees whose year of birth is before their managers year of birth
select e1.emp_name as emp_name, e2.emp_name as manager_name, datediff(day, e1.dob, e2.dob) as diff_age
from employee e1
inner join employee e2
on e1.manager_id = e2.emp_id
where DATEPART(year,e1.dob) < DATEPART(year,e2.dob)

--2- write a query to find subcategories who never had any return orders in the month of november (irrespective of years)
select sub_category
from orders o
left join returns r on o.order_id=r.order_id
where DATEPART(month,order_date)=11
group by sub_category
having count(r.order_id)=0;

--5- write a query to get number of business days between order_date and ship_date (exclude weekends). 
--Assume that all order date and ship date are on weekdays only
select order_id,order_date,ship_date ,datediff(day,order_date,ship_date)-2*datediff(week,order_date,ship_date) as no_of_business_days
from 
orders

--8- write a query print top 5 cities in west region by average no of days between order date and ship date.
select top 5 city, avg(datediff(day,order_date,ship_date) ) as avg_days
from orders
where region='West'
group by city
order by avg_days desc

select order_id,order_date,ship_date
,datediff(day,order_date,ship_date) as date_diff_days
,datediff(week,order_date,ship_date) as date_diff_days
from orders;


/*
dateadd(day,5,order_date) as order_date_5
,dateadd(week,5,order_date) as order_date_week_5
,dateadd(day,-5,order_date) as order_date_week_5_minus

from orders;
/*,datepart(yy,order_date) as year_of_order_date
,datepart(month,order_date) as month_of_order_date
,datepart(week,order_date) as week_of_order_date


,DATENAME(month,order_date) as month_name
,DATENAME(weekday,order_date) as week_name*/
