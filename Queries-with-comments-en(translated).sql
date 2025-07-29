# SQL Module: Final Test

USE Sakila;

# 1. Select all movie titles without duplicates:

SELECT *                        -- Query to explore the table – it is identified that movie titles are in the "title" column
FROM film;

SELECT DISTINCT title           -- DISTINCT is used to select only unique values from the "title" column – where the movie titles are stored
FROM film;

# 2. Display the titles of all movies with a rating of "NC-17":

SELECT *                        -- Query to explore the table – the "rating" column is identified as containing the required values
FROM film
LIMIT 10;

SELECT title, rating            -- WHERE filters the column results with the condition "NC-17"
FROM film 
WHERE rating = "NC-17";

SELECT title                    -- If we only want the movie titles under this condition, without showing the rating, this would be the final query
FROM film 
WHERE rating = "NC-17";

SELECT title, rating            
FROM film 
WHERE rating IN ('NC-17', 'PG-13');

# 3. Find the title and description of all movies containing the string "amazing" in their description:

SELECT *                                    -- Query to explore the table – the "description" column is identified
FROM film
LIMIT 10;

SELECT title, description                   -- To search for a string in the "description" we will use REGEXP
FROM film 
WHERE description REGEXP 'amazing';

# 4. Find the title of all movies with a duration longer than 120 minutes:

SELECT *                                    -- Query to explore the table – the "length" column is identified
FROM film
LIMIT 10;

SELECT title, length                        -- WHERE filters the results in the "length" column with the condition > 120
FROM film
WHERE length > 120;

# 5. Retrieve the first and last names of all actors:

SELECT *                                    -- Query to explore the table – the "first_name" and "last_name" columns are identified
FROM actor
LIMIT 10;

SELECT first_name, last_name                -- SELECT retrieves data from the chosen columns
FROM actor;

# 6. Find the first and last names of actors whose last name contains "Gibson":

SELECT first_name, last_name                -- SELECT retrieves "first_name" and "last_name", while REGEXP searches and filters values like 'Gibson'
FROM actor
WHERE last_name REGEXP 'Gibson';

# 7. Find the first and last names of actors whose actor_id is between 10 and 25:

SELECT actor_id, first_name, last_name      -- SELECT retrieves the relevant columns; WHERE filters for actor_id between 10 and 25
FROM actor
WHERE actor_id >= 10 AND actor_id <= 25;    -- After verifying the condition was met, we can remove "actor_id" from the SELECT to show only names

SELECT first_name, last_name                -- For simplicity, we can use BETWEEN
FROM actor
WHERE actor_id BETWEEN 10 AND 25;

# 8. Find movie titles in the `film` table that are not rated "R", "PG-13", or "G":

SELECT *                                    -- Query to explore the table – the "rating" column contains classification data
FROM film
LIMIT 10;

SELECT title, rating                        -- NOT IN selects rows in "rating" that do not match the provided values
FROM film
WHERE rating NOT IN ('R', 'PG-13', 'G');

# 9. Find the total number of movies per rating in the `film` table and display the rating along with the count:

SELECT *                                    -- Query to explore the table – "rating" is the classification column
FROM film
LIMIT 10;

SELECT rating                               -- Query to group by classification
FROM film
GROUP BY rating;

SELECT rating, COUNT(title)                 -- Add COUNT to count the total number of movies (title) per classification
FROM film
GROUP BY rating;

SELECT rating, COUNT(title) 
FROM film
GROUP BY rating
HAVING COUNT(title) > 200;

# 10. Find the total number of movies rented by each customer and display customer ID, first and last names, and rental count:

SELECT *                                    -- Query to explore the table – "customer_id" links to the "customer" table for names
FROM rental;

SELECT customer_id, COUNT(inventory_id)     -- Query to find total rentals per customer
FROM rental
GROUP BY customer_id;

