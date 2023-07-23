-- SQLite

-- # 7.4.0_Database Management

-- ## 7.4.2 Create a role

-- Create a data scientist role
CREATE ROLE data_scientist;

-- Create a role for Marta
Create a data scientist role

-- Create an admin role
CREATE ROLE admin WITH CREATEDB CREATEROLE;


-- ## 7.4.3 GRANT privileges and ALTER attributes

-- Grant data_scientist update and insert privileges
GRANT UPDATE, INSERT ON long_reviews TO data_scientist;

-- Give Marta's role a password
ALTER ROLE marta WITH PASSWORD 's3cur3p@ssw0rd';


