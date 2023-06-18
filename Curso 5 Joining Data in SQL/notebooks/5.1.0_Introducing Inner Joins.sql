-- SQLite

-- ## 5.1.2 Your first join

-- Select all columns from cities
SELECT * 
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;


-- Select name fields (with alias) and region 
SELECT cities.name AS city, countries.name AS country, region 
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;


-- ## 5.1.3 Joining with aliased tables

-- Select fields with aliases
SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON e.code = c.code;


-- ## 5.1.4 USING in action

-- Match using the code column
SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
USING(code);


-- ## 5.1.7 Inspecting a relationship


-- Select country and language names, aliased
SELECT c.name AS country, l.name AS language
-- From countries (aliased)
FROM countries AS c
-- Join to languages (aliased)
INNER JOIN languages AS l
-- Use code as the joining field with the USING keyword
USING (code);


-- Rearrange SELECT statement, keeping aliases
SELECT c.name AS country, l.name AS language
FROM countries AS c
INNER JOIN languages AS l
USING(code)
-- Order the results by language
ORDER BY language


-- ## 5.1.9 Joining multiple tables
