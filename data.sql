/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, true, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, true, 22);

-- Populate owners table

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittak', 38);

-- Populate species table

INSERT INTO species (name)
VALUES ('Pokemon');

INSERT INTO species (name)
VALUES ('Digimon');

-- Update animals with species_id based on name
UPDATE animals
SET species_id = (
    CASE 
        WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
        ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END
);

-- Update animals with owner_id based on owner's name

UPDATE animals
SET owner_id = (
    CASE
        WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
        WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
        WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
        WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
        WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
    END
);

-- Populate data into vets

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, '2008-06-08');

-- Populate data nto specializations

INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    (SELECT id FROM species WHERE name = 'Pokemon')
);

INSERT INTO specializations (vet_id, species_id)
VALUES 
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon'));


INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    (SELECT id FROM species WHERE name = 'Digimon')
);

-- Populate vists table 

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Agumon'),
	(SELECT id FROM vets WHERE name = 'William Tatcher'),
	'2020-05-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Agumon'),
	(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	'2020-07-22'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Gabumon'),
	(SELECT id FROM vets WHERE name = 'Jack Harkness'),
	'2021-02-02'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Pikachu'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-01-05'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Pikachu'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-03-08'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Pikachu'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-05-14'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Devimon'),
	(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	'2021-05-04'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Charmander'),
	(SELECT id FROM vets WHERE name = 'Jack Harkness'),
	'2021-02-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Plantmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2019-12-21'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Plantmon'),
	(SELECT id FROM vets WHERE name = 'William Tatcher'),
	'2020-08-10'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Plantmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2021-04-07'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Squirtle'),
	(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	'2019-09-29'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Angemon'),
	(SELECT id FROM vets WHERE name = 'Jack Harkness'),
	'2020-10-03'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Angemon'),
	(SELECT id FROM vets WHERE name = 'Jack Harkness'),
	'2020-11-04'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Boarmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2019-01-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Boarmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2019-05-15'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Boarmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-02-27'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Boarmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-08-03'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Blossom'),
	(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	'2020-05-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Blossom'),
	(SELECT id FROM vets WHERE name = 'William Tatcher'),
	'2021-01-11'
);
