use hr;
select * from employees;

-- Select Full Name of the Employee from the Table 
select concat(first_name,' ',last_name) as Full_Name from employees;
select concat_ws(' ',first_name,last_name) as Full_name from employees;

-- How Many employees are there working in this company
select count(employee_id) as total_employees from Employees;
select count(distinct(employee_id)) as Total_employees from employees;

-- create a view where and in that view fill the commission pct null values with ZERO
create view v1 as 
select *,case when commission_pct is null then 0 else commission_pct end as new_commision_pct
from employees;

select * from v1;


-- Count how many unique initials of phone number are present
select count(distinct(substring_index(phone_number,'.',1))) from employees;
-- which are they
select distinct(substring_index(phone_number,'.',1)) from employees;


-- Number of Employees per job id
select job_id , count(employee_id) No_of_employees from employees 
group by job_id order by No_of_employees desc;


-- How many Managers are there for each job id
select job_id, count(distinct(manager_id)) count_of_managers from employees 
group by job_id order by count_of_managers desc;


-- Average, min,max salary for each jop_id where number of employees are greater 5 or 5
select job_id, count(employee_id) as ce,avg(salary) as mean_sal,max(salary) as max_sal, min(salary) as min_sal from employees
group by job_id having ce >= 5 order by mean_sal desc;


-- How many employees of are having salary geater than avg salary of their department
select count(t2.employee_id) as No_of_emp from ( 
select *,avg(salary)over(partition by job_id) as d_avg_sal from employees)t2
where t2.salary > t2.d_avg_sal;

-- how many employees from each department are there who fits in above condition 
select job_id,count(employee_id) from (
select *,avg(salary)over(partition by job_id) as avg_sal_j from employees)t2
where t2.avg_sal_j < t2.salary
group by t2.job_id;


-- Add column of department name in employee table and store that in a view 
create view v2 as 
select  e.*,d.department_name  from employees e 
left join departments d
on e.department_id = d.department_id;

select * from v2;

-- How many Job Ids are there per department
select department_name,count(distinct(job_id)) from v2
group by department_name;

-- Select those departments whose employees are not present in employee table
select d.department_name from departments d 
left join employees e 
on d.department_id = e.department_id
where e.department_id is null;


-- Select the employees who are also workimg as manager
select distinct(concat(e1.first_name,' ',e1.last_name)) as name_of_manager, e2.department_id from employees e1 join employees e2
where e1.employee_id = e2.manager_id;


-- Select office location for each employee
select concat(e.first_name,' ',e.last_name) as Employee_name ,l.street_address,l.city,l.postal_code,c.country_name
from employees e left join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id
inner join countries c
on l.country_id = c.country_id;

-- Working span of Employees
select j.employee_id,concat_ws(' ',e.first_name,e.last_name) Employee_name, datediff(j.end_date,j.start_date) days_at_work 
from job_history j inner join employees e
on j.employee_id = e.employee_id
order by days_at_work desc;

-- In which Year and month how many employees were hired
select date_format(hire_date,'%Y-%M') year_of_hiring,count(employee_id) no_of_emp from employees
group by year_of_hiring order by year_of_hiring desc;


-- Higest paid employee from each department
select e1.department_id,e1.emp_name,e1.salary from
(select concat(first_name,' ',last_name) emp_name , department_id,salary,rank()over(partition by department_id order by salary desc) as srn 
from employees)e1
where e1.srn =1;


-- Top 3 employee from each department in terms of Pay scale
select e1.department_id,e1.emp_name,e1.salary from
(select concat(first_name,' ',last_name) emp_name , department_id,salary,rank()over(partition by department_id order by salary desc) as srn 
from employees)e1
where e1.srn <4;


-- How many offices are there in each country
select country_id,count(distinct(city)) from locations
group by country_id;


