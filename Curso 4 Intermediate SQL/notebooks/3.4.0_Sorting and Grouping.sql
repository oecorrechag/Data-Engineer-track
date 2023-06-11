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



