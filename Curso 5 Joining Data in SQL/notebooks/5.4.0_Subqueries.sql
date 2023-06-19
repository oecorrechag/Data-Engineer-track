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
