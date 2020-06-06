CREATE DATABASE lab5;
CREATE TABLE customer (
    customer_id SERIAL,
    CONSTRAINT pkey PRIMARY KEY (customer_id),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email text,
    active_bool BOOLEAN,
    create_date text,
    last_update timestamp,
    active INT
);

CREATE TABLE payment (
    payment_id SERIAL,
    customer_id SERIAL,
    rental INT,
    amount DOUBLE PRECISION,
    payment_date timestamp
     );

-- customer (customer_id, first_name, last_name, email, active_bool, create_date, last_update, active)
INSERT INTO customer VALUES (1, 'MARY', 'SMITH', 'MARY.SMITH@sakilacustomer.org', true, '2017-02-14', '2018-01-15 09:57:20', 1);
INSERT INTO customer VALUES (2, 'PATRICIA', 'JOHNSON', 'PATRICIA.JOHNSON@sakilacustomer.org', true, '2018-10-14', '2019-10-01 09:57:20', 1);
INSERT INTO customer VALUES (3, 'LINDA', 'WILLIAMS', 'LINDA.WILLIAMS@sakilacustomer.org', true, '2017-06-14', '2019-01-21 09:57:20', 0);
INSERT INTO customer VALUES (4, 'BARBARA', 'JONES', 'BARBARA.JONES@sakilacustomer.org', false, '2015-12-14', '2016-08-20 09:57:20', 1);
INSERT INTO customer VALUES (5, 'ELIZABETH', 'BROWN', 'ELIZABETH.BROWN@sakilacustomer.org', true, '2014-04-09', '2017-11-08 09:57:20', 1);
INSERT INTO customer VALUES (6, 'JENNIFER', 'DAVIS', 'JENNIFER.DAVIS@sakilacustomer.org', false, '2017-08-30', '2018-09-18 09:57:20', 1);
INSERT INTO customer VALUES (7, 'MARIA', 'MILLER', 'MARIA.MILLER@sakilacustomer.org', true, '2015-04-05', '2019-02-15 09:57:20', 1);
INSERT INTO customer VALUES (8, 'SUSAN', 'WILSON', 'SUSAN.WILSON@sakilacustomer.org', true, '2016-09-19', '2017-12-04 09:57:20', 0);
INSERT INTO customer VALUES (9, 'MARGARET', 'MOORE', 'MARGARET.MOORE@sakilacustomer.org', true, '2017-04-05', '2018-02-19 09:57:20', 1);
INSERT INTO customer VALUES (10, 'DOROTHY', 'TAYLOR', 'DOROTHY.TAYLOR@sakilacustomer.org', false, '2014-07-23', '2017-01-25 09:57:20', 1);
INSERT INTO customer VALUES (11, 'LISA', 'ANDERSON', 'LISA.ANDERSON@sakilacustomer.org', true, '2013-02-01', '2017-07-06 09:57:20', 0);


-- payment (payment_id, customer_id, rental, amount, payment_date)
INSERT INTO payment VALUES (16050, 1, 7, 1.99, '2019-01-24 21:40:19');
INSERT INTO payment VALUES (16051, 2, 98, 0.99, '2019-01-25 15:16:50');
INSERT INTO payment VALUES (16052, 3, 678, 6.99, '2019-01-28 21:44:14');
INSERT INTO payment VALUES (16053, 11, 703, 0.99, '2019-02-15 09:57:20');
INSERT INTO payment VALUES (16054, 4, 750, 4.99, '2019-01-29 08:10:06');
INSERT INTO payment VALUES (16055, 5, 1099, 2.99, '2019-01-31 12:23:14');
INSERT INTO payment VALUES (16056, 6, 193, 1.99, '2019-01-26 05:10:14');
INSERT INTO payment VALUES (16057, 7, 1040, 4.99, '2019-01-31 04:03:42');
INSERT INTO payment VALUES (16058, 8, 1096, 8.99, '2019-01-31 11:59:15');
INSERT INTO payment VALUES (16059, 9, 33, 0.99, '2019-01-25 02:47:17');
INSERT INTO payment VALUES (16060, 10, 405, 6.99, '2019-01-27 12:01:05');
INSERT INTO payment VALUES (16061, 10, 1041, 6.99, '2019-10-01 09:57:20');

SELECT * FROM customer
WHERE last_name LIKE '%ON%';

SELECT * FROM customer
WHERE first_name LIKE 'M__%';

SELECT * FROM customer
WHERE first_name LIKE 'L%A';

SELECT * FROM customer
WHERE create_date between'01-January-2013' AND '31-December-2014';

SELECT * FROM customer
WHERE create_date LIKE '201_-04-05%';

SELECT customer_id AS userId, email AS userEmail, active AS userState,
       first_name, last_name, active_bool, create_date, last_update FROM customer;

SELECT *, to_char(last_update, 'YYYY.DD.MM') from customer;

SELECT *, CONCAT(rental, '   ', amount, '!!!') AS res
FROM payment;

SELECT first_name, customer_id FROM customer
WHERE customer_id = ANY(SELECT customer_id FROM payment WHERE rental = 1040);

SELECT *, rental AS bonus_amount,
       CASE WHEN rental > 1500 THEN rental = rental + (rental * 0.15)
            WHEN rental < 1000 THEN rental = rental + (rental * 0.1)
            ELSE rental = rental + (rental * 0.05)
            END
FROM payment;

SELECT * FROM customer
WHERE last_update = ANY (SELECT payment_date FROM payment);

SELECT ceiling(amount) FROM payment;