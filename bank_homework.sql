-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework

-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes
CREATE TABLE payments (
  id serial PRIMARY KEY,
  created_at DATE,
  amount NUMERIC,
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode TEXT;

-- Insert 5 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments (created_at, amount, payer_name, description)
  VALUES ('2012-01-01',300, 'Joe', 'Deposit');
INSERT INTO payments (created_at, amount, payer_name, description)
  VALUES ('2016-01-21' , 1.2, 'Joe', 'Deposit');
INSERT INTO payments (amount, payer_name, recipient_name, description)
  VALUES (500, 'Joe', 'Jill', 'Rent');
INSERT INTO payments (amount, payer_name, recipient_name)
  VALUES (1.75, 'Paul', 'Jill');
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description)
  VALUES ('2015-01-20', 1000.75, 'Rodger', 'Sam', 'Blackmail');


-- You receive notice that the payment with id of 4 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments
SET amount = amount + 10
WHERE id = 4;

-- Delete all payments with an amount under $2
DELETE FROM payments
WHERE amount < 2;

-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT *
FROM payments
ORDER BY amount DESC;


-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name
FROM payments;

-- In a single query, select all payments created in the past week
SELECT *
FROM payments
WHERE created_at > current_date - 7
AND created_at < current_date;

-- In a single query, select all payments with a blank description
SELECT *
FROM payments
WHERE description IS NULL;

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT *
FROM payments
WHERE payer_name = 'Joe';
