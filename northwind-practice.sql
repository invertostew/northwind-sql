USE northwind;

-- CHALLENGE 1
-- Show list of all discounted products
SELECT
	product_name,
    order_details.discount as discount
FROM
	products
JOIN
	order_details
ON
	products.id = order_details.product_id
WHERE
	discount > 0;


-- CHALLENGE 2
-- Show a list of products more expensive than $10 order from most expensive to cheapest
SELECT
	id,
    product_code,
    product_name,
    list_price
FROM
	products
WHERE
	list_price > 10
ORDER BY
	list_price DESC;


-- CHALLENGE 3
-- What is the most expensive product listed?
SELECT
	id,
    product_code,
    product_name,
	list_price
FROM
	products
WHERE
	list_price = (SELECT MAX(list_price) FROM products);


-- CHALLENGE 4
-- What is the least expensive product listed?
SELECT
	id,
    product_code,
    product_name,
	list_price
FROM
	products
WHERE
	list_price = (SELECT MIN(list_price) FROM products);


-- CHALLENGE 5
-- How much are the most expensive products in each category?
SELECT
	category,
    MAX(list_price) as highest_price
FROM
	products
GROUP BY
	category;


-- CHALLENGE 6
-- What is the company name of the supplier of the cheapest product?
SELECT
	company,
    list_price
FROM
	suppliers
INNER JOIN
	products
ON
	products.supplier_ids = suppliers.id
WHERE
	list_price = (SELECT MIN(list_price) FROM products)
LIMIT 1;
	

-- CHALLENGE 7
-- Show a list of employees who work in Sales
SELECT
	id,
	first_name,
    last_name,
    job_title
FROM
	employees
WHERE
	job_title LIKE '%sales%';


-- CHALLENGE 8
-- How many employees exist with job roles below Sales manager?
SELECT
    COUNT(job_title) as number_of_employees
FROM
	employees
WHERE
	job_title NOT IN ('Vice President, Sales', 'Sales Manager');


-- CHALLENGE 9
-- Show number of purchase orders created in the last month
SELECT
	COUNT(creation_date) as number_of_purchase_orders
FROM
	purchase_orders
WHERE
	MONTH(DATE(creation_date)) = MONTH(CURDATE()) - 1;


-- CHALLENGE 10
-- Show the total paid to suppliers in the last month


