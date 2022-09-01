use hr;
SELECT * FROM employees;

#Q.1) Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name" 
#Ans: 
select first_name as 'First Name' , last_name as 'Last Name' 
	FROM employees;

#Q.2) Write a query to get unique department ID from employee table
#Ans:
SELECT employee_id FROM employees; 

#Q.3) Write a query to get all employee details from the employee table order by first name, descending 
#Ans:
SELECT * FROM employees 
	order by first_name desc;

#Q.4) Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary) 
#Ans:
select first_name , last_name , salary, 0.15*salary as 'PF' 
	from employees;

#Q.5) Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary
#Ans:
select employee_id , first_name, last_name from employees 
	order by salary asc ;

#Q.6) Write a query to get the total salaries payable to employees
#Ans:
Select (salary - 0.15*salary) as 'payable ammount' 
	from employees;

#Q.7)Write a query to get the maximum and minimum salary from employees table 
#Ans
select max(salary) as 'Maximum' , min(salary) as 'Minimum' 
	From employees;
#Mimimum Salary = 24000.00 and Maximum Salary = 2100.00

#Q.8) Write a query to get the average salary and number of employees in the employees table 
#Ans:
select avg(salary) as 'Average Salary', count(employee_id) as 'Number of Employees' 
	from employees;
#Average Salary = 6461.682243 and # Number of Employees = 107

#Q.9) Write a query to get the number of employees working with the company 
#Ans:
select count(employee_id) as 'Number of employees' 
	from employees;
#Number of employees are 107

#Q.10) Write a query to get the number of jobs available in the employees table 
#Ans:
select count(job_id) as 'Number of jobs Available' 
	from employees;
#Number of Jobs Available are 107

#Q.11)  Write a query get all first name from employees table in upper case
#Ans:
select upper(first_name) from employees;

#Q.12) Write a query to get the first 3 characters of first name from employees table 
#Ans:
select left(first_name, 3) from employees;

#Q.13)Write a query to get first name from employees table after removing white spaces from both side  
#Ans:
select trim(first_name) from employees;

#Q.14)Write a query to get the length of the employee names (first_name, last_name) from employees table 
#Ans:
select length(first_name) as 'Lenghth of First Name', length(last_name) as 'Lenghth of Last Name' 
	from employees;

#Q.15)Write a query to check if the first_name fields of the employees table contains numbers 
#Ans:
select first_name from employees where first_name regexp '[0-9]';
#No Such Value Present

#Q.16) Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 
#Ans:
SELECT first_name, last_name, salary from employees 
	where salary not between 10000 and 15000;

#Q.17)  Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order 
#Ans:
SELECT first_name,last_name,department_id from employees 
	where (department_id = 30) or (department_id = 100) 
		order by first_name asc;

#Q.18) Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100 
#Ans:
select first_name,last_name, salary from employees 
	where (salary not in (10000,15000)) and 
								((department_id=30) or (department_id =100));

#Q.19) Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987
#Ans:
Select first_name , last_name,hire_date from employees 
	where 
		year(hire_date) = 1987;
#Steven King		1987-06-17
#Jennifer Whalen	1987-09-17

#Q.20) Write a query to display the first_name of all employees who have both "b" and "c" in their first name 
#Ans: 
select first_name from employees 
	where 
		(first_name like '%b%') and (first_name like '%c%');
#first_name of such employee is Bruce 

#Q.21) Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000
#Ans:
select last_name, job_id, salary from employees 
	where 
		(job_id in('IT_PROG', 'SH_CLERK')) and (salary not in (4500,10000,15000));

#Q.22) Write a query to display the last name of employees whose names have exactly 6 characters 
#Ans:
select last_name from employees 
	where length(last_name) = 6 ;

#Q.23)  Write a query to display the last name of employees having 'e' as the third character 
#Ans:
select last_name from employees 
	where instr(last_name, 'e') = 3 ; 

#Q.24) Write a query to get the job_id and related employee's id
#Ans:
select job_id, group_concat(employee_id) as Employee_ID from employees 
	group by job_id;

#Q.25) Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999' 
#Ans:
update employees set phone_number = replace(phone_number, '124' , '999') 
	where phone_number like '%124%';

#Q.26) Write a query to get the details of the employees where the length of the first name greater than or equal to 8 
#Ans:
select * from employees where length(first_name) >= 8;

#Q.27) Write a query to append '@example.com' to email field 
#Ans:
UPDATE employees 
	SET email = concat(email, '@example.com');

#Q.28) Write a query to extract the last 4 character of phone numbers
#Ans:
select right(phone_number,4) from employees;

#Q.29) Write a query to get the last word of the street address
#Ans:
select substring_index(street_address, ' ', -1) as Last_Word 
	from locations;

#Q.30)  Write a query to get the locations that have minimum street length
#Ans:
select * from locations where length(street_address) = 14;

#Q.31) Write a query to display the first word from those job titles which contains more than one words 
#Ans:
select substring_index(street_address, ' ', 1) as first_word 
	from locations;
    
#Q.32) Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position 
#Ans:
select length(first_name) from employees 
	where (instr(last_name, 'c') = 2);
#Lengths are 6,5,6,6.

#Q.33) Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names 
#Ans:
select first_name , length(first_name) from employees 
	where 
		(first_name like 'a%') or (first_name like 'j%') or (first_name like 'm%') order by first_name;

#Q.34) Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY
#Ans:
select first_name, lpad(salary, 10,'$') as salary from employees;

#Q.35) Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salar
#Ans:
select left(first_name,8), repeat('$', floor(salary/1000)) as salary 
	from employees;

#Q.36)  Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year 
#Ans: 
select employee_id , first_name, last_name, hire_date from employees where (date(hire_date) = 7  or month(hire_date)=7 );

use northwind;
#Q.1) Write a query to get Product name and quantity/unit 
#Ans:
select ProductName, QuantityPerUnit from products;

#Q.2) Write a query to get current Product list (Product ID and name)
#Ans:
select ProductID, ProductName from products 
	where discontinued = 'False' 
		order by ProductName;

#Q.3) Write a query to get discontinued Product list (Product ID and name) 
#Ans:
select ProductID, ProductName from products 
	where discontinued = 'True' order by ProductName;

#Q.4) Write a query to get most expense and least expensive Product list (name and unit price)
#Ans:
select ProductName, UnitPrice from products 
	order by UnitPrice desc ;

#Q.5)  Write a query to get Product list (id, name, unit price) where current products cost less than $20 
#Ans:
select ProductID, ProductName, UnitPrice from products 
	where UnitPrice < 20;

#Q.6) Write a query to get Product list (id, name, unit price) where products cost between $15 and $25 
#Ans:
select ProductID, ProductName, UnitPrice from products 
	where UnitPrice not between 15 and 25;

#Q.7) Write a query to get Product list (name, unit price) of above average price 
#Ans:
select ProductName, UnitPrice from products 
	where UnitPrice > (Select avg(UnitPrice) from products);

#Q.8) Write a query to get Product list (name, unit price) of ten most expensive products
#Ans:
select ProductName, UnitPrice from products 
	order by UnitPrice desc 
		limit 10;

#Q.9) Write a query to count current and discontinued products 
#Ans
select count(ProductName) from products 
	group by discontinued;
#Discontinued are 69 and Current are 8

#Q.10) Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order 
#Ans: 
select ProductName, UnitsOnOrder, UnitsInStock from products 
	where UnitsOnOrder < UnitsInStock;




