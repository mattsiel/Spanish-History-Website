INSERT INTO person (person_id, name_first, gender)
VALUES ('111','matt', 'M');

INSERT INTO person (person_id, name_first, gender)
VALUES ('112','mattsi', 'M');

SELECT * FROM person;

SHOW search_path;
SET search_path TO person;