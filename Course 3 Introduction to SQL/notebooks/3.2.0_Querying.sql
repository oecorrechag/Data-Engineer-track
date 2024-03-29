-- SQLite

-- ## 3.2.0 Querying

-- ## 3.2.4 Querying the books table

SELECT title, author FROM books;
SELECT * FROM books;


-- ## 3.2.6 Making queries DISTINCT

-- ### Select unique authors from the books table
SELECT DISTINCT author FROM books
-- ### Select unique authors and genre combinations from the books table
SELECT DISTINCT author, genre FROM books;


-- ## 3.2.7 Aliasing

-- ### Alias author so that it becomes unique_author
SELECT DISTINCT author AS unique_author FROM books;


-- ## 3.2.8 VIEWing your query

-- ### Your code to create the view:
DROP VIEW IF EXISTS library_authors;
CREATE VIEW library_authors AS
SELECT DISTINCT author AS unique_author
FROM books;


-- ### Select all columns from library_authors
SELECT * 
FROM library_authors


-- ## 3.2.10 Limiting results
-- ### Select the first 10 genres from books using PostgreSQL
SELECT genre FROM books LIMIT 10;