SELECT cus.customer_id, cus.first_name, cus.last_name, COUNT(ren.inventory_id) AS total_movies
FROM rental AS ren                          -- Join with "customer" to retrieve first and last names
INNER JOIN customer AS cus                  -- All non-aggregated fields in SELECT must be included in GROUP BY
USING (customer_id)
GROUP BY cus.customer_id, cus.first_name, cus.last_name;

# 11. Find the total number of movies rented by category and show category name with rental count:
-- Join path from rental to category: rental → inventory → film → film_category → category

SELECT *                                    -- Query to explore the "inventory_id"
FROM rental
LIMIT 20;

SELECT *                                    -- Explore "category" table (category_id, name)
FROM category
LIMIT 20;

SELECT *                                    -- Explore "film_category" table that links film to category
FROM film_category
LIMIT 20;

-- JOINS help combine data across tables for a complete view
SELECT ren.rental_id, inv.film_id
FROM rental AS ren
INNER JOIN inventory AS inv 
USING (inventory_id)
INNER JOIN film AS fil 
USING (film_id)
INNER JOIN film_category AS filcat 
USING (film_id)
INNER JOIN category AS cat 
USING (category_id);

-- Final query:
SELECT cat.name AS category, COUNT(ren.rental_id) AS total_rentals
FROM rental AS ren
INNER JOIN inventory AS inv 
USING (inventory_id)
INNER JOIN film AS fil 
USING (film_id)
INNER JOIN film_category AS filcat 
USING (film_id)
INNER JOIN category AS cat 
USING (category_id)
GROUP BY cat.name;

# 12. Find the average duration of movies for each rating in the `film` table and display rating with average duration:

SELECT rating, AVG(length) AS avg_duration      -- AVG calculates averages
FROM film                                       -- GROUP BY rating is used to group by classification
GROUP BY rating;

# 13. Find the first and last names of actors appearing in the movie titled "Indian Love":

SELECT actor.first_name, actor.last_name, film.title
FROM actor                                       -- Join actor and film_actor to access film_id, which links to the film title
INNER JOIN film_actor
USING (actor_id)
INNER JOIN film 
USING (film_id)
WHERE film.title = 'Indian Love';

# 14. Display titles of all movies that contain "dog" or "cat" in their description:

SELECT title, description                       -- Displays movie title and description
FROM film;

SELECT title, description                       -- WHERE adds a condition; REGEXP matches "dog" or "cat" within the description
FROM film
WHERE description REGEXP 'dog' 
   OR description REGEXP 'cat';

SELECT title, description                       -- Alternatively, we can use LIKE with wildcard syntax
FROM film
WHERE description LIKE '%dog%' 
   OR description LIKE '%cat%';

# 15. Is there any actor or actress who does not appear in any movie listed in `film_actor`?

SELECT act.actor_id, act.first_name, act.last_name
FROM actor AS act                               -- LEFT JOIN is appropriate here to include all actors even if they don't have film_id
LEFT JOIN film_actor AS fil
USING (actor_id)
WHERE fil.actor_id IS NULL;                     -- Result: No actor or actress is excluded from `film_actor`

-- Alternatively, this can be solved with a subquery
SELECT actor.first_name, actor.last_name
FROM actor
WHERE actor_id NOT IN (SELECT actor_id FROM film_actor);

# 16. Find all movie titles released between 2005 and 2010:

SELECT title, release_year 
FROM film 
WHERE release_year >= 2005 AND release_year <= 2010;

# 17. Find all movie titles that belong to the same category as "Comedy":

SELECT fil.title, cat.name                      -- Join from film to film_category to access category
FROM film AS fil
INNER JOIN film_category 
USING (film_id)
INNER JOIN category AS cat
USING (category_id)
WHERE cat.name = 'Comedy';

# 18. Show the first and last names of actors who appear in more than 14 films:

SELECT a.first_name, a.last_name
FROM actor AS a
INNER JOIN film_actor
USING (actor_id)
INNER JOIN film
USING (film_id)
GROUP BY a.first_name, a.last_name 
HAVING COUNT(film.film_id) >= 14;               -- COUNT counts unique film IDs (movies)

