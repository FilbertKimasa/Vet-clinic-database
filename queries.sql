/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31'

SELECT * FROM animals WHERE neutered =  true and escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered =  true;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN  10.4 and 17.3;

-- transaction start

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022, 01, 01';

SAVEPOINT save_1;

UPDATE animals SET weight_kg = weight_kg*-1;

ROLLBACK TO save_1;

UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;

COMMIT;

-- transaction end

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT
     neutered,
     COUNT(*) AS total_animals,
     SUM(escape_attempts) AS total_escapes
 FROM
     animals
 GROUP BY
     neutered;

SELECT
     neutered,
     COUNT(*) AS total_animals,
     SUM(escape_attempts) AS total_escapes
 FROM
     animals
 GROUP BY
     neutered;

SELECT
    species,
    MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
 FROM
    animals
 GROUP BY
    species;

SELECT
    AVG(escape_attempts) AS average_escape_attempts
 FROM
    animals
 WHERE
    date_of_birth BETWEEN '1990, 01, 01' AND '2000, 12, 31';