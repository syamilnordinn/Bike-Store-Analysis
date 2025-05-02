--Highest sales by month
SELECT DATEPART(year, order_date) as year, DATEPART(month, order_date) as month, SUM(((1-discount)*list_price)*quantity) sale
FROM PortfolioProject.dbo.orders as o
JOIN PortfolioProject.dbo.order_items as oi
ON o.order_id = oi.order_id
GROUP BY DATEPART(year, order_date), DATEPART(month, order_date)
ORDER BY year, sale

--Top brand by sales
SELECT brand_name, ROUND(SUM((1-discount)*quantity*oi.list_price),2 ) as sales
FROM PortfolioProject.dbo.brands as b
JOIN PortfolioProject.dbo.products as p
ON p.brand_id = b.brand_id
JOIN PortfolioProject.dbo.order_items as oi
ON oi.product_id = p.product_id
GROUP BY brand_name
ORDER BY sales DESC

--Store that produce highest sales
SELECT store_name, ROUND(SUM((1-discount)*list_price*quantity), 2) sales
FROM PortfolioProject.dbo.stores as s
JOIN PortfolioProject.dbo.orders as o
ON o.store_id = s.store_id
JOIN PortfolioProject.dbo.order_items as oi
ON oi.order_id = o.order_id
GROUP BY store_name
ORDER BY sales DESC


--Staff with highest sales (each store)
SELECT s.store_id, first_name, last_name, ROUND(SUM(discount*list_price*quantity), 2) as sales
FROM PortfolioProject.dbo.staffs as s
JOIN PortfolioProject.dbo.orders as o
ON s.staff_id = o.staff_id
JOIN PortfolioProject.dbo.order_items as oi
ON oi.order_id = o.order_id
GROUP BY s.store_id, first_name, last_name
ORDER BY s.store_id, sales DESC

--Staff who made no sales(unlucky)
SELECT staff_id 
FROM PortfolioProject.dbo.staffs 
EXCEPT 
SELECT staff_id
FROM PortfolioProject.dbo.orders

--OR

SELECT staff_id
FROM PortfolioProject.dbo.staffs 
WHERE staff_id NOT IN
(SELECT staff_id
FROM PortfolioProject.dbo.orders)

--Most popular bike category
SELECT c.category_name, ROUND(SUM(oi.list_price*quantity*discount),2 ) as sales
FROM PortfolioProject.dbo.categories as c
JOIN PortfolioProject.dbo.products as p
ON c.category_id = p.category_id
JOIN PortfolioProject.dbo.order_items as oi
ON oi.product_id = p.product_id
GROUP BY c.category_name, c.category_id
ORDER BY sales DESC

--Most popular product(by number of purchase)
SELECT product_name, SUM(quantity) as quan_bought
FROM PortfolioProject.dbo.order_items as oi
JOIN PortfolioProject.dbo.products as p
ON oi.product_id = p.product_id
GROUP BY product_name
ORDER BY (quan_bought) DESC

--Product that are bougth more than one per order
SELECT product_name, COUNT(order_id) num_order
FROM PortfolioProject.dbo.products as p
JOIN PortfolioProject.dbo.order_items as oi
ON oi.product_id = p.product_id
WHERE quantity > 1
GROUP BY product_name
ORDER BY num_order DESC

--Customer who ordered mutiple times in the same month
SELECT DATEPART(year, order_date) as year, DATEPART(month, order_date) as month, c.customer_id, first_name, COUNT(order_id)
FROM PortfolioProject.dbo.orders as o
JOIN PortfolioProject.dbo.customers as c
ON o.customer_id = c.customer_id
GROUP BY  DATEPART(year, order_date), DATEPART(month, order_date), c.customer_id, first_name
HAVING COUNT(order_id) > 1


--Highest selling products
SELECT p.product_name, ROUND(SUM(oi.list_price*quantity*discount), 2) as sales
FROM PortfolioProject.dbo.brands as b
JOIN PortfolioProject.dbo.products as p
ON p.brand_id = b.brand_id
JOIN PortfolioProject.dbo.order_items as oi
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY sales DESC

--Customers with most orders made
SELECT first_name, last_name, COUNT(order_id) as ttl_orders
FROM PortfolioProject.dbo.orders as o
JOIN PortfolioProject.dbo.customers as c
ON c.customer_id = o.customer_id
GROUP BY first_name, last_name
ORDER BY ttl_orders DESC

--Customers who spend the most
SELECT first_name, last_name, SUM(list_price*quantity*discount) as spend
FROM PortfolioProject.dbo.orders as o
JOIN PortfolioProject.dbo.customers as c
ON c.customer_id = o.customer_id
JOIN  PortfolioProject.dbo.order_items as oi
ON oi.order_id = o.order_id
GROUP BY first_name, last_name
ORDER BY spend DESC

--Cumulative revenue of per month for the particular year
SELECT DATEPART(year, order_date) as year, DATEPART(month, order_date) as month, list_price*(1-discount)*quantity, SUM(list_price*(1-discount)*quantity)OVER(PARTITION BY DATEPART(year, order_date), DATEPART(month, order_date) ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) running_ttl
FROM PortfolioProject.dbo.orders as o
JOIN PortfolioProject.dbo.order_items as oi
ON o.order_id = oi.order_id
ORDER BY year, month

--Cumulative revenue per year
WITH x as
(SELECT DATEPART(year, order_date) as year, DATEPART(month, order_date) as month, SUM((1-discount)*list_price*quantity) as sale
FROM PortfolioProject.dbo.orders as o
JOIN PortfolioProject.dbo.order_items as oi
ON o.order_id = oi.order_id
GROUP BY DATEPART(year, order_date), DATEPART(month, order_date))

SELECT year, month, sale, SUM(sale)OVER(PARTITION BY year ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_sale
FROM x

--Top 3 selling products per category
WITH z as
(SELECT category_name, product_name, SUM((1-oi.discount)*oi.list_price*quantity) as sale
FROM  PortfolioProject.dbo.categories as c
JOIN  PortfolioProject.dbo.products as p
ON c.category_id = p.category_id
JOIN PortfolioProject.dbo.order_items as oi
ON oi.product_id = p.product_id
GROUP BY category_name, product_name)

SELECT *
FROM
(SELECT category_name, product_name, DENSE_RANK()OVER(PARTITION BY category_name ORDER BY sale DESC) as ranking
FROM z) as g
WHERE ranking BETWEEN 1 AND 3
ORDER BY category_name, ranking

--Products that never get sold
SELECT product_name
FROM PortfolioProject.dbo.products 
WHERE product_id NOT IN
(SELECT product_id
FROM PortfolioProject.dbo.order_items
WHERE quantity > 0)



