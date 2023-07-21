-- SQLite

-- # 7.2.0_Database Schemas and Normalization

-- ## 7.2.3 Adding foreign keys

-- Add the book_id foreign key, Add the time_id foreign key, Add the store_id foreign key

ALTER TABLE fact_booksales ADD CONSTRAINT sales_book
    FOREIGN KEY (book_id) REFERENCES dim_book_star (book_id);
    
ALTER TABLE fact_booksales ADD CONSTRAINT sales_time
FOREIGN KEY (time_id) REFERENCES dim_time_star (time_id);

ALTER TABLE fact_booksales ADD CONSTRAINT sales_store
FOREIGN KEY (store_id) REFERENCES dim_store_star (store_id);


-- ## 7.2.4 Extending the book dimension

-- Create dim_author with an author column
CREATE TABLE dim_author (
    author varchar(256)  NOT NULL
);

-- Insert authors into the new table
INSERT INTO dim_author
SELECT DISTINCT author FROM dim_book_star;   

-- Add a primary key 
-- ALTER TABLE dim_author
-- ADD COLUMN author_id SERIAL PRIMARY KEY; 

-- Output the new table
SELECT * 
FROM dim_author;


-- ## 7.2.5 Querying the star schema

-- Output each state and their total sales_amount, Join to get book information, Get all books with in the novel genre, Group results by state

SELECT dim_store_star.state, SUM(sales_amount)
FROM fact_booksales
    JOIN dim_book_star on fact_booksales.book_id = dim_book_star.book_id
    JOIN dim_store_star on fact_booksales.store_id = dim_store_star.store_id
WHERE  
    dim_book_star.genre = 'novel'
GROUP BY
    dim_store_star.state;
    

-- ## 7.2.6 Querying the snowflake schema

-- Output each state and their total sales_amount, Joins for the genre, Joins for the state, Get all books with in the novel genre and group the results by state
SELECT dim_state_sf.state, sum(sales_amount)
FROM fact_booksales
    JOIN dim_book_sf on fact_booksales.book_id = dim_book_sf.book_id
    JOIN dim_genre_sf on dim_book_sf.genre_id = dim_genre_sf.genre_id
    JOIN dim_store_sf on fact_booksales.store_id = dim_store_sf.store_id 
    JOIN dim_city_sf on dim_store_sf.city_id = dim_city_sf.city_id
    JOIN dim_state_sf on  dim_city_sf.state_id = dim_state_sf.state_id
WHERE  
    dim_genre_sf.genre = 'novel'
GROUP BY
dim_state_sf.state;


-- ## 7.2.7 Updating countries

-- Output records that need to be updated in the star schema
SELECT * 
FROM dim_store_star
WHERE country != 'USA' AND state !='CA';


-- ## 7.2.8 Extending the snowflake schema

-- Add a continent_id column with default value of 1
ALTER TABLE dim_country_sf
ADD continent_id int NOT NULL DEFAULT(1);

-- Add the foreign key constraint
-- ALTER TABLE dim_country_sf 
-- ADD CONSTRAINT country_continent
-- FOREIGN KEY (continent_id) REFERENCES dim_continent_sf(continent_id);

-- Output updated table
SELECT * 
FROM dim_country_sf;


-- ## 7.2.10 Converting to 1NF

-- Create a new table to hold the cars rented by customers
DROP TABLE IF EXISTS cust_rentals;

CREATE TABLE cust_rentals (
    customer_id INT NOT NULL,
    car_id VARCHAR(128) NULL,
    invoice_id VARCHAR(128) NULL
);

-- Drop a column from customers table to satisfy 1NF
-- ALTER TABLE customers
-- DROP COLUMN cars_rented,
-- DROP COLUMN invoice_id


-- ## 7.2.11 Converting to 2NF

-- Create a new table to satisfy 2NF
DROP TABLE IF EXISTS cars;
            
CREATE TABLE cars (
    car_id VARCHAR(256) NULL,
    model VARCHAR(128),
    manufacturer VARCHAR(128),
    type_car VARCHAR(128),
    condition VARCHAR(128),
    color VARCHAR(128)
);

-- Drop columns in customer_rentals to satisfy 2NF
ALTER TABLE customer_rentals
DROP COLUMN model,
DROP COLUMN manufacturer, 
DROP COLUMN type_car,
DROP COLUMN condition,
DROP COLUMN color


-- ## 7.2.12 Converting to 3NF

-- Create a new table to satisfy 3NF
DROP TABLE IF EXISTS cust_rentals;

CREATE TABLE cust_rentals (
    customer_id     INT NOT NULL,
    car_id          VARCHAR(128) NULL,
    invoice_id      VARCHAR(128) NULL
);


-- Drop columns in rental_cars to satisfy 3NF
ALTER TABLE rental_cars
DROP COLUMN manufacturer, 
DROP COLUMN type_car;


-- ## 7.3.3 Viewing views

-- -- Get all non-systems views  -> postgress
-- SELECT * 
-- FROM information_schema.views
-- WHERE table_schema NOT IN ('pg_catalog', 'information_schema');


-- ## 7.3.4 Creating and querying a view

-- Create a view for reviews with a score above 9
CREATE VIEW high_scores AS
SELECT * 
FROM reviews
WHERE score > 9;

-- Count the number of self-released works in high_scores
SELECT COUNT(*) 
FROM high_scores
INNER JOIN label ON high_scores.reviewid = labels.reviewid
WHERE label = 'self-released';


-- ## 7.3.6 Creating a view from other views

-- Create a view with the top artists in 2017, with only one column holding the artist field
CREATE VIEW top_artists_2017 AS
SELECT artist_title.artist FROM artist_title
INNER JOIN top_15_2017
ON artist_title.reviewid = top_15_2017.reviewid;







