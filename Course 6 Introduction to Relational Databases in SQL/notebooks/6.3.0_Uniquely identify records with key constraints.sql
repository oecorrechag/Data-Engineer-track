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
