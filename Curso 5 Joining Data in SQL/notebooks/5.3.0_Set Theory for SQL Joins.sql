-- SQLite

-- ## 5.3.3 Comparing global economies

-- Select all fields from economies2015, Set operation, Select all fields from economies2019
SELECT *
FROM economies2015
UNION
SELECT *
FROM economies2019
ORDER BY code, year;


-- ## 5.3.4 Comparing two set operations

-- Query that determines all pairs of code and year from economies and populations, without duplicates
SELECT country_code
FROM cities
UNION
SELECT code
FROM currencies
ORDER BY country_code;

SELECT code, year
FROM economies
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;


-- ## 5.3.6 INTERSECT

-- Return all cities with the same name as a country
SELECT name
FROM countries
INTERSECT
SELECT name
FROM cities;


-- ## 5.3.9 You've got it, EXCEPT...

-- Return all cities that do not have the same name as a country
SELECT name
FROM cities
EXCEPT
SELECT name
FROM countries
ORDER BY name;

