-- SQLite

-- # 7.1.0_Processing, Storing, and Organizing Data

-- ## 7.1.10 Query information_schema with SELECT

-- Create a route dimension table, week

DROP TABLE IF EXISTS route;

CREATE TABLE route (
    route_id INTEGER PRIMARY KEY,
    park_name VARCHAR(160) NOT NULL,
    city_name VARCHAR(160) NOT NULL,
    distance_km FLOAT NOT NULL,
    route_name VARCHAR(160) NOT NULL
);

DROP TABLE IF EXISTS week;

CREATE TABLE week(
    week_id INTEGER PRIMARY KEY,
    week INTEGER NOT NULL,
    month VARCHAR(160) NOT NULL,
    year INTEGER NOT NULL
);


-- ## 7.1.11 Querying the dimensional model

    DROP TABLE IF EXISTS runs_fact;

    CREATE TABLE runs_fact (
        route_id INTEGER NOT NULL,
        week_id INTEGER NOT NULL,
        duration_mins FLOAT NOT NULL
    );
    
    DROP TABLE IF EXISTS week_dim;
    
    CREATE TABLE week_dim(
        week_id INTEGER PRIMARY KEY,
        week INTEGER NOT NULL,
        month VARCHAR(160) NOT NULL,
        year INTEGER NOT NULL
    );
    
    DROP TABLE IF EXISTS route_dim;
    
    CREATE TABLE route_dim(
        route_id INTEGER PRIMARY KEY,
        park_name VARCHAR(160) NOT NULL,
        city_name VARCHAR(160) NOT NULL,
        distance_km FLOAT NOT NULL,
        route_name VARCHAR(160) NOT NULL
    );


-- ## 7.1.12 Querying the dimensional model

-- Select the sum of the duration of all runs
SELECT SUM (duration_mins)
FROM runs_fact;

-- Get the total duration of all runs, Get all the week_id's that are from July, 2019
SELECT SUM(duration_mins)
FROM runs_fact
INNER JOIN week_dim ON runs_fact.week_id = week_dim.week_id
WHERE month = 'July' and year = '2019';
