-- SQLite

-- # 6.1.0 Your first database

-- ## 6.1.3 Query information_schema with SELECT

-- Query the right table in information_schema, Specify the correct table_schema value
SELECT table_name 
FROM information_schema.tables
WHERE table_schema = 'public';

-- With SQLite3
SELECT name, sql 
FROM sqlite_master
WHERE type='table'
ORDER BY name;
   
-- Query the right table in information_schema to get columns
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'university_professors' AND table_schema = 'public';

-- Query the first five rows of our table
SELECT * 
FROM university_professors 
LIMIT 5;


-- ## 6.1.4 CREATE your first few TABLEs

DROP TABLE IF EXISTS professors;

-- Create a table for the professors entity type
CREATE TABLE professors (
    firstname text,
    lastname text
);

-- Print the contents of this table
SELECT * 
FROM professors

DROP TABLE IF EXISTS universities;

-- Create a table for the universities entity type
CREATE TABLE universities (
    university_shortname text,
    university text text,
    university_city text
);

-- Print the contents of this table
SELECT * 
FROM universities


-- ## 6.1.5 ADD a COLUMN with ALTER TABLE

-- Add the university_shortname column
ALTER TABLE professors
ADD COLUMN university_shortname text;

-- Print the contents of this table
SELECT * 
FROM professors


