# CASE STUDY 1: HUMAN RESOURCE DATA of ABC.Pvt.Ltd
<img src="https://img.shields.io/badge/Version%20-1-lightgrey">

**Here we were given with the data of HR department from ABC Company which consists of 6 different tables and we have performed various operations on this data to find some insights out of it.**

### Relations between these 6 tables are as follows

![image](https://user-images.githubusercontent.com/80534916/184295186-f4e3f85c-b413-4250-b3ca-93c739e9bdb8.png)


### Below are some insights from the data


1. There are total **107 Employees** working in ABC.Pvt.Ltd

2. **Commision_pct** column of the Employees table were having multiple **Null values** so we have filled those with ZERO and stored this in a **VIEW V1**

3. Employees were wroking on various job roles out of them top three job roles on which employees were hired was 
    * SA_REP with 30 Employees
    * SH_CLERK with 20 Employees
    * ST_CLERK with 20 Employees
    
    **Out of total 107 Employees 70 Employees are working on these 3 roles.**
 
4. There are total **18 Managers** in ABC.Pvt.Ltd out of which above mentioned 3 roles are having 5 Managers each and IT_PROG is having 3 managers
 
5. Talking about stats of salaries for those job roles on which 5 or more employees are employees 
 
     ![image](https://user-images.githubusercontent.com/80534916/184376435-1438d104-13f4-4e49-9763-ed7151b16733.png)
     
6. There are **43 Employees** who are having their salary as **greater than the average salaries** of all those who are working in their same job role.

7. **SA_REP** is the job role where maximum (i.e 15) employees are *satisfying above condition mentioed in point 6.*

8. Distinct Number of Job Roles in various departments

    ![image](https://user-images.githubusercontent.com/80534916/184384620-8bb7e34f-66f7-47e2-89a7-6f3c4de05606.png)

9. There are **few departments (Exactly 16)** in department table whose employees are not present in employee table.

10. **USA,CANADA,UK and GERMANY** are the 4 countries where the employees of employee table are working most of them are in USA follwed by UK,Canada and Gernmany respectively.

11. Heighest paid employees from each department

    ![image](https://user-images.githubusercontent.com/80534916/184385892-18f3d3ab-185e-4a2c-a72f-1c807397de37.png)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

<p align ="center">
<img src="http://ForTheBadge.com/images/badges/built-with-love.svg">
</p>

