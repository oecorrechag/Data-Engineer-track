-- SQLite

-- ## 0.1.3 Practice with COUNT()

-- ### Count the number of records in the people table, aliasing the result as count_records
-- SELECT COUNT(*) AS count_records FROM people;
-- ### Count the number of records with a birthdate in the people table, aliasing the result as count_birthdate.
-- SELECT COUNT(birthdate) AS count_birthdate FROM people;
-- ### Count the languages and countries represented in the films table
-- SELECT COUNT(language) AS count_languages, COUNT(country) AS count_countries FROM films;


-- ## 0.1.4 SELECT DISTINCT

-- ### Return the unique countries from the films table
-- SELECT DISTINCT country FROM films;
-- ### Count the distinct countries from the films table
-- SELECT COUNT (DISTINCT country) AS count_distinct_countries FROM films;

-- ## 0.1.7 Debugging errors

-- ### Debug this code
-- SELECT certification FROM films LIMIT 5;
-- ### Debug this code
-- SELECT film_id, imdb_score, num_votes FROM reviews;
-- ### Debug this code
-- SELECT COUNT(birthdate) AS count_birthdays FROM people;

-- ## 0.1.10 Formatting

-- ### Rewrite this query
-- SELECT person_id, role 
-- FROM roles 
-- LIMIT 10;
