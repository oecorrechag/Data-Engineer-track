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


-- ## 6.4.7 Populate the "professor_id" column

-- Have a look at the 10 first rows of affiliations
SELECT * 
FROM affiliations 
LIMIT 10;

-- Set professor_id to professors.id where firstname, lastname correspond to rows in professors
UPDATE affiliations
SET professor_id = professors.id
FROM professors
WHERE affiliations.firstname = professors.firstname AND affiliations.lastname = professors.lastname;


-- Have a look at the 10 first rows of affiliations again
SELECT * 
FROM affiliations 
LIMIT 10;


-- ## 6.4.8 Drop "firstname" and "lastname"

-- Drop the firstname column
ALTER TABLE affiliations
DROP COLUMN firstname;

-- Drop the lastname column
ALTER TABLE affiliations
DROP COLUMN lastname;


-- ## 6.4.11 Change the referential integrity behavior of a key

-- Identify the correct constraint name
SELECT constraint_name, table_name, constraint_type
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';

-- Drop the right foreign key constraint
ALTER TABLE affiliations
DROP CONSTRAINT affiliations_organization_id_fkey;

-- Add a new foreign key constraint from affiliations to organizations which cascades deletion
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations (id) ON DELETE CASCADE;

-- Check that no more affiliations with this organization exist
SELECT * FROM affiliations
WHERE organization_id = 'CUREM';






