#INVOICE PER COUNTRY

select co.country_name, count(*), avg(i.total_price)
from country co, city ci, customer cu, invoice i
where co.id = ci.country_id and ci.id = cu.city_id and cu.id = customer_id 
group by co.country_name
having avg(i.total_price)>(select avg(total_price) from invoice)
