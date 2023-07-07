-- SQLite

-- # 6.4.0_Glue together tables with foreign keys

-- ## 6.4.2 REFERENCE a table with a FOREIGN KEY

-- Rename the university_shortname column
ALTER TABLE professors
RENAME COLUMN university_shortname TO university_id;

-- Add a foreign key on professors referencing universities
ALTER TABLE professors
ADD CONSTRAINT professors_fkey FOREIGN KEY (university_id) REFERENCES universities (id);


















