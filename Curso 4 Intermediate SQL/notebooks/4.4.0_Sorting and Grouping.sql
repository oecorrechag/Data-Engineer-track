-- SQLite

-- ## 4.4.2 Sorting single fields

Select name from people and sort alphabetically
Select name
FROM people
ORDER BY name;

Select the title and duration from longest to shortest film
Select title, duration
FROM films
ORDER BY duration DESC;


-- ## 4.4.3 Sorting multiple fields

Select the release year, duration, and title sorted by release year and duration
SELECT release_year, duration, title
FROM films
ORDER BY release_year DESC, duration DESC;

Select the certification, release year, and title sorted by certification and release year
SELECT certification, release_year, title 
FROM films 
ORDER BY certification ASC, release_year DESC;


-- ## 4.4.5 GROUP BY single fields

Find the release_year and film_count of each year
SELECT release_year, COUNT(*) AS film_count
FROM films
GROUP BY release_year
ORDER BY release_year;

Find the release_year and average duration of films for each year
SELECT release_year, AVG(duration) AS avg_duration
FROM films
GROUP BY release_year
ORDER BY release_year;


-- ## 4.4.6 GROUP BY multiple fields

Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year, country, MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;


-- ## 4.4.7 Answering business questions

SELECT release_year, COUNT(DISTINCT language) AS language
FROM films
GROUP BY release_year
ORDER BY language DESC;


-- ## 4.4.9 Filter with HAVING

-- Select the country and distinct count of certification as certification_count
SELECT country, COUNT(DISTINCT certification) AS certification_count
FROM films
-- Group by country
GROUP BY country
-- Filter results to countries with more than 10 different certifications
HAVING COUNT(DISTINCT certification) > 10;


-- ## 4.4.10 HAVING and sorting

-- Select the country and average_budget from films
SELECT country, ROUND(AVG(budget),2) AS average_budget
FROM films
-- Group by country
GROUP BY country
-- Filter to countries with an average_budget of more than one billion
HAVING ROUND(AVG(budget),2) > 1000000000
-- Order by descending order of the aggregated budget
ORDER BY average_budget DESC;


-- ## 4.4.11 All together now

-- Select the release_year for films released after 1990 grouped by year
SELECT release_year
FROM films
-- Group by country
GROUP BY release_year
-- Filter to countries with an average_budget of more than one billion
HAVING release_year > 1990
-- Order by descending order of the aggregated budget
ORDER BY release_year ASC;


-- Modify the query to also list the average budget and average gross
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;


SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
-- Modify the query to see only years with an avg_budget of more than 60 million
HAVING AVG(budget) > 60000000;


SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
-- Order the results from highest to lowest average gross and limit to one
ORDER BY avg_gross DESC
LIMIT 1;
