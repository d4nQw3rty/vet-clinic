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

CREATE TABLE specializations(   
    vet_id INT,
    species_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets (id),
    FOREIGN KEY (species_id) REFERENCES species (id),
    PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits(   
    animal_id INT,
    vet_id INT,
    date_of_visit DATE,
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id),
    PRIMARY KEY (animal_id, vet_id, date_of_visit);
);

 DROP TABLE visits; 

  CRECREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);



-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX ON visits (vet_id);
CREATE INDEX IF NOT EXISTS owner_index
    ON owners USING btree
    (email COLLATE pg_catalog."default" ASC NULLS LAST)

