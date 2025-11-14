--KPI Total Orders
SELECT COUNT(*) AS total_orders
FROM orders

-- KPI Total Customers
SELECT *
FROM orders

SELECT COUNT(DISTINCT user_id) AS total_customers
FROM orders;

-- KPI TOTAL REVENUE
SELECT *
FROM products

SELECT products.product_name,
      SUM(products.unit_price * orders.quantity) AS total_revenue	  
FROM orders
INNER JOIN products USING(product_id)
GROUP BY products.product_name

-- KPI AVERAGE ORDER VALUE

SELECT  
    SUM(products.unit_price * orders.quantity) / COUNT(DISTINCT orders.order_id) AS average_order_value
FROM orders
INNER JOIN products ON orders.product_id = products.product_id;

--Q1 What are the top 5 departments by revenue
SELECT *
FROM departments

SELECT departments.department,
    SUM(products.unit_price * orders.quantity) AS total_revenue
FROM orders
INNER JOIN products USING (product_id)
INNER JOIN departments USING (department_id)
GROUP BY departments.department 
ORDER BY total_revenue DESC
LIMIT 5;

--Q2 What are the top 3 products we sold the most during the weekends?
SELECT *
FROM  orders

SELECT products.product_name,
    SUM(orders.quantity) AS total_quantity_sold
FROM orders
INNER JOIN products USING (product_id)
WHERE EXTRACT(DOW FROM orders.order_date) IN (1, 6)
GROUP BY products.product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

--Q3 Does bread generate more profits than alcoholic products?
SELECT CASE
			WHEN (departments.department = 'bakery' AND aisle.aisle ILIKE '%bread%') THEN 'Bread Product'
			WHEN departments.department = 'alcohol' THEN 'Alcoholic Product'
			ELSE 'Other Products'
		END AS product_category,
		SUM(products.unit_price * orders.quantity) AS revenue
FROM products
INNER JOIN departments USING(department_id)
INNER JOIN aisle USING(aisle_id)
INNER JOIN orders USING(product_id)
WHERE CASE
			WHEN (departments.department = 'bakery' AND aisle.aisle ILIKE '%bread%') THEN 'Bread Product'
			WHEN departments.department = 'alcohol' THEN 'Alcoholic Product'
			ELSE 'Other Products'
		END != 'Other Products'
GROUP BY product_category;

--Q4 Which products have not been sold at all?
SELECT *
FROM products

SELECT products.product_id,
    products.product_name
FROM products
LEFT JOIN orders USING (product_id)
WHERE orders.product_id IS NULL;


SELECT products.product_name,
       aisle.aisle,
	   departments.department
FROM products
INNER JOIN departments using(department_id)
INNER JOIN aisle USING (aisle_id)
WHERE (departments.department = 'bakery' AND aisLe.aisLe ILIKE 'bread')
   OR departments.department ='alcohol'

--CASE is working as if in SQL

SELECT CASE
WHEN (departments.department = 'bakery' AND aisLe.aisLe ILIKE '%bread%') THEN 'Bread Product'
WHEN  (departments.department) = 'alcohol' THEN 'Alcoholic Product'
ELSE 'Other Products'
END AS product_category,
		SUM(products.unit_price * orders.quantity) AS revenue
FROM products
INNER JOIN departments USING(department_id)
INNER JOIN aisle USING(aisle_id)
INNER JOIN orders USING(product_id)
WHERE CASE
			WHEN (departments.department = 'bakery' AND aisle.aisle ILIKE '%bread%') THEN 'Bread Product'
			WHEN departments. department = 'alcohol' THEN 'Alcoholic Product'
			ELSE 'Other Products'
		END != 'Other Products'
GROUP BY product_category




















