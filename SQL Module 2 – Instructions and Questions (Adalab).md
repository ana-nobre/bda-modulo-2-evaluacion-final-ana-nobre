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