# 19. Find titles of all movies rated "R" and longer than 2 hours (120 minutes):

SELECT title AS Movie, length AS Duration, rating AS Restricted
FROM film 
WHERE length > 120
  AND rating = 'R';

# 20. Find categories of movies with an average duration above 120 minutes and display category name with average duration:

-- Step 1
SELECT fil.title AS Movie, fil.length AS Duration, cat.name AS Category   -- First, list individual films longer than 120 mins with their duration and category
FROM film AS fil
INNER JOIN film_category 
USING (film_id)
INNER JOIN category AS cat
USING (category_id)
WHERE length > 120;

-- Final query
SELECT AVG(fil.length) AS Duration, cat.name AS Category                  -- Then, calculate average duration per category
FROM film AS fil
INNER JOIN film_category 
USING (film_id)
INNER JOIN category AS cat
USING (category_id)
GROUP BY cat.name
HAVING AVG(fil.length) > 120;

# 21. Find actors who have appeared in at least 5 films and show their names with the number of films:

SELECT act.first_name, act.last_name, COUNT(fil.title) AS movie_count
FROM actor AS act
INNER JOIN film_actor
USING(actor_id)
INNER JOIN film AS fil
USING(film_id)
GROUP BY act.first_name, act.last_name
HAVING COUNT(fil.title) >= 5;

# 22. Find the titles of all movies rented for more than 5 days. Use a subquery to get rental_ids with duration > 5 days, then select the corresponding movies:

-- Step 1
SELECT *                                 -- Used to explore the table
FROM rental;

-- Step 2
-- DATEDIFF(end_date, start_date) – SQL native function to calculate difference in days
SELECT rental_id, rental_date, return_date, DATEDIFF(return_date, rental_date) AS rental_days
FROM rental
WHERE DATEDIFF(return_date, rental_date) > 5;

-- Final query
SELECT title
FROM film
WHERE film_id IN (
  SELECT DISTINCT i.film_id
  FROM inventory AS i
  JOIN rental AS r ON i.inventory_id = r.inventory_id
  WHERE DATEDIFF(return_date, rental_date) > 5
);

# 23. Find actors who have not appeared in any "Horror" category films. Use a subquery to get actors who appeared in "Horror" and exclude them:

-- Step 1: actors in Horror films
SELECT actor.first_name, actor.last_name
FROM actor
JOIN film_actor 
USING (actor_id)
JOIN film 
USING (film_id)
JOIN film_category 
USING (film_id)
JOIN category 
USING (category_id)
WHERE category.name = 'Horror'
GROUP BY actor.actor_id;

-- Step 2: get actors outside this list
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id NOT IN (subquery);

-- Final query:
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id NOT IN (
  SELECT actor_id
  FROM actor
  JOIN film_actor 
  USING (actor_id)
  JOIN film 
  USING (film_id)
  JOIN film_category 
  USING (film_id)
  JOIN category 
  USING (category_id)
  WHERE category.name = 'Horror'
  GROUP BY actor.actor_id
);

-- Final version with CTE (presented in technical interview)

WITH excluded_actors AS (
  SELECT actor_id
  FROM actor
  JOIN film_actor
  USING (actor_id)
  JOIN film
  USING (film_id)
  JOIN film_category
  USING (film_id)
  JOIN category
  USING (category_id)
  WHERE category.name = 'Horror'
  GROUP BY actor.actor_id
)
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id NOT IN (SELECT actor_id FROM excluded_actors);

# This could also be done with a subquery using NOT IN (SELECT DISTINCT actor_id)

# 24. Find movie titles that are comedies and have a duration longer than 180 minutes:

SELECT fil.title, cat.name, fil.length
FROM film AS fil
INNER JOIN film_category 
USING (film_id)
INNER JOIN category AS cat
USING (category_id)
WHERE cat.name = 'Comedy'
  AND length >= 180;
