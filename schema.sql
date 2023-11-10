/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
id  SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INT NOT NULL,
neutered bool NOT NULL,
weight_kg decimal NOT NULL,
);

ALTER TABLE animals ADD species varchar(255);

CREATE TABLE owners(
id  SERIAL PRIMARY KEY,
full_name VARCHAR(50) NOT NULL,
age INT NOT NULL
);

CREATE TABLE species(
id  SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

ALTER TABLE animals
  DROP COLUMN IF EXISTS species;

  -- Add foreign keys
ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);