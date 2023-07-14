/* Database schema to keep the structure of the entire database. */

-- Create the vet_clinic database
CREATE DATABASE vet_clinic;

-- Create the animals' table
CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

-- Modify the animals' table to add species column.
ALTER TABLE animals
ADD COLUMN species VARCHAR(100);

-- Create the owners table
CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  age INTEGER
);

-- Create the species table
CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- Modify the animals table
ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id),
ADD COLUMN owner_id INTEGER REFERENCES owners(id);

