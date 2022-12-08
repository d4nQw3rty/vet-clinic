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
/*-----------------------------------------------------------------*/
/*-----------------------------------------------------------------*/

SELECT * FROM animals a
JOIN owners o
  ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

/*-----------------------------------------------------------------*/

SELECT * FROM animals a JOIN species s
ON a.species_id = s.id
WHERE s.name = 'Pokemon';

/*-----------------------------------------------------------------*/

SELECT full_name AS "Owners", a.name AS 'Animals'
FROM animals a RIGHT JOIN owners o
ON o.id = a.owners_id;

/*-----------------------------------------------------------------*/

SELECT COUNT(a.name) AS "Quantity", s.name AS "Species"
FROM animals a JOIN species s
ON s.id = a.species_id 
GROUP BY s.name;

/*-----------------------------------------------------------------*/

SELECT a.name AS "ANIMAL", o.full_name AS 'Owner'
FROM animals a JOIN species s
ON s.id = a.species_id
JOIN owners o
ON o.id = a.owners_id
WHERE o.full_name = 'Jennifer Orwell' and s.name = 'Digimon';

/*-----------------------------------------------------------------*/

SELECT a.name AS "ANIMAL", o.full_name AS 'Owner'
FROM animals a JOIN owners o
ON o.id = a.owners_id
WHERE o.full_name = 'Dean Winchester' and a.escape_attempts = 0;

/*-----------------------------------------------------------------*/

SELECT o.full_name AS "Owner", COUNT(a.name) AS "Quantity"
FROM animals a JOIN owners o
ON o.id = a.owners_id
GROUP BY o.full_name
ORDER BY "Quantity" DESC LIMIT 1;

/*-----------------------------------------------------------------*/

/*---------------------------------1--------------------------------*/

SELECT a.name AS "ANIMAL",
vet.full_name AS "VETERINARIAN",
vis.date_of_visit AS "DATE OF VISIT",
FROM animals a JOIN visits vis
ON vis.animal_id = a.id
JOIN vets vet ON vet.id = vis.vet_id
WHERE vet.full_name = 'William Tatcher'
ORDER BY vis.date_of_visit DESC LIMIT 1;

/*--------------------------------2---------------------------------*/

SELECT vet.name AS "VETERINARIAN",
 COUNT(vis.date_of_visit) AS "QUANTITY"
FROM vets vet JOIN visits vis
ON vet.id = vis.vet_id
GROUP BY vet.name
WHERE vet.full_name = 'Stephanie Mendez';

/*--------------------------------3---------------------------------*/

SELECT vet.full_name AS "VETERINARIAN",
spc.name AS "SPECIALITY",
FROM vets vet LEFT JOIN specializations spz
ON vet.id = spz.vet_id
LEFT JOIN species spc
ON spc.id = spz.species_id;

/*--------------------------------4---------------------------------*/

SELECT a.name AS "ANIMAL",
vet.full_name AS "VETERINARIAN",
vis.date_of_visit AS "DATE"
FROM animals a JOIN visits vis
ON vis.animal_id = a.id
JOIN vets vet ON vet.id = vis.vet_id
WHERE vet.full_name = 'Stephanie Mendez' AND vis.date_of_visit BETWEEN'2020-04-01' AND '2020-08-30';

/*--------------------------------5---------------------------------*/

SELECT a.name AS "ANIMAL",
COUNT(vis.animal_id) AS "# of VISITS"
FROM animals a JOIN visits vis
ON vis.animal_id = a.id
GROUP BY a.name
ORDER BY "# of VISITS" DESC LIMIT 1;

/*--------------------------------6---------------------------------*/

SELECT a.name AS "ANIMAL",
vis.date_of_visit AS "DATE"
FROM animals a JOIN visits vis
ON vis.animal_id = a.id
JOIN vets vet
ON vet.id = vis.vet_id
WHERE vet.full_name = 'Maisy Smith'
ORDER BY "DATE" ASC LIMIT 1;

/*--------------------------------7---------------------------------*/

SELECT a.name AS "ANIMAL NAME", a.date_of_birth AS "BORN IN",
A.escape_attempts AS "# OF ESCAPE", a.neutered AS "NEUTERED",
A.weight_kg AS "WEIGHT", vet.full_name AS "VETERINARIAN",
vet.age AS "AGE", vet.date_of_graduation AS "GRADUATION",
vis.date_of_visit AS "VISIT DAY"
FROM animals a JOIN visits vis
ON vis.animal_id = a.id
JOIN vets vet
ON vet.id = vis.vet_id
ORDER BY "VISIT DAY" DESC LIMIT 1;

/*--------------------------------8---------------------------------*/

SELECT COUNT(vis.animal_id) AS "# OF VISITS WHERE ANIMALs TYPE DID NOT MATCH TO SPECIALIZATION"
FROM animals a
JOIN visits vis
ON vis.animal_id = a.id
JOIN vets vet
ON vet.id = vis.vet_id
JOIN species s ON s.id = a.species_id
JOIN specializations spz
ON spz.vet_id = vet.id
JOIN species spc
ON spc.id = spz.species_id
WHERE s.name <> spc.name;

