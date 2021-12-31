use superstore;

select * from orders_dimen;
select count(Order_ID) from orders_dimen;
select count(Order_ID) from orders_dimen where Order_priority = 'HIGH';
select Order_priority,count(Order_ID) from Orders_dimen group by Order_priority;
select Order_priority,count(Order_ID) from Orders_dimen group by Order_priority having Order_priority <> 'HIGH';
select Order_priority,count(Order_ID) from Orders_dimen group by Order_priority order by count(Order_ID) desc;
select distinct Order_priority from Orders_dimen;
select * from Orders_dimen limit 10;






