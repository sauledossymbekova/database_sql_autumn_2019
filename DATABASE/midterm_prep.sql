CREATE DATABASE midterm;
CREATE TABLE movies
(
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL UNIQUE ,
    rating integer,
    genre varchar(50) NOT NULL
);
CREATE TABLE theaters(
    id serial PRIMARY KEY,
    name varchar(255) NOT NULL UNIQUE,
    size integer NOT NULL,
    city varchar(50) NOT NULL
);

INSERT INTO movies VALUES (1, 'Citizen Kane',5, 'Drama'),
                          (2,'Singin in the rain ' ,7,'Comedy'),
                          (3, 'The Wizard of Oz', 7, 'Fantasy'),
                          (4, 'The Quiet Man', NULL, 'Comedy'),
                          (5, 'North by Northwest', NULL, 'Thriller'),
                          (6, 'The Last Tango in Paris', 9, 'Drama');
INSERT INTO theaters VALUES (1, 'Kinopark Esentai',15 , 'Almaty'),
                            (2, 'Star Cinema Mega',7 , 'Almaty'),
                            (3, 'Kinopark 8',9 , 'Shymkent'),
                            (4, 'Star Cinema 15',11 , 'Astana');
 SELECT DISTINCT ON (genre)  title  FROM movies;
SELECT * FROM movies ORDER BY rating DESC LIMIT 3; -- 3
SELECT * FROM theaters ORDER BY size DESC LIMIT 1 OFFSET 2; --4
SELECT * FROM movies WHERE rating IS NULL; --5
SELECT * FROM theaters WHERE (city = 'Almaty' or city ='Shymkent') AND size>7; --6
SELECT id AS MovieID, FORMAT('The genre of %s is %s',title, genre) AS MovieInfo FROM movies; --7
CREATE TABLE movietheaters
(
    theater_id serial REFERENCES theaters(id),
    movie_id serial REFERENCES movies(id),
    PRIMARY KEY (theater_id, movie_id),
    rating integer
);
INSERT INTO movietheaters VALUES (1,5,5),
                                 (3,1,7),
                                 (1,3,9),
                                 (4,6,6);

SELECT * FROM theaters --9
WHERE  id NOT IN(SELECT theater_id FROM  movietheaters);
SELECT *, --10
       CASE WHEN rating > 0 and rating <=3 THEN 'Low rating'
           WHEN rating >= 4 and rating <= 7 THEN  'Medium rating'
           WHEN rating >= 8 and rating <= 10 THEN 'High rating'
           ELSE 'No rating'
       END
FROM movies;
UPDATE movies SET rating =1 WHERE rating isnull; --11
DELETE FROM theaters --12
WHERE  id NOT IN(SELECT theater_id FROM  movietheaters);
SELECT * FROM movies WHERE title LIKE 'T%' --13
                       and title LIKE '__e%'
                       and title LIKE '%n';
SELECT avg(rating),genre FROM movies GROUP BY genre; --14
SELECT * FROM theaters
WHERE id IN(
    SELECT theater_id FROM movietheaters
    GROUP BY theater_id HAVING count(theater_id)>1
    ) --15