# Final Assessment – SQL Module (Adalab)

This repository presents the solutions developed during the **live technical assessment** of the SQL module, using the **Sakila** relational database. It features 24 business-driven SQL exercises that reflect real-world business scenarios and the technical depth expected in SQL-oriented roles.

---

## 💡 Description

This project demonstrates hands-on SQL capabilities that are highly valued by companies in the fields of data analytics, business intelligence, and SQL-based decision-making:

- **Subqueries**, including correlated subqueries  
- **JOIN optimization** (`INNER JOIN`, `LEFT JOIN`)  
- Use of **Common Table Expressions (CTEs)** for modular queries  
- **REGEXP** for pattern extraction and string filtering  
- Aggregation functions (`AVG`, `COUNT`, `SUM`) and advanced filtering  
- Clean, modular SQL and structured technical reasoning

📝 The SQL script includes in-line comments (using `#`) to explain the logic and decision-making behind each query.

---

## 📌 Sample Queries

> ✨ This README includes selected SQL examples to demonstrate real-world use of advanced techniques like CTEs, subqueries, REGEXP, and optimized JOINs, aligned with technical competencies frequently assessed in data and business roles.

### 🔎 REGEXP for Pattern Matching

```sql
SELECT title, description
FROM film 
WHERE description REGEXP 'amazing';
```

### 🧱 CTE Used During the Live Technical Interview

```sql
WITH horror_actors AS (
    SELECT actor_id
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    WHERE category.name = 'Horror'
    GROUP BY actor_id
)
SELECT actor_id,first_name, last_name
FROM actor
WHERE actor_id NOT IN (SELECT actor_id FROM subconsulta
);
```

### 🤝 Optimized JOINs for Aggregated Metrics

```sql
SELECT cus.first_name, cus.last_name, COUNT(ren.inventory_id) AS total_rentals
FROM rental ren
INNER JOIN customer cus USING (customer_id)
GROUP BY cus.customer_id, cus.first_name, cus.last_name;
```
---

## ⚙️ Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/Adalab/bda-modulo-2-evaluacion-final-ana-nobre.git
   ```

2. Read the translated instructions in `SQL-module2-instructions-en.md`.

3. Make sure you have MySQL and MySQL Workbench installed.

4. Download and import the **Sakila** database from:  
   [https://dev.mysql.com/doc/index-other.html](https://dev.mysql.com/doc/index-other.html)

5. Open `Queries-with-comments-en(translated).sql` in MySQL Workbench and execute the queries block by block.

---

## 🧰 Requirements

- MySQL 8.0 or higher  
- MySQL Workbench  
- Sakila database installed locally

---

## 📁 Repository Structure

```
├── Queries-with-comments-es(original).sql     # Original queries (in Spanish)
├── SQL-Final-Assessment-Instructions.md       # Instructions translated to English
├── Sakila-er-diagram.png                      # ER diagram (used as reference)
└── README.md                                  # Project overview (this file)
```

---

## 📚 Useful Resources

- [MySQL SQL Syntax Overview](https://dev.mysql.com/doc/refman/8.0/en/sql-statements.html)  
- [MySQL REGEXP Reference](https://dev.mysql.com/doc/refman/8.0/en/regexp.html)  
- [Common Table Expressions (CTE) – WITH Clause](https://dev.mysql.com/doc/refman/8.0/en/with.html)  
- [JOIN Syntax and Optimization](https://dev.mysql.com/doc/refman/8.0/en/join.html)  

---

## 📝 Instructor Feedback

> "You created a great README — congratulations! I recommend adding some sample queries to showcase your work."

> "You answered the interview questions well, expressing yourself clearly and with strong vocabulary. Great job!"

**Evaluation Summary**:
- SQL Syntax: ✅ Meets objectives  
- SQL Comments: 🌟 Outstanding  
- Understanding of Basic Queries: 👍 Notable  
- Use of Aggregation Functions: 🌟 Outstanding  
- Joins: 🌟 Outstanding  
- Subqueries and Correlated Subqueries: 👍 Notable  
- Git Usage: 👍 Notable  
- **Overall Rating**: **Notable**

> "You solved the exercises very well. Try to improve the structure and readability of longer queries. Excellent work with `REGEXP`!"

> "During the live technical interview, you presented query 23 using a CTE — great job!"

---

## 👩‍💻 Author

Project developed by Ana Nobre as part of the final technical interview and evaluation for the SQL module at Adalab.

---

📌 This repository is a personalized fork of the original SQL assessment project from Adalab.  
For the official version in Spanish, you can access it [here](https://github.com/Adalab/bda-modulo-2-evaluacion-final-ana-nobre).
