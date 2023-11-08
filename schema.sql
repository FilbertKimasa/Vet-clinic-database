/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
id  SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INT NOT NULL,
neutered bool NOT NULL,
weight_kg decimal NOT NULL,
species VARCHAR(255);
);
