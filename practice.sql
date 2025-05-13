/*
Project: Banking Database SQL Practice  
Author: Mohammed Akeek  
Description:  
This project simulates a simple banking system with the following tables:  
- customer  
- branch  
- employee  
- account  
- transaction  

Purpose:  
Practice basic to intermediate SQL skills, including table creation, data manipulation, and querying with joins, aggregations, and constraints.

Note:  
All data is fictional and created for educational purposes only.
*/

-- Create Customer Table
CREATE TABLE customer(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
fname VARCHAR(50),
lname VARCHAR(50),
birth_date DATE,
address VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50),
postal_code VARCHAR (10)
);

-- Create branch Table
CREATE TABLE branch (
branch_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50)
);

-- Create employee Table
CREATE TABLE employee (
emp_id INT AUTO_INCREMENT PRIMARY KEY,
fname VARCHAR(50),
lname VARCHAR (50),
start_date DATE,
end_date DATE,
superior_emp_id INT,
dept_id INT,
assigned_branch_id INT,
FOREIGN KEY(superior_emp_id) REFERENCES employee(emp_id),
FOREIGN KEY(assigned_branch_id) REFERENCES branch(branch_id)
);

-- Create account Table
CREATE TABLE account (
account_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
open_date DATE,
balance DECIMAL(10,2),
branch_id INT,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
);

-- Create transaction Table
CREATE TABLE txn(
txn_id INT AUTO_INCREMENT PRIMARY KEY,
txn_date DATE,
account_id INT,
txn_type_cd VARCHAR(3),
amount DECIMAL(10,2),
FOREIGN KEY (account_id) REFERENCES account(account_id)
);

-- Insert sample customers
INSERT INTO customer (fname, lname, birth_date, address, city, state, country, postal_code)
VALUES
('Michael', 'Maynard', '1986-11-01', '4939 Alex Landing', 'East Maryton', 'ID', 'UAE', '25141'),
('Scott', 'Robinson', '1989-04-29', '42578 Danielle Stravenue Suite 733', 'Port Meagan', 'KS', 'UAE', '60653'),
('Gregory', 'Nixon', '2006-06-10', '0398 Jordan Park', 'Delacruzbury', 'VA', 'UAE', '95088'),
('Emily', 'Henderson', '1961-04-22', '107 Jackson Unions', 'New Madison', 'LA', 'UAE', '57327'),
('Katherine', 'Heath', '2003-06-09', '106 Wood Mount Suite 468', 'Hernandezfurt', 'MI', 'UAE', '34956'),
('David', 'Davis', '1969-03-14', '75238 Hall Branch Suite 058', 'Lake Sara', 'IN', 'UAE', '41206'),
('Bill', 'Randall', '1987-11-01', '3539 Flores Coves Suite 802', 'New Courtney', 'MT', 'UAE', '07551'),
('Jose', 'Jenkins', '1997-10-18', '2338 Shannon Skyway', 'Port Justinmouth', 'WA', 'UAE', '74069'),
('Emily', 'Diaz', '2005-05-17', '77240 Judy Bridge', 'Wallacestad', 'OR', 'UAE', '80872'),
('Maria', 'Brown', '1995-08-13', '89865 Aaron Run', 'Richardsonmouth', 'OH', 'UAE', '29374'),
('Thomas', 'Watts', '2000-12-24', '5191 William Flats', 'Lake Benjaminburgh', 'TX', 'UAE', '11476'),
('Jessica', 'Lopez', '1982-01-30', '2626 Curtis Glen Apt. 219', 'Lake Sharonland', 'FL', 'UAE', '77513');


-- Insert sample branch
INSERT INTO branch (branch_id, name, address)
VALUES 
  (1, 'Downtown', '123 Main St'),
  (2, 'Uptown', '456 Elm St'),
  (3, 'Suburb', '789 Maple Ave');
  
-- Insert sample employee
INSERT INTO employee (emp_id, fname, lname, start_date, end_date, superior_emp_id, dept_id, assigned_branch_id)
VALUES
  (1, 'Alice', 'Smith', '2015-01-15', NULL, NULL, 1, 1),
  (2, 'Bob', 'Johnson', '2016-03-10', NULL, 1, 2, 1),
  (3, 'Carol', 'White', '2017-06-22', NULL, 1, 1, 2),
  (4, 'David', 'Brown', '2019-08-01', NULL, 3, 2, 2);

-- Insert sample account
  INSERT INTO account (account_id, customer_id, open_date, balance, branch_id)
VALUES
  (101, 1, '2022-01-01', 5000.00, 1),
  (102, 2, '2022-02-15', 1500.50, 2),
  (103, 3, '2022-03-20', 2300.75, 3),
  (104, 4, '2022-04-05', 890.00, 1),
  (105, 5, '2022-05-12', 300.00, 2);

