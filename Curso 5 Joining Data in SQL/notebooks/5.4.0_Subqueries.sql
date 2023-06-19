-- SQLite

-- ## 5.4.3 Semi join

-- Select all fields from economies2015, Set operation, Select all fields from economies2019
SELECT *
FROM economies2015
UNION
SELECT *
FROM economies2019
ORDER BY code, year;

-- Select unique language names, Order by the name of the language
SELECT DISTINCT(name)
FROM languages
ORDER BY name;

-- Add syntax to use bracketed subquery below as a filter
SELECT DISTINCT name
FROM languages
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;


-- ## 5.4.4 Diagnosing problems using anti join

-- Select code and name of countries from Oceania
SELECT code, name
  FROM countries
WHERE continent = 'Oceania';

-- Filter for countries not included in the bracketed subquery
SELECT code, name
FROM countries
WHERE continent = 'Oceania'
AND code NOT IN
    (SELECT code
    FROM currencies);


-- ## 5.4.6 Subquery inside WHERE

-- Select average life_expectancy from the populations table, Filter for the year 2015
SELECT AVG(life_expectancy)
FROM populations
WHERE year = 2015

-- Filter for only those populations where life expectancy is 1.15 times higher than average
SELECT *
FROM populations
WHERE life_expectancy > 1.15 * 
  (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015) 
    AND year = 2015;


-- ## 5.4.7 WHERE do people live?

-- Select relevant fields from cities table, Filter using a subquery on the countries table
SELECT name, country_code, urbanarea_pop
FROM cities
WHERE name IN
    (SELECT capital
     FROM countries)
ORDER BY urbanarea_pop DESC;


