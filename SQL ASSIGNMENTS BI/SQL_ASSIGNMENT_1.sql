use superstore;

#TASK 1

#UDERSTANDING THE DATA

#DESCRIBING THE DATASET:
#This Detabasee named SampleSuperstore is consists of 5 tables in it namely cust_dimen(Containing details about the customer like name
#id etc with their Location details), market_fact (giving idea about market insights), Order_dimen (information about orders), prod_details
# (information regarding categories and sub categories of products) shipping_dimen(everything about shipping records)

# By applying proper and structured queries we can draw important results from given table from detaset which can help us in taking 
# various important decions and drawing ups and downs in various things like sales, profit etc. We can also Categorize complete data
# on the baisi of region, Categories , sub_categories and shipping Information.

# IDENTIFYING PRIMARY AND FOREIGN KEYS
		#1. Cust_id is Primary key for cust_dimen and there in no Foreign Key
		#2. Prod_id is Primary key for Prod_dimen and there is no foreign key
		#3. Ord_id will be primary key for order_dimen whereas Order_ID will be used as foreign key for shipping_dimen.
		#4. Ship_id is primary key and Order_ID is foreign key.
		#5. Ord_id,Prod_id,Ship_id and Cust_is are the foreign keys and there are no primary key.

#TASK 2

#BASIC AND ADVANCED ANALYSIS

# 1) Write a query to display the Customer_Name and Customer Segment using alias name “Customer Name", "Customer Segment" from table Cust_dimen.  
#ANS: 
select Customer_Name as 'Customer Name' , Customer_Segment as 'Customer Segment' from cust_dimen;

# 2) Write a query to find all the details of the customer from the table cust_dimen order by desc
#ANS:
select * from cust_dimen order by  Cust_Id desc;

# 3) Write a query to get the Order ID, Order date from table orders_dimen where ‘Order Priority’ is high
#ANS:
select Order_ID, Order_Date from orders_dimen 
	where Order_Priority = 'HIGH';

# 4) Find the total and the average sales (display total_sales and avg_sales
#ANS:
select sum(Sales) as total_sales, avg(Sales) as avg_sales from market_fact;
#total_sales are 14647187.904000023 and avg_sales are 1757.1002763915576

# 5) Write a query to get the maximum and minimum sales from maket_fact table
#ANS:
select min(Sales), max(Sales) from market_fact;
#Minimum sales are 2.24 and Maximum Sales are 89061.05

# 6) Display the number of customers in each region in decreasing order of no_of_customers. The result should contain columns Region, no_of_customers. 
#ANS:
select count(Cust_id) as no_of_customers, Region from cust_dimen 
	group by Region order by count(Cust_id) desc;

# 7) Find the region having maximum customers (display the region name and max(no_of_customers) 
#ANS: 
select Region , (count(Cust_id)) as 'max(no_of_customers)' from cust_dimen 
	group by Region order by count(Cust_id) desc 	
		limit 1;

# 8) Find all the customers from Atlantic region who have ever purchased ‘TABLES’ and the number of tables purchased (display the customer name, no_of_tables purchased)   
#ANS:

# 9) Find all the customers from Ontario province who own Small Business. (display the customer name, no of small business owners)
#ANS:
select Customer_Name from cust_dimen 	
	where Province = 'ONTARIO' and Customer_Segment = 'SMALL BUSINESS' ;

# 10) Find the number and id of products sold in decreasing order of products sold (display product id, no_of_products sold) 
#ANS:
select Prod_id, sum(Order_Quantity) as "no_of_products_sold"  from market_fact
	group by prod_id 
		order by sum(Order_Quantity) desc;

# 11) Display product Id and product sub category whose produt category belongs to Furniture and Technlogy. The result should contain columns product id, product sub category. 
#ANS:
select Prod_id as 'Product Id', Product_Sub_Category as 'Product Sub Category' 
	from prod_dimen 
		where Product_category = 'FURNITURE'; 
#Prod_5		OFFICE FURNISHINGS
#Prod_10	BOOKCASES
#Prod_11	TABLES
#Prod_15	CHAIRS & CHAIRMATS

# 12) Display the product categories in descending order of profits (display the product category wise profits i.e. product_category, profits)
#ANS:
select Product_Category, sum(Profit) 	
	from prod_dimen inner join market_fact 
		on prod_dimen.Prod_id = market_fact.Prod_id 
			group by Product_Category order by Profit desc ;
#TECHNOLOGY			886313.5200000014
#OFFICE SUPPLIES	524956.7699999997
#FURNITURE			75968.73000000004

# 13) Display the product category, product sub-category and the profit within each subcategory in three columns
#Ans:
select Product_Category, Product_Sub_Category, sum(Profit) 
	from prod_dimen 
		inner join market_fact 
			on prod_dimen.Prod_id = market_fact.Prod_id 
				group by Product_Sub_Category ;

# 14) Display the order date, order quantity and the sales for the order
#ANS:
select Order_Date , Order_Quantity, Sales 
	from orders_dimen inner join market_fact 
		on orders_dimen.Ord_id = market_fact.Ord_id;

# 15) Display the names of the customers whose name contains the i) Second letter as ‘R' ii) Fourth letter as ‘D’
#ANS:
select Customer_Name from cust_dimen 
	where instr(Customer_Name, 'R') =2 and instr(Customer_Name, 'D') = 4;

# 16) Write a SQL query to to make a list with Cust_Id, Sales, Customer Name and their region where sales are between 1000 and 5000.
#ANS: 
select m.Cust_id, m.Sales , c.Customer_Name 
	from market_fact as m inner join cust_dimen as c on m.Cust_id = c.Cust_id 
		where Sales between 1000 and 5000;

# 17) Write a SQL query to find the 3rd highest sales
#Ans: 
select Sales from market_fact 
	order by Sales desc 
		limit 1 offset 2;
# 3rd Highest Sales are 41343.21

# 18) Where is the least profitable product subcategory shipped the most? For the least profitable product sub-category, display the  region-wise no_of_shipments and the profit made in each region in decreasing order of profits (i.e. region, no_of_shipments, profit_in_each_region
#ANS:
select Region as "Name of Region", count(ship_id) as "Count of Shipments" , round(sum(Profit),3) as "Profit for Region" 
	from market_fact inner join cust_dimen on market_fact.Cust_id =cust_dimen.Cust_id 
		inner join prod_dimen on market_fact.Prod_id = prod_dimen.Prod_id 
			where Product_Sub_Category = 
										(select Product_Sub_Category from market_fact 
														inner join prod_dimen on market_fact.Prod_id = prod_dimen.Prod_id 
															group by Product_Sub_Category 
															order by sum(Profit) 
															limit 1) 
										group by Region 
										order by sum(Profit); 