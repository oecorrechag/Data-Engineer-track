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


-- ## 6.2.6 Change types with ALTER COLUMN

-- Select the university_shortname column
SELECT DISTINCT(university_shortname) 
FROM professors;

-- Specify the correct fixed-length character type
-- ALTER TABLE professors
-- ALTER COLUMN university_shortname
-- TYPE char(3);

-- Change the type of firstname
-- ALTER TABLE professors
-- ALTER COLUMN firstname
-- TYPE varchar(64);



