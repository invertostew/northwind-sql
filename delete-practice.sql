USE northwind;

-- CHALLENGE 1
-- Write a statement to delete the order with id 30 from the orders table.
DELETE FROM orders WHERE id = 30;

-- DROP
ALTER TABLE
	invoices
DROP FOREIGN KEY fk_invoices_orders1;

ALTER TABLE
	orders
DROP FOREIGN KEY fk_orders_customers;

ALTER TABLE
	orders
DROP FOREIGN KEY fk_orders_employees1;

ALTER TABLE
	orders
DROP FOREIGN KEY fk_orders_orders_status1;

ALTER TABLE
	orders
DROP FOREIGN KEY fk_orders_orders_tax_status1;

ALTER TABLE
	orders
DROP FOREIGN KEY fk_orders_shippers1;

ALTER TABLE
	order_details
DROP FOREIGN KEY fk_order_details_orders1;

-- ADD
ALTER TABLE
	invoices
ADD CONSTRAINT
	fk_invoices_orders1
FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;

ALTER TABLE
	orders
ADD CONSTRAINT
	fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE;

ALTER TABLE
	orders
ADD CONSTRAINT
	fk_orders_employees1
FOREIGN KEY (status_id) REFERENCES orders_status(id) ON DELETE CASCADE;

ALTER TABLE
	orders
ADD CONSTRAINT
	fk_orders_orders_status1
FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;

ALTER TABLE
	orders
ADD CONSTRAINT
	fk_orders_orders_tax_status1
FOREIGN KEY (tax_status_id) REFERENCES orders_tax_status(id) ON DELETE CASCADE;

ALTER TABLE
	orders
ADD CONSTRAINT
	fk_orders_shippers1
FOREIGN KEY (shipper_id) REFERENCES shippers(id) ON DELETE CASCADE;

ALTER TABLE
	order_details
ADD CONSTRAINT
	fk_order_details_orders1
FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;

-- Finally...
DELETE FROM orders WHERE id = 30;

-- CHALLENGE 2
-- Delete any orders that are shipping to New York.
DELETE FROM orders WHERE ship_city = 'New York';

-- CHALLENGE 3
-- Delete any discontinued products from the product table.
DELETE FROM products WHERE discontinued = 1;

-- DROP
ALTER TABLE
	inventory_transactions
DROP FOREIGN KEY fk_inventory_transactions_products1;

ALTER TABLE
	purchase_order_details
DROP FOREIGN KEY fk_purchase_order_details_inventory_transactions1;

ALTER TABLE
	order_details
DROP FOREIGN KEY fk_order_details_products1;

ALTER TABLE
	purchase_order_details
DROP FOREIGN KEY fk_purchase_order_details_products1;

-- ADD
ALTER TABLE
	inventory_transactions
ADD CONSTRAINT
	fk_inventory_transactions_products1
FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE;

ALTER TABLE
	purchase_order_details
ADD CONSTRAINT
	fk_purchase_order_details_inventory_transactions1
FOREIGN KEY (inventory_id) REFERENCES inventory_transactions(id) ON DELETE CASCADE;

ALTER TABLE
	order_details
ADD CONSTRAINT
	fk_order_details_products1
FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE;

ALTER TABLE
	purchase_order_details
ADD CONSTRAINT
	fk_purchase_order_details_products1
FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE;

-- Finally...
DELETE FROM products WHERE discontinued = 1;


-- CHALLENGE 4
-- Pick a customer, delete them, any orders they have made, and any related data in the order_details table.


-- CHALLENGE 5
-- Delete the entire employee table.
DROP TABLE employees;


-- CHALLENGE 6
-- Delete the entire database
DROP DATABASE northwind;