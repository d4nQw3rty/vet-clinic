/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL CHECK (escape_attempts >= 0),
    neutered BOOLEAN NOT NULL,
    weight_kg FLOAT(2) NOT NULL CHECK (weight_kg >= 0)
);
