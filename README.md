
## Tech Stack

[//]: # (I must include tools section and add tools images, check proper README design tutorial)
[//]: # (images and style from https://simpleicons.org/)
![MySQL](https://img.shields.io/badge/MySQL-2B2B2B?style=for-the-badge&logo=mySql)


## Table of Contents
- [Zetel Case Study (DMDD)](#zetel-case-study-dmdd)
- [Introduction](#introduction)
- [Questions Explored](#questions-explored)
- [Sample Queries and Results](#sample-queries-and-results)
- [Acknowledgements](#acknowledgements)


<a name="desc"></a>
# Zetel Case Study (DMDD)

(_MIS602-Data Modelling and Database Design Assignment1- Torrens University Australia_)

Exploratory Data Analysis using SQL to answer business requirements and extract key business information about Zetel Company.

During this project, the following  SQL concepts were covered along with many others:
* GROUP BY aggregate function
* Common Table Expressions (CTE)
* VIEWS
* JOIN and NESTED queries

<a name="intro"></a>
# Introduction
Zetel is a mobile phone company with a number of phones that are sold by staff to various clients. Each phone comes with a plan and each plan has a number of features specific to that plan including:
* a call charge in cents per minute (this does not apply to all plans)
* a plan duration in months
* a break fee if the customer leaves the plan before the end of the plan duration
* a monthly data allowance in gigabytes

The database contains seven (7) tables with many columns of data about Zetel Customers, Staffs, Infrastructures, services and its usage. The database nodel is as shown below:
![Screenshot (293)](https://user-images.githubusercontent.com/58152694/191609297-a0f9a135-9f76-4af1-b801-10474dcbeb20.png)

All Queries are available in the [script file](https://github.com/DeleLinus/Zetel-Case-Study-DMDD-/blob/master/answers_script.sql). and the queries and results compiled in the uploaded [document file](https://github.com/DeleLinus/Zetel-Case-Study-DMDD-/blob/master/Use%20Case%20Queries%20and%20Result.pdf)

<a name="qss"></a>
# Questions Explored
1. List the total number of connections made.
2. List all the staff whose address contains the character string ‘st’ ignoring the case.
3. List all the customers who are not active.
4. Which plan gives the second biggest data allowance?
5. List the staff who gets more than the average hourly rate.
6. List the top two selling plans.
7. List all the customers on “Extra small” plan. 
8. From which towerId was the most recent call made?
9. List all the customers who owned a phone of the same colour as the customer ‘Rajoo’
10. List all the customers (customer Id and name) having more than one mobile number.
11. The company decided to re-name the budget3 plan to budget3Extra.
    * How many customers will be affected? Show SQL to justify your answer.
    * Write an SQL query which will update the database to reflect the upgrades?
12. List the names of all the staff who have a supervisor, along with their supervisor’s name.
13. Who is the longest serving staff? Display the StaffId, full name, date joined and the total years served.
14. List all plans that have never been used by any customer. Show the query using:
    * Nested Query
    * SQL Join
15. List the customer ID, customer name, phone number and the total number of hours (assume call duration is in seconds) the customer was on the phone during August of 2019 from each phone number the customer owns. Order the list from highest to the lowest number of hours.
16. 
    * Create a view that shows the popularity of each plan (i.e. how many plans are on each phone).
    * Use this view in a query to determine the most popular plan.
17. List the total number of connections made on each tower location after 2018.
18. List all the details of the most recently joined and oldest joined Samsung phone user.
19. Produce a list of staff who joined on the same month.

<a name="sample"></a>
# Sample Queries and Results
Q-16
![Screenshot (294)](https://user-images.githubusercontent.com/58152694/191614369-6be8b643-83f6-4f30-a1d5-2cd006e407b8.png)

Q-14a and Q14b
![Screenshot (295)](https://user-images.githubusercontent.com/58152694/191615405-53f9e82d-2932-445c-91ab-6307658648f9.png)


<a name="ref"></a>
# Acknowledgements

 - [Torrens University, Australia](http://www.torrens.edu.au)

