-- Question 1: --

SELECT * FROM movies;

-- Question 2: --

SELECT title, id FROM movies LIMIT 10;

-- Question 3: --

SELECT * FROM movies WHERE id=485;

-- Question 4: --

SELECT id FROM movies WHERE title="Made in America (1993)";

-- Question 5: --

-- SELECT * FROM movies WHERE title LIKE 'a%' LIMIT 10;

SELECT * FROM movies WHERE title LIKE 'a%' ORDER BY title ASC LIMIT 10;

-- Question 6: --

SELECT * FROM movies WHERE title LIKE '%(2002)%';

-- Question 7: --

SELECT title FROM movies WHERE title LIKE '%Godfather%';

-- Question 8: --

SELECT * FROM movies WHERE genres LIKE '%Comedy%';

-- Question 9: --

SELECT * FROM movies WHERE genres LIKE '%Comedy%' AND title  LIKE '%(2000)%';	


-- Question 10: --

--Death and comedy??

-- Question 11: --

SELECT * FROM movies WHERE title LIKE '%super%' AND title LIKE '%(2001)%' OR '%(2002)%';	

--WITH JOINS:

-- Question 12: --

SELECT movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.id = ratings.movie_id
WHERE title LIKE "%Godfather%" AND title  LIKE '%(1972)%';

-- Question 13: --

SELECT movies.title, ratings.rating, ratings."timestamp" 
FROM movies
INNER JOIN ratings ON movies.id = ratings.movie_id
WHERE title LIKE "%Godfather%" AND title  LIKE '%(1972)%'
ORDER BY ratings."timestamp" ASC;

-- Question 14: --

SELECT movies.title, links.imdb_id
FROM ((movies
INNER JOIN ratings ON movies.id = ratings.movie_id)
INNER JOIN links ON movies.id = links.movie_id)
WHERE title LIKE '%(2005)%' AND genres LIKE '%comedy%';

-- Question 15: --

SELECT movies.title, ratings.rating 
FROM movies
INNER JOIN ratings ON movies.id = ratings.movie_id
WHERE ratings.rating IS NULL;

--or?

--SELECT movies.title, ratings.rating 
--FROM movies
--INNER JOIN ratings ON movies.id = ratings.movie_id
--WHERE ratings.rating LIKE '%0%';

--AGGREGATION

-- Question 16: --

SELECT  movies.title, AVG(ratings.rating) AS avgRating
FROM ratings
INNER JOIN movies ON movies.id = ratings.movie_id
GROUP BY  movies.title, ratings.rating ;

-- Question 17: --

SELECT  movies.title, SUM(ratings.rating) AS totRating
FROM ratings
INNER JOIN movies ON movies.id = ratings.movie_id
GROUP BY  movies.title, ratings.rating ;

-- Question 18: --

SELECT  movies.genres, COUNT(movies.genres) AS totMoviesToGenre
FROM movies
GROUP BY movies.genres ;
-- ???? /\ /\ /\ ????¿¿¿??¿¿¿

-- Question 19: --

SELECT  ratings.user_id, AVG(ratings.rating)
FROM ratings 
GROUP BY ratings.user_id ;

-- Question 20: --

SELECT  ratings.user_id, SUM(ratings.rating) AS ratingsPerUser
FROM ratings 
GROUP BY ratings.user_id 
ORDER BY ratingsPerUser DESC;

-- Question 21: --

SELECT  ratings.user_id, AVG(ratings.rating) AS avgRatingsPerUser
FROM ratings 
GROUP BY ratings.user_id 
ORDER BY avgRatingsPerUser DESC;

-- Question 22: --

SELECT  ratings.user_id, SUM(ratings.rating) AS avgRatingsPerUser
FROM ratings 
GROUP BY ratings.user_id
ORDER BY SUM(ratings.rating) > 50 ASC ;

-- Question 23: --

SELECT movies.title, AVG(ratings.rating) AS avgRatingsPerMovie
FROM movies 
INNER JOIN ratings ON movies.id = ratings.movie_id 
GROUP BY movies.title 
ORDER BY AVG(ratings.rating) > 4 ASC ;
