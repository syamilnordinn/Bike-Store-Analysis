🚴 Bike Sales Analysis SQL Project
This project performs exploratory data analysis (EDA) on a retail bike sales database using SQL. The dataset contains information on products, orders, customers, staff, and stores. Various queries are written to generate sales insights, customer behaviors, and staff performance.

📂 Dataset Overview
Tables involved:

orders

order_items

customers

staffs

stores

products

brands

categories

stocks

Keys & Relationships: (Refer to the attached file bike_sales_schema.pdf for detailed table relationships and primary-foreign key mappings.)

🎯 Analysis Goals
Find top-performing products and categories.

Identify customers who spend the most.

Track sales performance by store and staff.

Detect products that never get sold.

Analyze revenue trends over months and years.

📊 SQL Queries Performed
Query Purpose	SQL Section
🔝 Highest sales per month	--Highest sales by month
🏆 Top selling brands	--Top brand by sales
🏬 Best performing stores	--Store that produce highest sales
🧑‍💼 Staff with highest sales per store	--Staff with highest sales (each store)
🙅‍♂️ Staff who made no sales	--Staff who made no sales (unlucky)
🚴 Most popular bike categories	--Most popular bike category
📦 Most purchased products	--Most popular product(by number of purchase)
➕ Products bought multiple times per order	--Product that are bougth more than one per order
🔁 Customers ordering multiple times a month	--Customer who ordered mutiple times in the same month
💰 Highest selling products	--Highest selling products
🧍 Customers with most orders	--Customers with most orders made
💸 Customers who spend the most	--Customers who spend the most
📈 Cumulative revenue per month (yearly)	--Cumulative revenue of per month for the particular year
📈 Cumulative revenue per year	--Cumulative revenue per year
🥇 Top 3 products per category	--Top 3 selling products per category
❌ Products never sold	--Products that never get sold

📦 Key Highlights & Insights
Top Brands & Stores: Revealed the leading brands and stores driving the highest sales.

Staff Performance: Identified top sellers and staff members who had zero sales activity.

Customer Behavior: Discovered repeat customers and top spenders.

Product Trends:

Best-selling categories and products.

Products frequently bought in bulk.

Unpopular products that never sold.

Sales Trends: Calculated cumulative revenue per month and year to spot growth patterns.

🗂️ Project Structure
File	Description
BikeStore.Query.sql	SQL queries for all analysis
BikeStore.Schema.png	Database schema with keys and relations
Bike.Store.Relationship.pdf	SQL queries for defining foreign keys to build relationship
README.md	This documentation file

🛠️ Tools Used
SQL Server Management Studio (SSMS) for query execution

T-SQL (Transact-SQL) features like:

JOIN

GROUP BY

WINDOW FUNCTIONS (e.g., SUM() OVER(), DENSE_RANK())

SUBQUERY

EXCEPT, NOT IN for exclusion queries

🚀 How to Use
Load the database (PortfolioProject.dbo) into your SQL Server.

Open BikeStore.Query.sql.

Execute queries section by section to get insights.

Refer to bike_sales_schema.pdf if you need clarity on table keys and relationships.

🔥 Next Possible Enhancements
Visualize the data using Power BI or Tableau.

Create stored procedures for reusable reports.


👤 Author
Muhammad Syamil Nordin
(SQL Analyst & Power BI Enthusiast)
This project is part of my SQL portfolio showcasing real-world business data analysis.