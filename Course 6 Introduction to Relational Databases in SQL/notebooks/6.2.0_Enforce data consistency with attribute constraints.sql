-- SQLite

-- # 6.2.0 Enforce data consistency with attribute constraints

-- ## 6.2.3 Conforming with data types

-- Let's add a record to the table
INSERT INTO transactions (transaction_date, amount, fee) 
VALUES ('24/09/2018', 5454, '30');

-- Doublecheck the contents
SELECT *
FROM transactions;


-- ## 6.2.4 Type CASTs

-- Calculate the net amount as amount + fee
SELECT transaction_date, amount + CAST(fee AS integer) AS net_amount 
FROM transactions;