-- Insert sample transaction
  INSERT INTO txn (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES
  (1, '2022-02-01', 101, 'CDT', 500.00),
  (2, '2022-02-03', 102, 'CDT', 150.75),
  (3, '2022-02-05', 101, 'DBT', 200.00),
  (4, '2022-02-10', 103, 'CDT', 100.00),
  (5, '2022-02-11', 104, 'CDT', 75.50),
  (6, '2022-02-12', 105, 'DBT', 25.00),
  (7, '2022-02-13', 101, 'CDT', 1000.00);
  
-- Show all customers from the UAE
SELECT *
FROM customer 
WHERE country = 'UAE';

-- Get total balance per branch
SELECT branch_id, SUM(balance) AS total_balance
FROM account
GROUP BY branch_id;

-- Find transactions with amount greater than 500
SELECT *
FROM txn
WHERE amount > 500;

-- Get top 5 customers ordered by last name
SELECT *
FROM customer
ORDER BY lname
LIMIT 5;

-- Get all employees who started after 2016
SELECT *
FROM employee
WHERE start_date > '2016-01-01';

-- Get customer name with their account IDs
-- From this point onward, we will use table aliases (e.g., 'c' for customer, 'a' for account)--in queries for simplicity and readability.
SELECT c.fname, c.lname, a.account_id
FROM customer c
JOIN account a ON c.customer_id = a.customer_id;

-- Get employees with their branch name
SELECT e.fname, e.lname, b.name AS branch_name
FROM employee e
JOIN branch b on e.assigned_branch_id = b.branch_id;

-- Total balance held in each branch
SELECT b.name, SUM(a.balance) AS total_balance
FROM account a
JOIN branch b ON a.branch_id = b.branch_id 
GROUP BY b.name;

-- Number of customers per city
SELECT city, COUNT(*) AS total_customers
FROM customer
GROUP BY city;

-- Average transaction amount by transaction type
SELECT txn_type_cd, AVG(amount) AS avg_amount
FROM txn
GROUP BY txn_type_cd;

-- Find customers who have a balance above average
SELECT c.fname, c.lname, a.balance
FROM customer c
JOIN account a ON c.customer_id = a.customer_id
WHERE a.balance > (
SELECT AVG(balance) 
FROM account 
);

-- list of employees without a manager
SELECT *
FROM employee
WHERE superior_emp_id IS NULL;

-- Update an account balance
UPDATE account SET balance = balance + 100 
WHERE account_id = 101;

-- Delete a transaction with txn_id=7
DELETE FROM txn
WHERE txn_id = 7;

-- List of customers who do not have account
SELECT * 
FROM Customer c
LEFT JOIN account a on c.customer_id = a.customer_id
WHERE a.account_id IS NULL;

-- Inserting a transaction with zero amount
INSERT INTO txn(txn_date, account_id, txn_type_cd, amount)
VALUES ('2024-05-01', 101,'CDT',200.00);

-- Inser a customer without any accout
INSERT INTO customer(fname, lname, birth_date, address, city, state, country, postal_code)
VALUES('Test','User','1996-01-01','No Street', 'Test City','Test State','UAE','0000');

-- Total deposits (CDT) and total withdrawals (DBT) for each account
SELECT 
account_id,
SUM(CASE WHEN txn_type_cd = 'CDT'THEN amount ELSE 0 END) AS total_deposits,
SUM(CASE WHEN txn_type_cd = 'DBT'THEN amount ELSE 0 END) AS total_Withdrawls
FROM txn
GROUP BY account_id;

-- FInd top 3 customers by total balance
SELECT c.fname, c.lname, SUM(a.balance) AS total_balance
FROM customer c
JOIN account a ON c.customer_id = a.customer_id
GROUP BY c.customer_id
ORDER BY total_balance DESC
LIMIT 3;

-- Monthly transaction summary (for 2022)
SELECT 
DATE_FORMAT(txn_date, '%y-%m') AS month,
COUNT(*) AS txn_count,
SUM(amount) AS total_amount
FROM txn
WHERE txn_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY month
ORDER BY month;

-- Create a view for customer-account summary
CREATE VIEW customer_account_summary AS
SELECT 
c.customer_id,
CONCAT(c.fname,' ',c.lname) AS customer_name,
a.account_id,
a.balance,
b.name AS branch_name
FROM customer c
JOIN account a ON c.customer_id = a.customer_id
JOIN branch b ON a.branch_id = b.branch_id;

-- Check for accounts with negative balances
SELECT *
FROM account
WHERE balance < 0;

-- Identify duplicate customer names
-- This begins a series of duplicate checks. Similar checks can be applied to other tables like employee, account, txn, and branch 
-- to ensure data consistency. Only customer duplicates are shown here for brevity.
SELECT fname, lname, COUNT(*)
FROM customer
GROUP BY fname, lname
HAVING COUNT(*) > 1;




