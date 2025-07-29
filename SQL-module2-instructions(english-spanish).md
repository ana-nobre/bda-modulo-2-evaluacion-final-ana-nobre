# English Version (translated)

# Final Assessment – Module 2: SQL

- Before starting, you must create a new repository using GitHub Classroom through this [link](https://classroom.github.com/a/RM1jDKL2). Once created, clone it to your local machine. You will work on the exercise inside this folder.

- This assessment consists of a series of questions designed to evaluate your understanding and skills related to SQL.

- You may use external resources, including the internet, reference materials, and your own notes.

- Complete the exercises in a single `.sql` file.

---

## Exercises

**Sakila Database:**

For this assessment, we will use the **Sakila** database, which we’ve worked with throughout the SQL review. This sample database simulates a movie rental store. It includes tables like `film` (movies), `actor` (actors), `customer` (customers), `rental` (rentals), and `category` (categories), among others. These tables contain data for querying and analysis in the context of a video rental business.

1. Select all distinct movie titles.
2. Show the titles of all movies rated "NC-17".
3. Retrieve the title and description of all movies whose description contains the word "amazing".
4. Find the titles of all movies longer than 120 minutes.
5. Retrieve the first and last names of all actors.
6. Find actors whose last name contains "Gibson".
7. Find the names of actors with an `actor_id` between 10 and 25.
8. List titles of all movies whose rating is not "R", "PG-13", or "G".
9. Count the number of movies for each rating and show both rating and count.
10. Count the total number of movies rented by each customer. Show customer ID, first and last name, and the total.
11. Count the total number of movies rented per category and display the category name and count.
12. Calculate the average duration of movies for each rating and show the rating and the average.
13. Find the names of actors who appear in the movie titled "Indian Love".
14. List titles of all movies whose descriptions contain the word "dog" or "cat".
15. Is there any actor or actress who does not appear in any movie in the `film_actor` table?
16. Find the titles of all movies released between 2005 and 2010.
17. Find the titles of all movies that belong to the same category as "Comedy".
18. List names of actors who have appeared in more than 14 movies.
19. Find titles of all movies rated "R" and longer than 2 hours.
20. Find categories of movies with an average length above 120 minutes. Show category name and average duration.
21. Find actors who have acted in at least 5 movies. Show actor name and total movies.
22. Find titles of movies rented for more than 5 days. Use a subquery to retrieve `rental_ids` with duration greater than 5 days, then find related films.
23. Find the names of actors who have **not** acted in any "Horror" movies. Use a subquery to exclude actors who have.
24. Find titles of all **comedy** movies longer than 180 minutes.

---

## Guidelines

This exercise is meant to be completed individually during class, though you are allowed to ask questions to your instructor and classmates if necessary. They won’t give you direct solutions but can provide helpful hints. Even though collaboration is encouraged, you must **not copy someone else’s code** or access another student’s computer. We trust your integrity.

This evaluation is an opportunity to understand how you’re progressing, which areas you’ve mastered, and which topics need reinforcement in the coming weeks. We strongly encourage you to **submit only code you understand** — avoid turning in copied code that you can’t explain.

If we detect code that doesn’t appear to be your own — or that you can’t explain or defend — you will be required to complete a re-assessment. Remember: your goal is not just to pass this module, but to **become a data analyst**. Keep this in mind at all times.

Once submitted, you will go through a 20-minute review of your work with your instructor. This will simulate a **technical interview**: you'll be asked to explain your logic and the decisions behind your solutions.

This is a great opportunity to practice real interview dynamics. You'll be asked to implement changes to your code that you weren't prepared for — just like in a real job setting. Try not to seek hints from classmates about the feedback process, so you can treat it as a real practice run and manage the pressure in a safe environment with your instructor.

At the end of the review, you’ll receive detailed feedback on both strengths and areas for improvement, and you’ll know exactly which learning objectives you've achieved.

---

## Evaluation Criteria

Here are the criteria we’ll use to assess your work. If you fail to meet at least 80% of these — or miss any **critical criteria** (marked with `*`) — you’ll be asked to complete a reassessment. This is to ensure you're well prepared to move forward confidently in your learning and future career.

### SQL

- Mastery of basic queries: `SELECT`, `UPDATE`, `DELETE`, `INSERT`  *
- Confident use of `GROUP BY`, `WHERE`, and `HAVING` clauses   *
- Mastery of different types of `JOIN` operations (including `UNION`, `UNION ALL`)  *
- Correct use of subqueries  *
- Ability to work with correlated subqueries

### Additional Requirements

- Your GitHub repository must include a **README** file briefly explaining how to start or use the project.

---

**Let’s get to it!**


# Spanish Version (original)

# Evaluación Final Módulo 2: SQL

- Antes de empezar, hay que crear un nuevo repositorio desde GitHub Classroom usando este [enlace](https://classroom.github.com/a/RM1jDKL2). Una vez creado, hay que clonar en nuestro ordenador y en la carpeta creada empezaremos a trabajar en el ejercicio.

- Esta evaluación consta de una serie de preguntas que evalúan tu comprensión y habilidades en relación con SQL.

- Puedes usar recursos externos, incluyendo internet y materiales de referencia o tus propias notas.

- Completa los ejercicios en un archivo sql.

## Ejercicios

**Base de Datos Sakila:**

Para este ejercicio utilizaremos la bases de datos Sakila que hemos estado utilizando durante el repaso de SQL. Es una base de datos de ejemplo que simula una tienda de alquiler de películas. Contiene tablas como `film` (películas), `actor` (actores), `customer` (clientes), `rental` (alquileres), `category` (categorías), entre otras. Estas tablas contienen información sobre películas, actores, clientes, alquileres y más, y se utilizan para realizar consultas y análisis de datos en el contexto de una tienda de alquiler de películas.

1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

2. Muestra los nombres de todas las películas que tengan una clasificación de "NC-17".

3. Encuentra el título y la descripción de todas las películas que contengan la cadena de caracteres "amazing" en su descripción.

4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

5. Recupera los nombres y apellidos de todos los actores.

6. Encuentra el nombre y apellidos de los actores que tengan "Gibson" en su apellido.

7. Encuentra los nombres y apellidos de los actores que tengan un actor_id entre 10 y 25.

8. Encuentra el título de las películas en la tabla `film` que no sean ni "R" ni "PG-13" ni "G" en cuanto a su clasificación.

9. Encuentra la cantidad total de películas en cada clasificación de la tabla `film` y muestra la clasificación junto con el recuento.

10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

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

