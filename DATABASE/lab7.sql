-- customer (customer_id, first_name, last_name, email)
INSERT INTO customer VALUES (1, 'MARY', 'SMITH', 'MARY.SMITH@sakilacustomer.org');
INSERT INTO customer VALUES (2, 'PATRICIA', 'JOHNSON', 'PATRICIA.JOHNSON@sakilacustomer.org');
INSERT INTO customer VALUES (3, 'LINDA', 'WILLIAMS', 'LINDA.WILLIAMS@sakilacustomer.org');
INSERT INTO customer VALUES (12, NULL, NULL, NULL);
INSERT INTO customer VALUES (4, 'BARBARA', 'JONES', 'BARBARA.JONES@sakilacustomer.org');
INSERT INTO customer VALUES (5, 'ELIZABETH', 'BROWN', 'ELIZABETH.BROWN@sakilacustomer.org');
INSERT INTO customer VALUES (6, 'JENNIFER', 'DAVIS', 'JENNIFER.DAVIS@sakilacustomer.org');
INSERT INTO customer VALUES (7, 'MARIA', 'MILLER', 'MARIA.MILLER@sakilacustomer.org');
INSERT INTO customer VALUES (121, 'MARIA', 'MAISON', 'MARIA.MAISON@sakilacustomer.org');
INSERT INTO customer VALUES (8, 'SUSAN', 'WILSON', 'SUSAN.WILSON@sakilacustomer.org');
INSERT INTO customer VALUES (9, 'MARGARET', 'MOORE', 'MARGARET.MOORE@sakilacustomer.org');
INSERT INTO customer VALUES (13, NULL, NULL, NULL);
INSERT INTO customer VALUES (10, 'DOROTHY', 'TAYLOR', 'DOROTHY.TAYLOR@sakilacustomer.org');
INSERT INTO customer VALUES (11, 'LISA', 'ANDERSON', 'LISA.ANDERSON@sakilacustomer.org');
INSERT INTO customer VALUES (41, 'BARBI', 'JONES', 'B.JONES@sakilacustomer.org');


-- payment (payment_id, customer_id, rental, commission, payment_date)
INSERT INTO payment VALUES (1, 1, 7, 1.99, '2019-01-24 21:40:19');
INSERT INTO payment VALUES (5, 12, 98, 0.99, '2019-01-25 15:16:50');
INSERT INTO payment VALUES (2, 3, 678, 6.99, '2019-01-28 21:44:14');
INSERT INTO payment VALUES (11, 11, 703, 0.99, '2019-02-15 09:57:20');
INSERT INTO payment VALUES (4, 4, 750, 4.99, '2019-01-29 08:10:06');
INSERT INTO payment VALUES (51, 2, 1099, 2.99, '2019-01-31 12:23:14');
INSERT INTO payment VALUES (6, 6, 193, 1.99, '2019-01-26 05:10:14');
INSERT INTO payment VALUES (7, 13, 1040, 4.99, '2019-01-31 04:03:42');
INSERT INTO payment VALUES (8, 8, 1096, 8.99, '2019-01-31 11:59:15');
INSERT INTO payment VALUES (9, 9, 33, 0.99, '2019-01-25 02:47:17');
INSERT INTO payment VALUES (10, 10, 405, 6.99, '2019-01-27 12:01:05');
INSERT INTO payment VALUES (111, 10, 1041, 6.99, '2019-10-01 09:57:20');



--rental (rental_id, rental_date, customer_id, payment_id, last_update)
INSERT INTO rental VALUES (2, '2005-05-24 22:54:33', 9, 1, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (3, '2005-05-24 23:03:39', 8, 1, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (4, '2005-05-24 23:04:41', 3, 2, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (5, '2005-05-24 23:05:21', 2, 1, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (6, '2005-05-24 23:08:07', 9, 6, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (7, NULL, 9, 7, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (8, '2005-05-24 23:31:46', 9, 9, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (9, '2005-05-25 00:00:40', 6, 10, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (10, '2005-05-25 00:02:21', 3,10, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (11, '2005-05-25 00:09:02', 2, 111, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (12, NULL, 3, 4, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (13, '2005-05-25 00:22:55', 4, 5, '2017-02-16 02:30:53');
INSERT INTO rental VALUES (14, '2005-05-25 00:31:15', 6, 111, '2017-02-16 02:30:53');

CREATE DATABASE lab7;
CREATE TABLE customer (
    customer_id integer CONSTRAINT c_id PRIMARY KEY ,
    first_name varchar(20),
    last_name varchar(40),
    email varchar
);
Drop TABLE customer;
Drop TABLE payment;

CREATE TABLE payment (
    payment_id integer CONSTRAINT p_id PRIMARY KEY ,
    customer_id integer REFERENCES customer(customer_id)  ,
    rental integer,
    commission double precision,
    payment_date timestamp
);
CREATE TABLE rental (
    rental_id SERIAL,
    rental_date timestamp,
    customer_id integer REFERENCES customer(customer_id),
    payment_id integer REFERENCES payment(payment_id),
    last_update timestamp
);

SELECT * FROM payment;
SELECT  * FROM customer;
SELECT * FROM rental;

SELECT customer.first_name, customer.last_name, payment.rental FROM customer INNER JOIN payment USING (customer_id);
SELECT customer.first_name, payment.rental FROM customer INNER JOIN payment ON customer.customer_id = payment.customer_id
WHERE commission IN (0.99, 1.99,2.99);

SELECT customer.customer_id, customer.first_name, customer.last_name, payment.commission, rental.rental_date
FROM customer INNER JOIN payment ON customer.customer_id = payment.customer_id
     INNER JOIN rental  ON customer.customer_id = rental.customer_id;

SELECT * FROM customer full outer join payment on customer.customer_id = payment.customer_id
    WHERE customer.customer_id IN (SELECT rental FROM payment GROUP BY rental having count(rental)>2);

SELECT customer.customer_id, customer.first_name, customer.last_name, customer.email,
       payment.rental*payment.commission AS rent
FROM customer full outer join payment ON customer.customer_id = payment.customer_id;

SELECT  customer.first_name, customer.last_name FROM customer LEFT JOIN rental
    ON customer.customer_id = rental.customer_id WHERE rental_date = '2005-05-24';

SELECT * FROM rental WHERE rental_date = '2005-05-24'; --no
SELECT first_name, email, rental_date, last_update FROM customer LEFT JOIN rental r ON customer.customer_id = r.customer_id;
SELECT count(customer_id) as count, rental * commission AS final_rent, payment_date FROM customer FULL OUTER JOIN payment ON customer.customer_id = payment.customer_id ORDER BY payment_date;

/*
8. Select customers (first_name, email, rental_date, last_update) including those where does not have any customer.
9. Select current rental and previous rental for all customers (first_name, last_name, customer_id, prev_rental, current_rental).
10. Select number of all customers, the amount of the final rent = rent * commission for each payment_date (without time).
11. For all customers need to change company name from “sakilacustomer.org” to “kb- tustudent.kz” who does not have rental_date.*/