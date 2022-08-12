# SQL Case Study I : Danny's Dinner 
**Source :  [Weekly SQL Challenge](https://8weeksqlchallenge.com/case-study-1/)**

## Introduction

Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.

Danny’s Diner is in need of our assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.

## Problem Statement

Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.

Danny has provided us with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!

Danny has shared with you 3 key datasets for this case study:

* sales
* menu
* members

Entity relationship diagram and example data below.

![image](https://user-images.githubusercontent.com/80534916/184412846-88380224-9190-4936-8159-18182e224e28.png)

## Case Study Questions

Each of the following case study questions can be answered using a single SQL statement:

1. What is the total amount each customer spent at the restaurant?
    * Customer A : 76
    * Cutomer B : 74
    * Customer C: 36

2. How many days has each customer visited the restaurant?
    * Customer A : 6 Days
    * Cutomer B : 6 Days
    * Customer C: 3 Days

3. What was the first item from the menu purchased by each customer?
    * Customer A : Sushi
    * Cutomer B : Curry
    * Customer C: Ramen

4. What is the most purchased item on the menu and how many times was it purchased by all customers?
    * Sushi : 3 Orders
    * Curry : 4 Orders
    * Ramen: 8 Orders

5. Which item was the most popular for each customer?
    * Customer A : Sushi
    * Cutomer B : All are equaly popular
    * Customer C: Ramen

6. Which item was purchased first by the customer after they became a member?
    * Customer A : Curry (ID:2) (Date: 07-01-2021)
    * Cutomer B : Sushi (ID:1) (Date: 11-01-2021)

7. Which item was purchased just before the customer became a member?
    * Customer A : Sushi
    * Cutomer B : Curry

8. What is the total items and amount spent for each member before they became a member?
    * Customer A : 25
    * Cutomer B : 40

9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
    * Customer A : 860
    * Cutomer B : 940
    * Customer C: 360

10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
    * Customer A : 1020
    * Cutomer B : 440


### Join All The Things
![image](https://user-images.githubusercontent.com/80534916/184415955-b525c035-b9e3-472e-b167-7fb2b9973fe9.png)

