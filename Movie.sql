SELECT id, title, release_date, rating
FROM movies
WHERE release_date BETWEEN '2020-01-01 00:00' AND '2020-12-31 23:59'

SELECT id, name
FROM actors
WHERE name LIKE '%s'

SELECT id, title, release_date, rating
FROM movies
WHERE rating BETWEEN 4 AND 7 AND release_date BETWEEN '2004-01-01 00:00' AND '2010-12-31 23:59'