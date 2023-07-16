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
