CREATE TABLE letters(
  letter TEXT
);

INSERT INTO letters(letter) VALUES ('A'), ('B'), ('C');

CREATE TABLE numbers(
  number TEXT
);

INSERT INTO numbers(number) VALUES (1), (2), (3);

SELECT * FROM letters CROSS JOIN numbers;
-- OR
SELECT * FROM letters,numbers;

SELECT generate_series((CURRENT_DATE - INTERVAL '5 day'), CURRENT_DATE, INTERVAL '1 day')::DATE AS DAY;

CREATE TABLE tasks(
  name TEXT
);

INSERT INTO tasks(name) VALUES('Brush teeth'),('Eat breakfast'),('Shower'),('Get dressed');

SELECT
     tasks.name,
     dates.day
FROM tasks
CROSS JOIN
(
  SELECT generate_series(
    (CURRENT_DATE - INTERVAL '5 day'),
    CURRENT_DATE,
    INTERVAL '1 day'
  )::DATE	AS day
) AS dates


CREATE TABLE directors(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO directors(name) VALUES
('John Smith'),
('Jane Doe'),
('Xavier Wills')
('Bev Scott'),
('Bree Jensen');

CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  director_id INTEGER REFERENCES directors 
);

INSERT INTO movies(name, director_id) VALUES
('Movie 1', 1),
('Movie 2', 1),
('Movie 3', 2),
('Movie 4', NULL),
('Movie 5', NULL);

SELECT *FROM movies FULL OUTER JOIN directors ON directors.id = movies.director_id;

SELECT * FROM movies INNER JOIN directors ON directors.id = movies.director_id;

SELECT * FROM directors INNER JOIN movies ON movies.director_id = directors.id;

SELECT * FROM movies LEFT JOIN directors ON directors.id = movies.director_id;

SELECT * FROM movies RIGHT JOIN directors ON directors.id = movies.director_id;

SELECT * FROM directors LEFT JOIN movies ON movies.director_id = directors.id;

SELECT * FROM directors LEFT JOIN movies ON movies.director_id = directors.id;

SELECT * FROM directors LEFT JOIN movies ON movies.director_id = directors.id
WHERE movies.id IS NULL;

SELECT * FROM directors LEFT JOIN movies ON movies.director_id = directors.id
WHERE movies.id IS NOT NULL;

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  movie_id INTEGER REFERENCES movies NOT NULL
);

INSERT INTO tickets(movie_id) VALUES (1), (1), (3);

SELECT *
FROM directors
INNER JOIN movies
  ON movies.director_id = directors.id
INNER JOIN tickets
  ON tickets.movie_id = movies.id;

SELECT *
FROM directors
JOIN movies
  ON movies.director_id = directors.id
LEFT JOIN tickets
  ON tickets.movie_id = movies.id;

SELECT *
FROM movies
INNER JOIN directors
  ON directors.id = movies.director_id
  AND directors.name <> 'John Smith';