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


-- ## 6.2.7 Convert types USING a function

-- Convert the values in firstname to a max. of 16 characters
-- ALTER TABLE professors 
-- ALTER COLUMN firstname 
-- TYPE varchar(16)
-- USING SUBSTRING(firstname FROM 1 FOR 16)


-- ## 6.2.9 Disallow NULL values with SET NOT NULL

-- Disallow NULL values in firstname
-- ALTER TABLE professors 
-- ALTER COLUMN firstname SET NOT NULL;

-- Disallow NULL values in lastname
-- ALTER TABLE professors 
-- ALTER COLUMN lastname SET NOT NULL;


-- ## 6.2.11 Make your columns UNIQUE with ADD CONSTRAINT

-- Make universities.university_shortname unique
-- ALTER TABLE universities
-- ADD CONSTRAINT university_shortname_unq UNIQUE(university_shortname);

-- Make organizations.organization unique
-- ALTER TABLE organizations
-- ADD CONSTRAINT organization_unq UNIQUE(organization);
