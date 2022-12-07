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
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);
