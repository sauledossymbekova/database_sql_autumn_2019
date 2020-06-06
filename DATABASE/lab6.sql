CREATE DATABASE lab6;
CREATE TABLE employees(
    emp_id serial PRIMARY KEY ,
    first_name varchar(20),
    last_name varchar (40) ,
    salary integer NOT NULL,
    begin_date date,
    end_date date,
    job_title varchar (50) DEFAULT NULL
);
DROP TABLE employees CASCADE;
CREATE TABLE department(
    department_id serial NOT NULL,
    PRIMARY KEY (department_id),
    emp_id serial REFERENCES employees(emp_id),
    department_name varchar(5),
    email char(40) UNIQUE,
    phone_number char(12),
    hire_date timestamp without time zone,
    commission float
);
/*In the table “employees” make sure
  that the end date is always greater
  than or equal to the begin date and
  the begin date is greater than or equal 2000-01-01.
 */
 --2
ALTER TABLE employees
ADD CONSTRAINT chk_date
CHECK(end_date >= begin_date AND begin_date >= '2000-01-01');

 /*In the table “employees” salary should be
   greater than 65000(use name chk_salary).*/
--3
ALTER TABLE employees
ADD CONSTRAINT chk_salary CHECK(salary > 65000);

/*Last_name must be unique to enable the system
to distinguish between 2 employees when they logged in.*/
--4
ALTER TABLE employees ADD CONSTRAINT unique_lastname unique (last_name);

/*Remove chk_salary from table “employees”.*/
--5
ALTER TABLE employees
    DROP CONSTRAINT chk_salary;

/*Write a query that returns us
  the name of the foreign key constraint.
*/
--6
SELECT first_name FROM employees
WHERE emp_id=ANY(SELECT emp_id FROM department);

/*In the “department” table, the type column department_name
can contain one of this values(“FIT”, “BS”, “FEOG”, “FGGE”).*/
--7
ALTER TABLE department
    ADD CONSTRAINT chk_department_name
        CHECK ( department_name IN ('FIT','BS','FEOG','FGGE'));

/*Please remove emp_id from table “employees”.*/
--8
ALTER TABLE employees
    DROP column emp_id CASCADE;

/*Write a query that displays a list of employees
  with last names that are in alphabetical order
  after the last name “Fleming”.*/
--9
SELECT * FROM employees
WHERE last_name > 'Fleming' ORDER BY last_name;

/*Need to remove an existing UNIQUE constraint.*/
--10
ALTER TABLE employees DROP CONSTRAINT unique_lastname;
