--string functions

select dept_id,STRING_AGG(emp_name,';' )  WITHIN GROUP (ORDER BY salary desc) as list_of_employees
from employee
group by dept_id;



select order_id,customer_name
,trim(' ankit bansal ')
,reverse(customer_name) as rev
,REPLACE(order_id,'CA','PB') as replace_ca
,REPLACE(customer_name,' ','') as replace_space
,TRANSLATE(customer_name,'AC','B@') as translate_AG
,len(customer_name) as len_name
,left(customer_name,4) as name_4
,right(customer_name,5) as name_5
--,SUBSTRING(order_id,4,4) as order_year
,left(customer_name,CHARINDEX(' ',customer_name)) as first_name
,CHARINDEX(' ',customer_name) as space_position
,CHARINDEX('n',customer_name) as first_position
,concat(order_id,'-',customer_name)
,order_id+'-'+customer_name 
from orders;

--2- write a query to print first name and last name of a customer using orders table(everything after first space can be considered as last name)
--customer_name, first_name,last_name
select customer_name , trim(SUBSTRING(customer_name,1,CHARINDEX(' ',customer_name))) as first_name
, SUBSTRING(customer_name,CHARINDEX(' ',customer_name)+1,len(customer_name)-CHARINDEX(' ',customer_name)+1) as second_name
from orders


--4- write a query to print customer name and no of occurence of character 'n' in the customer name.
--customer_name , count_of_occurence_of_n
select customer_name , len(customer_name)-len(replace(lower(customer_name),'n','')) as count_of_occurence_of_n
from orders
