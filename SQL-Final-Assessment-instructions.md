# Final Assessment Module 2: SQL

- Before starting, you must create a new repository using GitHub Classroom through this [link](https://classroom.github.com/a/RM1jDKL2). Once created, clone it to your computer and begin working on the exercise in the newly created folder.

- This assessment consists of a series of questions that evaluate your understanding and skills related to SQL.

- You may use external resources, including the internet, reference materials, or your own notes.

- Complete the exercises in a `.sql` file.

## Exercises

**Sakila Database:**

For this exercise, we will use the Sakila database we have been working with during the SQL review. This is a sample database simulating a movie rental store. It contains tables such as `film`, `actor`, `customer`, `rental`, `category`, among others. These tables store information about movies, actors, customers, rentals, and more, and are used to perform queries and data analysis in the context of a movie rental store.

1. Select all movie titles without showing duplicates.  
2. Display the titles of all movies that have a rating of "NC-17".  
3. Find the title and description of all movies that contain the string "amazing" in their description.  
4. Find the titles of all movies with a duration longer than 120 minutes.  
5. Retrieve the first and last names of all actors.  
6. Find the first and last names of actors whose last name includes "Gibson".  
7. Find the first and last names of actors whose `actor_id` is between 10 and 25.  
8. Find the titles of movies in the `film` table that are not rated "R", "PG-13", or "G".  
9. Find the total number of movies for each rating in the `film` table and display the rating along with the count.  
10. Find the total number of movies rented by each customer, and show the customer ID, first name, last name, and the number of movies rented.  
11. Find the total number of movies rented by category and show the category name along with the count of rentals.  
12. Find the average duration of movies for each rating in the `film` table and show the rating along with the average duration.  
13. Find the first and last names of the actors who appear in the movie titled "Indian Love".  
14. Show the titles of all movies that contain the string "dog" or "cat" in their description.  
15. Is there any actor or actress who does not appear in any movie in the `film_actor` table?  
16. Find the titles of all movies released between the years 2005 and 2010.  
17. Find the titles of all movies that belong to the same category as "Comedy".  
18. Show the first and last names of actors who appear in more than 14 movies.  
19. Find the titles of all movies that are rated "R" and have a duration longer than 2 hours in the `film` table.  
20. Find the movie categories that have an average duration greater than 120 minutes and display the category name along with the average duration.  
21. Find the actors who have acted in at least 5 movies and display the actor's name along with the number of movies they have acted in.  
22. Find the titles of all movies that were rented for more than 5 days. Use a subquery to find the `rental_ids` with a duration over 5 days and then select the corresponding movies.  
23. Find the first and last names of actors who have not acted in any movie from the "Horror" category. Use a subquery to find the actors who have acted in "Horror" movies and exclude them from the actor list.  
24. Find the titles of movies that are comedies and have a duration greater than 180 minutes in the `film` table.  

## Guidelines

This exercise is designed to be completed individually in class, but you may ask the instructor or your classmates if you need help. They will not give you the solution directly but will provide hints to help you find it. Even though communication with peers is allowed, during the assessment you must not copy code from others or access their laptops. We trust in your responsibility.

The assessment is a valuable opportunity to understand your progress, identify which topics you need to reinforce in the coming weeks, and recognize those you have already mastered. We recommend that you feel comfortable with the work you submit and refrain from submitting copied content that you do not understand.

If we detect that you have submitted code that is not your own, that you do not understand, and cannot explain, you will be immediately required to retake the module assessment. Your goal should not be merely to pass the evaluation, but to become a data analyst, and you must keep this in mind at all times.

Once you submit the exercise, you will review it with your instructor (20 minutes), in a session similar to a technical interview: you will be asked to explain the decisions made during the task.

This is an opportunity to practice the dynamics of a technical interview, where you will be asked to make changes to your code without knowing them in advance. If you avoid receiving tips from classmates about the feedback session, you will be able to use it as practice and face any nerves with your instructor instead of during your first job interview.

At the end, you will receive feedback highlighting strengths and areas for improvement in your exercise, as well as the learning objectives you have achieved.

## Evaluation Criteria

Below are the evaluation criteria for this exercise. If you do not meet at least 80% of these criteria or fail to meet a key criterion (marked with `*`), you will be required to retake the assessment to ensure you complete the course better prepared and face your first professional experience with greater confidence. Otherwise, you are progressing at the expected pace to tackle the content of the next module.

### SQL

- Mastery of basic queries: `SELECT`, `UPDATE`, `DELETE`, `INSERT` *  
- Mastery of `GROUP BY`, `WHERE`, and `HAVING` functions *  
- Mastery of `JOINS` (including `UNION` and `UNION ALL`) *  
- Mastery of subqueries *  
- Mastery of correlated subqueries  

### Other criteria to consider

- The GitHub repository must include a `README` briefly explaining how to run the project.

**Let’s get started!**

---

📌 This repository is a personalized fork of the original SQL assessment project from Adalab.  
For the official version in Spanish, you can access it [here](https://github.com/Adalab/bda-modulo-2-evaluacion-final-ana-nobre).