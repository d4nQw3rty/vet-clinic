/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg FLOAT(2) NOT NULL,   
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD species VARCHAR(255);

CREATE TABLE owners(
    id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

CREATE TABLE species(
    id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
  ADD owner_id INT,
  ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets(
    id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);
