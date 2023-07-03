-- SQLite

-- # 6.2.0 Enforce data consistency with attribute constraints

-- ## 6.2.3 Conforming with data types

-- Let's add a record to the table





-- Doublecheck the contents













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


-- ## 6.1.7 RENAME and DROP COLUMNs in affiliations

-- Rename the organisation column
ALTER TABLE affiliations
RENAME COLUMN organisation TO organization;

-- Delete the university_shortname column
ALTER TABLE affiliations
DROP COLUMN university_shortname;


-- ## 6.1.8 Migrate data with INSERT INTO SELECT DISTINCT

-- Insert unique professors into the new table
INSERT INTO professors 
SELECT DISTINCT firstname, lastname, university_shortname 
FROM university_professors;

-- Doublecheck the contents of professors
SELECT * 
FROM professors;

-- Insert unique affiliations into the new table
INSERT INTO affiliations 
SELECT DISTINCT firstname, lastname, function, organization 
FROM university_professors;

-- Doublecheck the contents of affiliations
SELECT * 
FROM affiliations;


-- ## 6.1.9 Delete tables with DROP TABLE

-- Delete the university_professors table
DROP TABLE university_professors;
