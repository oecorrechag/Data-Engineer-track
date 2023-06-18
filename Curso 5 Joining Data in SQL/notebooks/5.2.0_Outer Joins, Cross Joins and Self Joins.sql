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


-- ## 5.3.7 Comparing joins

-- Join to currencies, Where region is North America or name is null
-- SELECT name AS country, code, region, basic_unit
-- FROM countries
-- FULL JOIN currencies
-- USING (code)
-- WHERE region = 'North America' OR region IS NULL
-- ORDER BY region;

-- replace FULL JOIN for LEFT JOIN
SELECT name AS country, code, region, basic_unit
FROM countries
LEFT JOIN currencies
USING (code)
WHERE region = 'North America' 
	OR name IS NULL
ORDER BY region;

-- replace FULL JOIN for INNER JOIN
SELECT name AS country, code, region, basic_unit
FROM countries
INNER JOIN currencies
USING (code)
WHERE region = 'North America' 
	OR name IS NULL
ORDER BY region;


-- ## 5.3.8 Chaining FULL JOINs

-- Full join with languages, Full join with currencies
-- SELECT 
-- 	c1.name AS country, 
--     region, 
--     l.name AS language,
-- 	basic_unit, 
--     frac_unit
-- FROM countries as c1 
-- -- Full join with languages (alias as l)
-- FULL JOIN languages AS l
-- USING(code)
-- -- Full join with currencies (alias as c2)
-- FULL JOIN currencies AS c2
-- USING(code)
-- WHERE region LIKE 'M%esia';


-- ## 5.3.10 Histories and languages

-- SELECT c.name AS country, l.name AS language
-- FROM countries AS c
-- -- Inner join countries as c with languages as l on code
-- INNER JOIN languages AS l
-- USING(code)
-- WHERE c.code IN ('PAK','IND')
-- 	AND l.code in ('PAK','IND');

SELECT c.name AS country, l.name AS language
FROM countries AS c        
-- Perform a cross join to languages (alias as l)
CROSS JOIN languages AS l
WHERE c.code in ('PAK','IND')
	AND l.code in ('PAK','IND');


-- ## 5.3.11 Choosing your join





