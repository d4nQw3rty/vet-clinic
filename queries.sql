/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon'; /*select animals names end in mon*/

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE neutered = true AND weight_kg > 10.4;

SELECT name FROM animals WHERE neutered = true;

SELECT name, FROM animals WHERE name != 'Gabumon';

SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*-----------------------------------------------------------------*/
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
/*-----------------------------------------------------------------*/
BEGIN;
UPDATE animals
SET species = 'Digimon'
WHERE name like '%mon';
UPDATE animals
SET species = 'Pokemon'
WHERE species ISNULL;
COMMIT;
SELECT * FROM animals;
/*-----------------------------------------------------------------*/
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
/*-----------------------------------------------------------------*/
BEGIN;
DELETE FROM animalS
WHERE date_of_birth >= '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT my_savepoint;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;
/*-----------------------------------------------------------------*/
SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg), AVG(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
