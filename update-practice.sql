USE northwind;

-- CHALLENGE 1
-- Write a statement to change the email of every employee to 'not available'.
UPDATE
	employees
SET
	email_address = 'not available';

-- Confirm
SELECT
	email_address
FROM
	employees;


-- CHALLENGE 2
-- Write a statement to change the email of every employee to 'classified' and set everybody's first_name to Dave.
UPDATE
	employees
SET
	email_address = 'classified',
    first_name = 'Dave';

-- Confirm
SELECT
	email_address,
    first_name
FROM
	employees;


-- CHALLENGE 3
-- Write a statement to change email to 'super top secret' and last_name to McSalesman for employees who's job_title is Sales Representative.
UPDATE
	employees
SET
	email_address = 'super top secret',
    last_name = 'McSalesman'
WHERE
	job_title = 'Sales Representative';

-- Confirm
SELECT
	email_address,
    last_name,
    job_title
FROM
	employees
WHERE
	job_title = 'Sales Representative';


-- CHALLENGE 4
-- Write a statement to change the webpage of all the employees in Seattle to the Wikipedia page for Seattle.
UPDATE
	employees
SET
	web_page = 'https://en.wikipedia.org/wiki/Seattle'
WHERE
	city = 'Seattle';

-- Confirm
SELECT
	city,
    web_page
FROM
	employees
WHERE
	city = 'Seattle';


-- CHALLENGE 5
-- Elizabeth Andersen recently married Roland Wacker. They have requested that you update the customer table to reflect the fact that Roland has taken Elizabeth's last name.
UPDATE
	customers
SET
	last_name = 'Andersen'
WHERE
	first_name = 'Roland'
AND
	last_name = 'Wacker';

-- Confirm
SELECT
	first_name,
    last_name
FROM
	customers
WHERE
	last_name = 'Andersen';


-- CHALLENGE 6
-- They also request that you change the ship_name and ship_address on any orders that have not yet shipped to Roland. The ship name should reflect Roland's new last_name. The new address should match Elizabeth's.

-- Get the relevant info to update
SELECT
	ship_name,
    ship_address,
    ship_city,
    ship_state_province,
    status_id,
    status_name as ship_status
FROM
	orders as o
INNER JOIN
	order_details_status as od
ON
	o.status_id = od.id
WHERE
	ship_name = 'Roland Wacker'
OR
	ship_name = 'Roland Andersen'
OR
	ship_name = 'Elizabeth Andersen';

-- Update Roland's name + address where NOT shipped already
UPDATE
	orders
SET
	ship_name = 'Roland Andersen',
    ship_address = '123 8th Street',
    ship_city = 'Portland',
    ship_state_province = 'OR'
WHERE
	ship_name = 'Roland Wacker'
AND
	status_id != 3;
