# Modulo 2: Teste Final

USE Sakila;

# 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados:

SELECT *						# Query ara explorar la tabla - se identifica que en la columna title estan presentes los nombres de las peliculas
FROM film; 						

SELECT DISTINCT title			# El DISTINCT se utiliza para selecionar los valores unicos de la columna title - columna que estan los nombres de las peliculas
FROM film; 						

# 2. Muestra los nombres de todas las películas que tengan una clasificación de "NC-17":

SELECT *						# Query para explorar la tabla - se identifica que en la columna rating estan los valores solicitados
FROM film
LIMIT 10; 						

SELECT title, rating			# WHERE filtra los resultados de columna con las condicion "NC-17"
FROM film 
WHERE rating = "NC-17";

SELECT title 					# Si solamente queremos los nombres de las peliculas con esta condicion pero sin ensenar el rating, esta seria la query final
FROM film 
WHERE rating = "NC-17";

# 3. Encuentra el título y la descripción de todas las películas que contengan la cadena de caracteres "amazing" en su descripción:

SELECT *									# Query para explorar la tabla - se identifica la columna description
FROM film
LIMIT 10; 	

SELECT title, description 					# Para buscar una cadena de caracteres dentro da description utilizaremos el REGEX
FROM film 
WHERE description REGEXP 'amazing';

# 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT *									# Query para explorar la tabla - se identifica la columna length
FROM film
LIMIT 10; 	

SELECT title,length							# WHERE filtra los resultados de columna length con la condicion > 120
FROM film
WHERE length > 120;

# 5. Recupera los nombres y apellidos de todos los actores.

SELECT *									# Query para explorar la tabla - se identifica las columnas first_name y last_name
FROM actor
LIMIT 10; 	

SELECT first_name, last_name				# SELECT extrae los datos de las columnas selecionadas 
FROM actor; 

# 6. Encuentra el nombre y apellidos de los actores que tengan "Gibson" en su apellido.

SELECT first_name, last_name				# SELECT extrae los datos de las columnas first_name y las_name mientras REGEX permite buscar y filtrar datos como 'Gibson'
FROM actor
WHERE last_name REGEXP 'Gibson';

# 7. Encuentra los nombres y apellidos de los actores que tengan un actor_id entre 10 y 25.

SELECT actor_id, first_name, last_name		# SELECT extrae los datos de las columnas first_name y las_name mientras WHERE filtra la condicion actor_id >= 10 AND actor_id <= 25
FROM actor
WHERE actor_id >= 10 AND actor_id <= 25;


SELECT first_name, last_name				# Despues de verificar que los actor_id cumplian la condicion deseada, saque esta columna del select para dejar solamente lo que se pedia, los nombres y apellidos 
FROM actor
WHERE actor_id >= 10 AND actor_id <= 25;

# 8. Encuentra el título de las películas en la tabla `film` que no sean ni "R" ni "PG-13" ni "G" en cuanto a su clasificación.

SELECT *									# Query para explorar la tabla - se identifica la rating con la que contiene las clasificaciones solicitadas
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

SELECT rating, COUNT(title) 				# Se agrega el COUNT para que se conte la cantidad total de películas (title) en cada clasificación
FROM film
GROUP BY rating;

# 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT * 									# Query para explorar la tabla - se identifica customer_id como valor en comum con la tabla customer, donde sacaremos sus nombres y apellidos
FROM rental;

SELECT customer_id, COUNT(inventory_id)		# Query para encuentrar la cantidad total de películas alquiladas por cada cliente
FROM rental
GROUP BY customer_id;


SELECT cus.customer_id, cus.first_name, cus.last_name, COUNT(ren.inventory_id) AS total_peliculas		# Ahora hay que hacer un JOIN con la tabla customer para que tengamos acesso a los nombres y apellidos de los clientes
FROM rental AS ren																						# Fue necesario aplicar alias, para que se identificara el origen de las columnas en SELECT
JOIN customer AS cus																					# Todas las columnas del SELECT que no esten en funciones de agregacion deven estar en GROUP BY cuando este es utilizado
USING (customer_id)
GROUP BY cus.customer_id, cus.first_name, cus.last_name;												






11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla `film` y muestra la clasificación junto con el promedio de duración.

13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

14. Muestra el título de todas las películas que contengan la cadena de caracteres "dog" o "cat" en su descripción.

15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla `film_actor`.

16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

17. Encuentra el título de todas las películas que son de la misma categoría que "Comedy".

18. Muestra el nombre y apellido de los actores que aparecen en más de 14 películas.

19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla `film`.

20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.

21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.

22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.

23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.

24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla `film`.


## Normas

Este ejercicio está pensado para que lo realices de forma individual en clase, pero podrás consultar tus dudas con la profesora y tus compañeras si lo consideras necesario. Ellas no te darán directamente la solución de tu duda, pero sí pistas para poder solucionarla. Aún facilitando la comunicación entre compañeras, durante la prueba no debes copiar código de otra persona ni acceder a su portátil. Confiamos en tu responsabilidad.

La evaluación es una buena oportunidad para conocer cómo estás progresando, saber qué temas debes reforzar durante las siguientes semanas y cuáles dominas. Te recomendamos que te sientas cómoda con el ejercicio que entregues y no envíes cosas copiadas que no entiendas.

Si detectamos que has entregado código que no es tuyo, no entiendes y no lo puedes defender, pasarás directamente a la re-evaluación del módulo. Tu objetivo no debería ser pasar la evaluación sino convertirte en analista de datos, y esto debes tenerlo claro en todo momento.

Una vez entregado el ejercicio realizarás una revisión del mismo con la profesora (20 minutos), que se asemejará a una entrevista técnica: te pedirá que expliques las decisiones tomadas para realizarlo.

Es una oportunidad para practicar la dinámica de una entrevista técnica donde te van a proponer cambios sobre tu código que no conoces a priori. Si evitas que otras compañeras te den pistas sobre la dinámica de feedback, podrás aprovecharlo como una práctica y pasar los nervios con la profesora en lugar de en tu primera entrevista de trabajo.

Al final tendrás un feedback sobre aspectos a destacar y a mejorar en tu ejercicio, y sabrás qué objetivos de aprendizaje has supera

## Criterios de evaluación

Vamos a listar los criterios de evaluación de este ejercicio. Si no superas al menos el 80% de estos criterios o no has superado algún criterio clave (marcados con \*) te pediremos que realices una re-evaluación con el fin de que termines el curso mejor preparada y enfrentes tu primera experiencia profesional con más seguridad. En caso contrario, estás aprendiendo al ritmo que hemos pautado para poder afrontar los conocimientos del siguiente módulo.

### SQL

- Dominar las queries básicas: SELECT; UPDATE; DELETE; INSERT \*
- Dominar las funciones `groupby`, `where` y `having``. \*
- Dominar el uso de `joins` (incluyendo `union` y `union all``)\*
- Dominar el uso de subconsultas. \*
- Dominar el uso de las subconsultas correlacionadas

### Otros criterios a tener en cuenta

- El repositorio de GitHub debe tener README explicando muy brevemente cómo arrancar el proyecto.

¡Al turrón!
