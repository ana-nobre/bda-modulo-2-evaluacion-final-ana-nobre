# Módulo SQL: Teste Final

USE Sakila;

# 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados:

SELECT *						# Query para explorar la tabla - se identifica que en la columna title están presentes los nombres de las películas.
FROM film; 						

SELECT DISTINCT title			# El DISTINCT se utiliza para seleccionar los valores únicos de la columna title - columna que están los nombres de las peliculas.
FROM film; 						

# 2. Muestra los nombres de todas las películas que tengan una clasificación de "NC-17":

SELECT *						# Query para explorar la tabla - se identifica que en la columna title están presentes los nombres de las películas.
FROM film
LIMIT 10; 						

SELECT title, rating			# WHERE filtra los resultados de la columna con la condición "NC-17".
FROM film 
WHERE rating = "NC-17";

SELECT title 					# Si solamente queremos los nombres de las películas con esta condición pero sin enseñar el rating, esta seria la query final.
FROM film 
WHERE rating = "NC-17";


SELECT title, rating			
FROM film 
WHERE rating IN ('NC-17', 'PG-13');

# 3. Encuentra el título y la descripción de todas las películas que contengan la cadena de caracteres "amazing" en su descripción:

SELECT *									# Query para explorar la tabla - se identifica la columna description
FROM film
LIMIT 10; 	

SELECT title, description 					# Para buscar una cadena de caracteres dentro de la columna description utilizaremos el REGEX
FROM film 
WHERE description REGEXP 'amazing';

# 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT *									# Query para explorar la tabla - se identifica la columna length.
FROM film
LIMIT 10; 	

SELECT title,length							# WHERE filtra los resultados de la columna length con la condición > 120.
FROM film
WHERE length > 120;

# 5. Recupera los nombres y apellidos de todos los actores.

SELECT *									# Query para explorar la tabla - se identifican las columnas first_name y last_name.
FROM actor
LIMIT 10; 	

SELECT first_name, last_name				# SELECT extrae los datos de las columnas seleccionadas. 
FROM actor; 

# 6. Encuentra el nombre y apellidos de los actores que tengan "Gibson" en su apellido.

SELECT first_name, last_name				# SELECT extrae los datos de las columnas first_name y last_name mientras REGEX permite buscar y filtrar datos como 'Gibson'.
FROM actor
WHERE last_name REGEXP 'Gibson';

# 7. Encuentra los nombres y apellidos de los actores que tengan un actor_id entre 10 y 25.

SELECT actor_id, first_name, last_name		# SELECT extrae los datos de las columnas first_name y last_name mientras WHERE filtra la condición actor_id >= 10 AND actor_id <= 25.
FROM actor
WHERE actor_id >= 10 AND actor_id <= 25;    # Después de verificar que los actor_id cumplían la condición deseada, saqué esta columna del select para dejar solamente lo que se pedía, los nombres y apellidos. 

SELECT first_name, last_name                # Para quedar más simples se utilizará el BETWEEN.
FROM actor
WHERE actor_id BETWEEN 10 AND 25;

# 8. Encuentra el título de las películas en la tabla `film` que no sean ni "R" ni "PG-13" ni "G" en cuanto a su clasificación.

SELECT *									# Query para explorar la tabla - se identifica la columna rating que contiene las clasificaciones solicitadas.
FROM film
LIMIT 10; 	

SELECT title, rating						# NOT IN selecciona las lineas en la columna rating que no coinciden con multiples valores proporcionados 'R', 'PG-13', 'G'	
FROM film
WHERE rating NOT IN ('R', 'PG-13', 'G');

# 9. Encuentra la cantidad total de películas en cada clasificación de la tabla `film` y muestra la clasificación junto con el recuento.

SELECT *									# Query para explorar la tabla - se identifica la rating con la que contiene las clasificaciones solicitadas
FROM film
LIMIT 10; 	

SELECT rating								# Query para agrupar por clasificación
FROM film
GROUP BY rating;

SELECT rating, COUNT(title) 				# Se agrega el COUNT para que se cuente la cantidad total de películas (title) en cada clasificación
FROM film
GROUP BY rating;

SELECT rating, COUNT(title) 				
FROM film
GROUP BY rating
HAVING COUNT(title) > 200;

# 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT * 									# Query para explorar la tabla - se identifica customer_id como valor en común con la tabla customer, donde sacaremos sus nombres y apellidos.
FROM rental;

SELECT customer_id, COUNT(inventory_id)		# Query para encuentrar la cantidad total de películas alquiladas por cada cliente.
FROM rental
GROUP BY customer_id;

