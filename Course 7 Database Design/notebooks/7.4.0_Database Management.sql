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


-- ## 7.4.4 Add a user role to a group role

-- Add Marta to the data scientist group
GRANT data_scientist TO marta;

-- Remove Marta from the data scientist group
REVOKE data_scientist FROM marta;


-- ## 7.4.8 Creating vertical partitions

-- Create a new table called film_descriptions
CREATE TABLE film_descriptions(
    film_id INT,
    long_description TEXT
);

-- Copy the descriptions from the film table
INSERT INTO film_descriptions
SELECT film_id, long_description FROM film;


-- ## 7.4.8 Creating vertical partitions

-- Create a new table called film_descriptions
CREATE TABLE film_descriptions(
    film_id INT,
    long_description TEXT
);

-- Copy the descriptions from the film table
INSERT INTO film_descriptions
SELECT film_id, long_description FROM film;

-- Drop the column in the original table
ALTER TABLE film 
DROP COLUMN long_description;

-- Join to create the original table
SELECT * 
FROM film 
JOIN film_descriptions USING(film_id);




