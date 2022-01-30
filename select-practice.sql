USE northwind;

-- CHALLENGE 1
-- Write a query to get Product name and quantity per unit.
SELECT
	product_name,
    quantity_per_unit
FROM
	products;


-- CHALLENGE 2
-- Write a query to get a list of currently available products (id and name).
SELECT
	id,
    product_name
FROM
	products
WHERE
	discontinued = 0;


-- CHALLENGE 3
-- Write a query to get a list of discontinued products (id and name).
SELECT
	id,
    product_name
FROM
	products
WHERE
	discontinued = 1;


-- CHALLENGE 4
-- Write a query to get the name and price of the most expensive product.
SELECT
	product_name,
    list_price
FROM
	products
WHERE
	list_price = (SELECT MAX(list_price) FROM products);


-- CHALLENGE 5
-- Write a query to get the name and price of the least expensive product.
SELECT
	product_name,
    list_price
FROM
	products
WHERE
	list_price = (SELECT MIN(list_price) FROM products);


-- CHALLENGE 6
-- Write a query to get a list of products that cost less than $20.
SELECT
	product_name,
    list_price
FROM
	products
WHERE
	list_price < 20.00;


-- CHALLENGE 7
-- Write a query to get a list of products that cost between $15 and $25.
SELECT
	product_name,
    list_price
FROM
	products
WHERE
	list_price
BETWEEN
	15
AND
	25;


-- CHALLENGE 8
-- Write a query to get a list of the ten most expensive products.
SELECT
	product_name,
    list_price
FROM
	products
ORDER BY
	list_price DESC
LIMIT
	10;


-- CHALLENGE 9
-- Write a query to get the count of all the current products and then the count of all the discontinued products.
SELECT
	COUNT(product_name)
FROM
	products
WHERE
	discontinued = 0;

SELECT
	COUNT(product_name)
FROM
	products
WHERE
	discontinued = 1;
