use dannys_diner;
select * from sales;
select * from members;
select * from menu;

-- What is the total amount each customer spent at the restaurant?
select distinct(s.customer_id),sum(m.price)over(partition by s.customer_id) as total_amount
from sales s join menu m 
on s.product_id = m.product_id;

-- How many days has each customer visited the restaurant?
select distinct(customer_id) ,count(order_date) as 'No.of Days visisted' from sales
group by customer_id;

-- What was the first item from the menu purchased by each customer?
select t2.customer_id,t2.product_name from (
select distinct(s.customer_id),row_number()over(partition by s.customer_id) rn,m.product_name 
from sales s inner join menu m
on s.product_id = m.product_id)t2
where t2.rn=1;


-- What is the most purchased item on the menu and how many times was it purchased by all customers?
select m.product_name, count(s.product_id) as "No.of.Orders"
from sales s join menu m 
on s.product_id = m.product_id
group by m.product_name;


-- Which item was the most popular for each customer?
select customer_id,product_id,max(no_of_orders) no_of_orders from (
select customer_id,product_id,count(product_id) no_of_orders from sales group by customer_id,product_id order by customer_id)t1
group by customer_id;


-- Which item was purchased first by the customer after they became a member?

select s.customer_id,s.order_date,s.product_id from sales s
join members m 
on s.customer_id = m.customer_id
where s.order_date >= m.join_date
group by customer_id;


-- Which items were purchased just before the customer became a member?
select s.customer_id,max(s.order_date),s.product_id from sales s
join members m 
on s.customer_id = m.customer_id
where s.order_date < m.join_date
group by customer_id;

-- What is the total items and amount spent for each member before they became a member?
select distinct(b.customer_id),sum(m.price)over(partition by b.customer_id) as total from 
(select s.customer_id,s.order_date,s.product_id from sales s
join members m 
on s.customer_id = m.customer_id
where s.order_date < m.join_date) b join menu m 
on b.product_id = m.product_id;

-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select customer_id , sum(points) as total_points from (
select s.customer_id,
case 
	when s.product_id = 1 then m.price*20 else m.price*10 end as points
from sales s join menu m 
on s.product_id = m.product_id)t1
group by customer_id;


-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
select customer_id,sum(total_points) from
(select s.customer_id, 
case when datediff(s.order_date,m.join_date) <= 7 then mm.price*20 else mm.price*10 end as total_points
from sales s 
join members m on s.customer_id = m.customer_id
join menu mm on s.product_id = mm.product_id
where datediff(s.order_date,m.join_date)>=0 and month(s.order_date)=1)t1
group by customer_id;


-- Join All The Things
select s.*,m.product_name,m.price, 
case
	when datediff(s.order_date,mm.join_date)>0 then 'YES' else "No" end as Membership 
from sales s left join members mm on s.customer_id = mm.customer_id
join menu m on s.product_id = m.product_id
order by s.customer_id,order_date


