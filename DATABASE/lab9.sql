CREATE DATABASE lab9;
CREATE TABLE Employees(
    id SERIAL CONSTRAINT e_id PRIMARY KEY,
    name varchar(255),
    age integer,
    address varchar(255),
    salary integer,
    department_id integer
);
INSERT INTO Employees VALUES (1,'Paul', 32, 'California',20000,80),
                             (DEFAULT, 'Allen', 25,'Texas',15000,60),
                             (DEFAULT, 'Teddy', 23,'Norway',20000,60),
                             (DEFAULT, 'Mark', 25,'Rich-Mond',65000,40),
                             (DEFAULT, 'David', 27,'Texas',85000,30),
                             (DEFAULT, 'Kim', 22,'South-Hall',45000,50),
                             (DEFAULT, 'James', 24,'Houstan',10000,10);
DROP TABLE Employees;

CREATE VIEW Address_view as SELECT name,address FROM Employees; --2
ALTER VIEW Address_view RENAME TO Address_view_renamed; --3
DROP VIEW Address_view_renamed;

CREATE VIEW Address_view as SELECT address FROM Employees WHERE name='David'; --4
DROP VIEW Address_view; --5

CREATE ROLE log_in with LOGIN; --6
CREATE ROLE with_pass PASSWORD 'qwerty' VALID UNTIL '2020-01-01'; --7
CREATE ROLE createDB_mngRole WITH CREATEDB CREATEROLE; --8
CREATE ROLE withPass_toRemove PASSWORD 'dsa8tyu75'; --9
ALTER ROLE withPass_toRemove with PASSWORD NULL; --9
ALTER ROLE with_pass VALID UNTIL 'May 1 12:00:00 2020 +1'; --10
ALTER ROLE with_pass VALID UNTIL 'infinity'; --11

CREATE ROLE some_role;
ALTER ROLE some_role SET maintenance_work_mem = 10240; --12

CREATE MATERIALIZED VIEW employees_by_salary WITH NO DATA
    AS SELECT * FROM Employees WHERE salary>20000; --13

CREATE VIEW emp_view
AS SELECT id,name,salary FROM employees
WHERE department_id = 50; --14

--there is no view in 7 task, so i just created it
CREATE VIEW task7 as SELECT name FROM Employees;
DROP VIEW task7 CASCADE; --15

--there is no column "first_name", i took name column
CREATE MATERIALIZED VIEW  emp_mview --16
    AS SELECT * FROM Employees
        WHERE name BETWEEN 'A' AND 'H'
        AND salary IN(10000,20000,15000);