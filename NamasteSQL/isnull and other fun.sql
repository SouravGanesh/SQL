--null handling function
select order_id,city,isnull(city,'unknown') as new_city,
isnull(sales,1) as new_city,
state,coalesce(city,state,region,'unknown') as neww_city
from orders
--where city is null
order by city;

select top 5 order_id,sales,cast(sales as int) as sales_int
,round(sales,1) as sales_int from orders;


--Run below script to create drivers table:

create table drivers(id varchar(10), start_time time, end_time time, start_loc varchar(10), end_loc varchar(10));
insert into drivers values('dri_1', '09:00', '09:30', 'a','b'),('dri_1', '09:30', '10:30', 'b','c'),('dri_1','11:00','11:30', 'd','e');
insert into drivers values('dri_1', '12:00', '12:30', 'f','g'),('dri_1', '13:30', '14:30', 'c','h');
insert into drivers values('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h');

--3- write a query to print below output using drivers table. 
--Profit rides are the no of rides where end location of a ride is same as start location of immediate next ride for a driver
--id, total_rides , profit_rides
select d1.id as driver_id,count(*) as total rides,count(d2.id) as profit_rides
from drivers d1
left join drivers d2
on d1.id=d2.1d and d1.end_loc = d2.start_loc and d1.end_time = d2.start_time
group by d1.id;


--Window Functions
select id, count(1) as total_rides
,sum(case when end_loc=next_start_location then 1 else 0 end ) as profit_rides
from (
select *
, lead(start_loc,1) over(partition by id order by start_time asc) as next_start_location
from drivers) A
group by id;

--Or

with rides as (
select *,row_number() over(partition by id order by start_time asc) as rn
from drivers)
select r1.id , count(1) total_rides, count(r2.id) as profit_rides
from rides r1
left join rides r2
on r1.id=r2.id and r1.end_loc=r2.start_loc and r1.rn+1=r2.rn
group by r1.id
