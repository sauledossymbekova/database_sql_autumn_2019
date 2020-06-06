CREATE TABLE accounts(
    id SERIAL PRIMARY KEY,
    name varchar(20) NOT NULL,
    age integer,
    balance integer NOT NULL
);
INSERT INTO accounts VALUES (DEFAULT,'Anna',35,32000),
                            (DEFAULT,'Nurlam',25,45000),
                            (DEFAULT,'Adam',21,35000),
                            (DEFAULT,'Mishel',19,65000),
                            (DEFAULT, 'Dana',27,75000),
                            (DEFAULT,'Kirill',22,95000),
                            (DEFAULT,'Janibek',24,37000);
/*2.The first user is added to the balance of 1000,
  the second takes 20000 rubles and the third - 3000,
  and then the transaction is canceled.*/
BEGIN TRANSACTION;
UPDATE accounts
    SET balance = balance + 1000
    WHERE id = 1;
UPDATE accounts
    SET balance = balance - 20000
    WHERE id = 2;
UPDATE accounts
    SET balance = balance - 3000
    WHERE id = 3;
COMMIT;
/*3.Suppose, you want to transfer 1500 from Kirill’s
  account to Anna’s account. However, you accidentally
  send the money to Adam’s account instead Anna’s.
  And you want to rollback the whole transaction.*/
BEGIN TRANSACTION;
UPDATE accounts
    SET balance = balance - 1500
    WHERE name = 'Kirill';
UPDATE accounts
    SET balance = balance + 1500
    WHERE name = 'Anna';
ROLLBACK;
COMMIT;

SELECT id,name,balance
FROM  accounts;

/* 4.Dana closed her account, but then changed her mind and
   you need to restore her account and change the amount
   to 70000.*/
BEGIN TRANSACTION;
    DELETE FROM accounts
    WHERE name = 'Dana';
ROLLBACK;
UPDATE accounts
    SET balance=70000
    WHERE name ='Dana';
/*5.The balance of the 3rd user debited amount 3000,
  a mark is put and operations with the 1st and 2nd user
  add 1000 to each. Further, everything returns to the set label,
  after which the balance of the 1st and 2nd user will not change.*/
BEGIN;
UPDATE accounts
    SET balance = balance - 3000
    WHERE id = 3;
SAVEPOINT mark;
UPDATE accounts
    SET balance = balance + 1000
    WHERE id IN(1,2);
ROLLBACK TO mark;
COMMIT;
/*6.*/
-- the second user changes only will stay-saved(balance*1,1)
-- without commit operator transaction will not be finished,changes will not be saved
-- hence, user2 will not see any changes in DB

--inside the program changes are performing but not saving in table without commit operator
--so, the ouput will be all changes while processing
-- 1 row where:balance =(balance*1.05)*1,1

-- balance= balance*1.1 cause all actions caught by user1 will be canceled

--if user1 commit, and user2 do its execution
-- all actions will be taken
--balance =(balance*1.05)*1,1

/*7.Create function avg_salary which return average salary
  From employees table (lab9).*/
CREATE TABLE Employees(
    id SERIAL CONSTRAINT e_id PRIMARY KEY,
    name varchar(255),
    age integer,
    address varchar(255),
    salary integer,
    department_id integer
);
DROP TABLE  Employees CASCADE;
INSERT INTO Employees VALUES (DEFAULT,'Paul', 32, 'California',20000,80),
                             (DEFAULT, 'Allen', 25,'Texas',15000,60),
                             (DEFAULT, 'Teddy', 23,'Norway',20000,60),
                             (DEFAULT, 'Mark', 25,'Rich-Mond',65000,40),
                             (DEFAULT, 'David', 27,'Texas',85000,30),
                             (DEFAULT, 'Kim', 22,'South-Hall',45000,50),
                             (DEFAULT, 'James', 24,'Houstan',10000,10);

CREATE OR REPLACE FUNCTION avg_salary(OUT average NUMERIC)
AS $$
BEGIN
    SELECT INTO average AVG(salary) FROM employees;
    END; $$
LANGUAGE plpgsql;
SELECT avg_salary();
/*8. Overload your function avg_salary which return average
  salary from a certain deparment_id.*/
CREATE OR REPLACE FUNCTION avg_salary(id INTEGER,OUT average NUMERIC)
AS $$
BEGIN
    SELECT INTO average AVG(salary) FROM employees
    WHERE department_id = id;
    END; $$
LANGUAGE plpgsql;
SELECT avg_salary(60);
/*9. Create a function that should return the sum of the
  total salary of employees where date_start >= time_start
  AND date_end <= time_end in the employees table.*/
ALTER TABLE employees
ADD COLUMN date_start timestamp;
ALTER TABLE employees
ADD COLUMN date_end timestamp;
CREATE FUNCTION amount_salary(time_start timestamp, time_end timestamp, OUT sum_salary numeric)
AS $$
BEGIN
    SELECT INTO sum_salary SUM(salary)
    FROM employees
    WHERE date_start >= time_start AND date_end <= time_end;
    END; $$
LANGUAGE plpgsql;

/*10. CREATE FUNCTION which take a name AND RETURN all
  information about employees if his names LIKE taked name.*/
CREATE OR REPLACE FUNCTION inf_employee(ptrn_name VARCHAR)
RETURNS TABLE (
    employee_id integer,
    emp_name varchar(255),
    emp_age integer,
    emp_address varchar(255),
    emp_salary integer,
    emp_department_id integer
)
AS
$$BEGIN
    RETURN QUERY SELECT id,name,age,address,salary,department_id
    FROM employees
    WHERE name ILIKE ptrn_name;
END; $$
LANGUAGE plpgsql;
DROP FUNCTION inf_employee(ptrn_name VARCHAR);
SELECT inf_employee('P%');