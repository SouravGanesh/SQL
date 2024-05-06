--6- write a query to print 3 columns : category, total_sales and (total sales of returned orders)
select o.category,sum(o.sales) as total_sales
,sum(case when r.order_id is not null then sales end) as return_orders_sales
from orders o
left join returns r on o.order_id=r.order_id
group by category

--7- write a query to print below 3 columns
--category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020)
select category,sum(case when datepart(year,order_date)=2019 then sales end) as total_sales_2019
,sum(case when datepart(year,order_date)=2020 then sales end) as total_sales_2020
from orders 
group by category

--if profit < 100 then 'low profit' elseif profit > 100 then 'profit' else end
select order_id,profit,
case
when profit < 100 then 'Low Profit'
when profit < 250 then 'Medium Profit'
when profit < 400 then 'High Profit'
else 'Very high profit'
end as profit_category
,case
when  profit < 0 then 'Loss'
when profit  >= 100 and profit < 250 then 'Medium Profit'
when profit < 100 then 'Low Profit'
when profit >=250 and profit < 400 then 'High Profit'
else 'Very high profit'
end as profit_category
from orders
;
