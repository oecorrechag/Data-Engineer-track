-- SQLite

-- ## 5.3.3 This is a LEFT JOIN, right?

-- Perform an inner join with cities as c1 and countries as c2 on country code
SELECT 
    c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
INNER JOIN countries AS c2
ON c1.country_code = c2.code
ORDER BY code DESC;

-- Join right table (with alias)
SELECT 
	c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
LEFT JOIN countries AS c2
ON c1.country_code = c2.code
ORDER BY code DESC;


-- ## 5.3.4 Building on your LEFT JOIN

-- Match on code fields, Filter for the year 2010
SELECT name, region, gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
ON c.code = e.code
WHERE year = 2010;

-- Select region, and average gdp_percapita as avg_gdp
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
-- Group by region
GROUP BY region;

-- Order by descending avg_gdp, Return only first 10 records
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region
ORDER BY avg_gdp DESC
LIMIT 10


-- ## 5.3.5 Is this RIGHT?

-- Modify this query to use RIGHT JOIN instead of LEFT JOIN
-- SELECT countries.name AS country, languages.name AS language, percent
-- FROM languages
-- RIGHT JOIN countries
-- USING(code)
-- ORDER BY language;























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

-- Select relevant fields
SELECT name, year, fertility_rate
FROM countries AS c
-- Inner join countries and y, aliased, on code
INNER JOIN populations AS p
ON c.code = p.country_code;

-- Select fields
SELECT name, e.year, fertility_rate, e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
-- Join to economies (as e)
INNER JOIN economies AS e
-- Match on country code
ON c.code = e.code;


-- ## 5.1.10 Checking multi-table joins

SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
AND e.year = p.year;