SELECT cus.customer_id, cus.first_name, cus.last_name, COUNT(ren.inventory_id) AS total_peliculas		# Ahora hay que hacer un JOIN con la tabla customer para que tengamos accesso a los nombres y apellidos de los clientes
FROM rental AS ren																						# Fue necesario aplicar alias, para que se identificara el origen de las columnas en SELECT
INNER JOIN customer AS cus																				# Todas las columnas del SELECT que no estén en funciones de agregación deben estar en GROUP BY cuando este es utilizado
USING (customer_id)
GROUP BY cus.customer_id, cus.first_name, cus.last_name;												

# 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
# Conexión entre tablas para llegar de rental a category (rental/inventory/film/film_category/category) -> Ver diagrama

SELECT * 									    # Query para explorar la tabla (inventory_id)
FROM rental
LIMIT 20;					

SELECT *										# Query para explorar la tabla (category_id, name)
FROM category
LIMIT 20;

SELECT *										# Query para explorar la tabla (conecta la tabla film con category)
FROM film_category
LIMIT 20;

# JOINS   -    las joins nos ayudan a combinar datos de varias tablas para obtener una vista completa y útil
SELECT ren.rental_id, inv.film_id
FROM rental AS ren
INNER JOIN inventory AS INV 
USING (inventory_id)
INNER JOIN film AS fil 
USING (film_id)
INNER JOIN film_category AS filcat 
USING (film_id)
INNER JOIN category AS cat 
USING (category_id);

# Query final:
SELECT cat.name AS categoria, COUNT(ren.rental_id) AS total_alquileres
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

# 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla `film` y muestra la clasificación junto con el promedio de duración.

SELECT rating, AVG(length) AS promedio_duracion 					# AVG es utilizado para calcular promedios/averages
FROM film															# GROUP BY rating es la forma de agrupar por clasificacion/rating
GROUP BY rating;

# 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT actor.first_name, actor.last_name,film.title					# Nombre y apellido esta en la tabla actor y los nombres de las peliculas en la tabla film. Asi que fue necesario hacer un join entre actor y film_actor, 
FROM actor															# ya que esta tabla tiene actor_id y film_id que sirven de 'puente' entre las tablas actor y film.
INNER JOIN film_actor
USING (actor_id)
INNER JOIN film 
USING (film_id)
WHERE film.title = 'Indian Love';

# 14. Muestra el título de todas las películas que contengan la cadena de caracteres "dog" o "cat" en su descripción.

SELECT title, description	   # Muestra el título y la descripción de todas las películas.
FROM film;

SELECT title, description	   # WHERE incluye una condición y REGEX la cadena de caracteres que coincide con "dog" o "cat" en su descripción.
FROM film					   # No podríamos usar el IN/=, pues estos comparan si el valor es exactamente igual y lo que queremos es encontrar estas cadenas en cualquier parte de la descripción.
WHERE description REGEXP 'dog' 
OR description REGEXP 'cat';

SELECT title, description	   # Sin embargo pordríamos también utilizar LIKE con otra sintaxis.
FROM film															
WHERE description LIKE '%dog%' 
OR description LIKE '%cat%';

# 15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla `film_actor`.

SELECT act.actor_id, act.first_name, act.last_name					# Como queremos comparar dos columnas y verificar si uno de los elementos (actor/actriz) no aparece conectado con la lista completa de peliculas, el LEFT JOIN es lo mas indicado,
FROM actor AS act													# pues traje todos los artistas  aunque no tengan film_id (película).
LEFT JOIN film_actor AS fil											# Respuesta: No hay ningún actor o actriz que no aparezca en ninguna película en la tabla `film_actor`.
USING (actor_id)
WHERE fil.actor_id IS NULL;

# Tambien podría tener sido resuelto con una subconsulta
SQL
SELECT actor.first_name, actor.last_name
FROM actor
WHERE actor_id NOT IN (SELECT actor_id FROM film_actor);

# 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT title, release_year 
FROM film 
WHERE release_year >= 2005 AND release_year <= 2010;

# 17. Encuentra el título de todas las películas que son de la misma categoría que "Comedy".

SELECT fil.title, cat.name			# Join de film a film_category como un 'puente' para llegar a la tabla category 
FROM film AS fil
INNER JOIN film_category 
USING (film_id)
INNER JOIN category AS cat
USING (Category_id)
WHERE cat.name = 'Comedy';

# 18. Muestra el nombre y apellido de los actores que aparecen en más de 14 películas.

