-- SQLite

-- # 6.3.0_Uniquely identify records with key constraints

-- ## 6.3.2 Get to know SELECT COUNT DISTINCT

-- Count the number of rows in universities
SELECT DISTINCT COUNT (*)
FROM universities;

-- Count the number of distinct values in the university_city column
SELECT COUNT(DISTINCT(university_city))
FROM universities;


-- ## 6.3.3 Identify keys with SELECT COUNT DISTINCT

-- Try out different combinations
SELECT COUNT(DISTINCT(firstname, lastname)) 
FROM professors;


-- ## 6.3.6 ADD key CONSTRAINTs to the tables

-- Rename the organization column to id
ALTER TABLE organizations
RENAME COLUMN organization TO id;

-- Make id a primary key
ALTER TABLE organizations
ADD CONSTRAINT organization_pk PRIMARY KEY (id);

-- Rename the university_shortname column to id
ALTER TABLE universities
RENAME COLUMN university_shortname TO id;

-- Make id a primary key
ALTER TABLE universities
ADD CONSTRAINT university_pk PRIMARY KEY (id);









