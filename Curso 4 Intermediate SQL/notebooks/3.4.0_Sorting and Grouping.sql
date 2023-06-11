-- SQLite

-- ## 3.4.2 Sorting single fields

-- Select name from people and sort alphabetically
-- Select name
-- FROM people
-- ORDER BY name;

-- Select the title and duration from longest to shortest film
-- Select title, duration
-- FROM films
-- ORDER BY duration DESC;


-- ## 3.4.3 Sorting multiple fields

-- Select the release year, duration, and title sorted by release year and duration
-- SELECT release_year, duration, title
-- FROM films
-- ORDER BY release_year DESC, duration DESC;

-- Select the certification, release year, and title sorted by certification and release year
-- SELECT certification, release_year, title 
-- FROM films 
-- ORDER BY certification ASC, release_year DESC;


-- ## 3.4.5 GROUP BY single fields

-- Find the release_year and film_count of each year
-- SELECT release_year, COUNT(*) AS film_count
-- FROM films
-- GROUP BY release_year
-- ORDER BY release_year;

-- Find the release_year and average duration of films for each year
-- SELECT release_year, AVG(duration) AS avg_duration
-- FROM films
-- GROUP BY release_year
-- ORDER BY release_year;


-- ## 3.4.6 GROUP BY multiple fields

-- Find the release_year, country, and max_budget, then group and order by release_year and country
-- SELECT release_year, country, MAX(budget) AS max_budget
-- FROM films
-- GROUP BY release_year, country
-- ORDER BY release_year, country;


-- ## 3.4.7 Answering business questions
-- SELECT release_year, COUNT(DISTINCT language) AS language
-- FROM films
-- GROUP BY release_year
-- ORDER BY language DESC;


-- ## 3.4.9 Filter with HAVING

-- Select the country and distinct count of certification as certification_count
SELECT country, COUNT(DISTINCT certification) AS certification_count
FROM films
-- Group by country
GROUP BY country
-- Filter results to countries with more than 10 different certifications
HAVING COUNT(DISTINCT certification) > 10;


