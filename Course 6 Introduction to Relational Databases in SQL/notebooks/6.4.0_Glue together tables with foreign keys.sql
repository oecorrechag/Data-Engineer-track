-- SQLite

-- # 6.4.0_Glue together tables with foreign keys

-- ## 6.4.2 REFERENCE a table with a FOREIGN KEY

-- Rename the university_shortname column
ALTER TABLE professors
RENAME COLUMN university_shortname TO university_id;

-- Add a foreign key on professors referencing universities
ALTER TABLE professors
ADD CONSTRAINT professors_fkey FOREIGN KEY (university_id) REFERENCES universities (id);


-- ## 6.4.3 Explore foreign key constraints

-- Try to insert a new professor (fix)
INSERT INTO professors (firstname, lastname, university_id)
VALUES ('Albert', 'Einstein', 'UZH');


-- ## 6.4.4 JOIN tables linked by a foreign key

-- Select all professors working for universities in the city of Zurich
SELECT professors.lastname, universities.id, universities.university_city
FROM professors
JOIN universities
ON professors.university_id = universities.id
AND universities.university_city = 'Zurich';


-- ## 6.4.6 Add foreign keys to the "affiliations" table

-- Add a professor_id column
ALTER TABLE affiliations
ADD COLUMN professor_id integer REFERENCES professors (id);

-- Rename the organization column to organization_id
ALTER TABLE affiliations
RENAME organization TO organization_id

-- Add a foreign key on organization_id
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_fkey FOREIGN KEY (organization_id) REFERENCES organizations (id);





