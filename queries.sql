/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name = '%mon'; /*select animals names end in mon*/

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE neutered = true AND weight_kg > 10.4;

SELECT name FROM animals WHERE neutered = true;

SELECT name, FROM animals WHERE name != 'Gabumon';

SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;



