CREATE DATABASE lab8;
CREATE TABLE actor (
    first_name varchar(255),
    last_name varchar(255),
    last_update date

);
--1
--SELECT * FROM actor WHERE first_name = ‘John’;
CREATE INDEX first_name_index ON actor(first_name);
--2
--SELECT * FROM actor WHERE first_name = ‘RAY’ AND last_name = ‘JOHANSSON’;
CREATE INDEX first_last_name_index ON actor(first_name,last_name);
--3
--SELECT * FROM actor WHERE last_update BETWEEN "2018-01-01" AND "2019-01-01" ;
CREATE UNIQUE INDEX unique_last_update_index ON actor(last_update);
--4
--SELECT * FROM actor WHERE substring(first_name from 1 for 4) = ‘NICK’;
CREATE INDEX substring_index ON actor(substring(first_name));
--5
CREATE TABLE film_actor(
    actor_id SERIAL,
    last_update date
);
SELECT tablename, indexname, indexdef, indexname, schemaname, tablename, tablespace FROM pg_indexes
WHERE tablename LIKE 'a%'
ORDER BY tablename, indexname;

/*Create index for queries like below:
SELECT * FROM actor JOIN film_actor ON a.actor_id = f.actor_id WHERE a.last_update > “2019.09.31” AND e.last_update < “2016.12.12”;
6. Select indexes for tables whose name start with the letter A.
7. Indexes accumulate over time, and sometimes a new index may contain the same definition as one of the previous ones. How to find the same definitions.*/