SELECT a.first_name, a.last_name			# Join de actor a film_actor como un 'puente' para llegar a la tabla film.
FROM actor AS a
INNER JOIN film_actor
USING (actor_id)
INNER JOIN film
USING (film_id)
GROUP BY a.first_name, a.last_name 
HAVING COUNT(film.film_id) >= 14;          # COUNT va a contar los id únicos de film (película).

# 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla `film`.
# Entiendo que en rating/clasificación hay un acrónimo "R" que significa restricted. 
# De esta forma, la siguiente query son de todas las peliculas que son restricted con duración (length) mayor de 2h (120 min).

SELECT title AS Películas, length AS Duración, rating AS Restricted 	
FROM film 
WHERE length > 120
AND rating = 'R';

# 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
# GROUP BY category las que tienen promedio (AVG) > 120 min.

# Paso 1
SELECT fil.title AS 'Películas', fil.length AS Duración, cat.name AS "Categoría"	# Primero hice una lista de las películas individualmente que tienen duraccion +120min con su duracción y nombre de categoria. 						
FROM film AS fil
INNER JOIN film_category 
USING (film_id)
INNER JOIN category AS cat
USING (Category_id)
WHERE length > 120;

# Query final 
SELECT AVG(fil.length) AS Duración, cat.name AS "Categoría"		# Después, calculé la media de duracción por categoria incluyendo el AVG en length. 			
FROM film AS fil												# Por fin, agrupé las categorias con GROUP BY Categoria (cat.name), filtré con HAVING los promedios superiores a 120 y 
INNER JOIN film_category 									    # Quité el fil.title del SELECT ya que el GROUP BY agrupara por cat.name AS "Categoría" y no por filme.
USING (film_id)
INNER JOIN category AS cat
USING (Category_id)
GROUP BY cat.name
HAVING AVG(fil.length) > 120;

# 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.

SELECT act.first_name, act.last_name, COUNT(fil.title) AS cantidad_peliculas     # Queremos que se enseñe nombre, apellidos y que se cuenten la cantidad de peliculas, para que en el futuro filtremos por los actores que han actuado en al menos 5 películas.
FROM actor AS act
INNER JOIN film_actor						 # Hay que hacer un JOIN pues no hay una sola tabla que tenga los nombres de actores y nombres de filmes.
USING(actor_id)
INNER JOIN film AS fil
USING(film_id)
GROUP BY act.first_name, act.last_name		# Agrupamos por actores que estén relacionados con 5 titulos de peliculas minimo, o sea que han actuado en al menos 5 películas.
HAVING COUNT(fil.title) >= 5;

# 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
# Utilice inventory_id pues es la tabla intermedia entre rental y film.
# Estaba en duda si el rental_duration from film era la cantidad de días que las películas fueron alquiladas o que podrían ser alquiladas, asi que use DATEDIFF(return_date, rental_date) en la tabla rental para estar segura del valor que seria utilizado para solucionar el problema.

#Paso 1
SELECT * 			# usado para explorar la tabla. 
FROM rental;

# Paso 2
# DATEDIFF(data_final, data_inicial) - función nativa del SQL que calcula la diferencia entre dos fechas em número de días.
SELECT rental_id, rental_date, return_date, DATEDIFF(return_date, rental_date) AS dias_alquiler
FROM rental
WHERE DATEDIFF(return_date, rental_date) > 5;

# Query final
SELECT title
FROM film
WHERE film_id IN (
SELECT DISTINCT i.film_id
FROM inventory as i
JOIN rental as r ON i.inventory_id = r.inventory_id
WHERE DATEDIFF(return_date, rental_date) > 5
);

# 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.

# Paso 1: actores que actúan en Horror 
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

# Paso 2: Buscar los actores fuera de esta lista
SELECT actor_id,first_name, last_name
FROM actor
WHERE actor_id NOT IN (subconsulta);

# Query final:
SELECT actor_id,first_name, last_name
FROM actor
WHERE actor_id NOT IN (SELECT actor_id                        # Se cambió a actor_id pues no acepta dos columnas first_name, last_name.
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
						GROUP BY actor.actor_id);

# Consulta final con CTEs presentada durante la entrevista tecnica

# CTEs 
WITH subconsulta AS (SELECT actor_id
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
						GROUP BY actor.actor_id)
SELECT actor_id,first_name, last_name
FROM actor
WHERE actor_id NOT IN (SELECT actor_id FROM subconsulta); 

# También podria ser hecho con subconsulta (NOT IN SELECT DISTINCT actor_id)                       

# 24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla `film`.

SELECT fil.title, cat.name, fil.length								
FROM film AS fil
INNER JOIN film_category 
USING (film_id)
INNER JOIN category AS cat
USING (Category_id)
WHERE cat.name = 'Comedy'
AND length >= 180;