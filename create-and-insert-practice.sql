USE northwind;

-- CREATE EXERCISES

-- CHALLENGE 1
-- Create a table called countries with 3 columns, country_id, country_name and region_id.
CREATE TABLE countries (
	country_id INT,
    country_name VARCHAR(56),
    region_id INT
);


-- CHALLENGE 2
-- Insert a record into your country table and confirm that record exists.
INSERT INTO countries
VALUES (1, 'United Kingdom', 1);

SELECT * FROM countries;


-- CHALLENGE 3
-- Remove the countries table and write a statement to create the same table again, but none
-- of the fields should be able to contain null, confirm this by trying to add a null record
DROP TABLE countries;

CREATE TABLE countries (
	country_id INT NOT NULL,
    country_name VARCHAR(56) NOT NULL,
    region_id INT NOT NULL
);

INSERT INTO countries
VALUES (null, null, null);


-- CHALLENGE 4
-- Remove the countries table and create it again. This time make sure that only the countries
-- 'Italy', 'India' and 'China' are valid entries
DROP TABLE countries;

CREATE TABLE countries (
	country_id INT NOT NULL,
    country_name ENUM('Italy', 'India', 'China'),
    region_id INT NOT NULL
);

INSERT INTO countries
VALUES (1, 'Italy', 1);

INSERT INTO countries
VALUES (2, 'India', 2);

INSERT INTO countries
VALUES (3, 'China', 3);

INSERT INTO countries
VALUES (4, 'Not in the list', 4);

SELECT * FROM countries;


-- CHALLENGE 5
-- Delete and recreate the table. This time make sure nthat no duplicate data against column
-- country_id will be allowed at the time of insertion.
DROP TABLE countries;

CREATE TABLE countries (
	country_id INT NOT NULL UNIQUE,
    country_name ENUM('Italy', 'India', 'China'),
    region_id INT NOT NULL
);

INSERT INTO countries
VALUES (1, 'Italy', 1);

INSERT INTO countries
VALUES (1, 'India', 2);

SELECT * FROM countries;


-- CHALLENGE 6
-- Recreate the table, but this time make the country a key field. This can also be used to
-- prevent duplicate data.
DROP TABLE countries;

CREATE TABLE countries (
	country_id INT PRIMARY KEY,
    country_name ENUM('Italy', 'India', 'China'),
    region_id INT NOT NULL
);

INSERT INTO countries
VALUES (1, 'Italy', 1);

INSERT INTO countries
VALUES (1, 'India', 2);

SELECT * FROM countries;


-- CHALLENGE 7
-- Recreate the table with the country_id as the primary key with auto increment.
-- Insert a few records to ensure it is auto-incrementing.
DROP TABLE countries;

CREATE TABLE countries (
	country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name ENUM('Italy', 'India', 'China'),
    region_id INT NOT NULL
);

INSERT INTO countries (country_name, region_id)
VALUES ('Italy', 1);

INSERT INTO countries (country_name, region_id)
VALUES ('India', 2);

INSERT INTO countries (country_name, region_id)
VALUES ('China', 3);

SELECT * FROM countries;


-- CHALLENGE 8
-- Write a statement to create a table named jobs. It should have the following columns:
-- job_id, job_title, min_salary, max_salary make sure that the salary cannot exceed 25000.
CREATE TABLE jobs (
	job_id INT PRIMARY KEY AUTO_INCREMENT,
    job_title VARCHAR(80) NOT NULL,
    min_salary INT NOT NULL,
    max_salary INT NOT NULL,
    CHECK (max_salary <= 25000)
);

SELECT * FROM jobs;

INSERT INTO jobs (job_title, min_salary, max_salary)
VALUES ('Some job', 18000, 22000);

INSERT INTO jobs (job_title, min_salary, max_salary)
VALUES ('Some job', 23500, 25500);

SELECT * FROM jobs;


-- CHALLENGE 9
-- Write an SQL statement that creates a job_history table with the following columns:
-- employee_id, start_date, end_date, job_id, department_id and make sure that
-- start_date and end_date are DATE data types.
CREATE TABLE job_history (
	employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id INT,
    department_id INT
);

SELECT * FROM job_history;


-- INSERT EXERCISES
-- Set up table
CREATE TABLE insert_practice (
	country_id VARCHAR(2),
    country_name VARCHAR(40),
    region_id DECIMAL(10, 0)
);

-- CHALLENGE 1
-- Write an SQL statement to insert a record with your own value into the countries
-- against each column.
INSERT INTO insert_practice
VALUES ('1', 'United Kingdom', 10);

SELECT * FROM insert_practice;


-- CHALLENGE 2
-- Write an SQL statement to insert 3 rows in a single insert statement
TRUNCATE TABLE insert_practice;

INSERT INTO insert_practice
VALUES ('1', 'United Kingdom', 10),
	   ('2', 'Hong Kong', 20.5),
       ('3', 'Italy', 1234);

SELECT * FROM insert_practice;
