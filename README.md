# 🏦 Banking SQL Practice Project

## 📘 Project Overview

This project is a **beginner-level SQL practice** exercise that simulates a simplified banking system. It is designed to help build and demonstrate core SQL skills using a realistic relational database setup.

The project includes:
- Schema design for five related tables
- Sample data entries
- 20+ SQL queries, categorized for clarity
- Business insights, edge case handling, and data quality checks

All data is **fictional and created for learning purposes only**.

---

## 🗃️ Database Schema

The project consists of the following tables:

- **customer** – Personal details of each customer
- **account** – Accounts linked to customers and branches
- **employee** – Bank employees and their roles
- **branch** – Branch locations
- **txn** – Transactions performed on accounts

Each table uses appropriate data types, primary keys, and foreign keys to reflect real-world relationships.

---

## 🧠 Skills Demonstrated

- **Table creation and normalization**
- **Data population using `INSERT`**
- **Filtering and sorting (`WHERE`, `ORDER BY`)**
- **Table aliases for clean querying**
- **Inner and outer joins**
- **Aggregation (`SUM`, `AVG`, `COUNT`, `GROUP BY`)**
- **Subqueries**
- **Creating views**
- **Edge case analysis**
- **Basic data quality checks (duplicates, nulls, negatives)**

---

## 🧪 Query Categories

The SQL script is organized into the following sections:

1. **Basic Queries**
2. **Joins**
3. **Aggregation Queries**
4. **Subqueries**
5. **Edge Case Handling**
6. **Updates and Deletes (with caution)**
7. **Business Insight Queries**
8. **Views**
9. **Audit / Data Checks**

Each query is commented for clarity and includes edge case considerations like:
- Customers without accounts
- Transactions with zero or negative values
- Employees without managers

---

## 📝 Notes

- The project is kept intentionally lightweight and readable for educational purposes.
- No dashboard or visualization tools (e.g., Tableau) were used due to the limited size of the dataset.
- Queries are written and tested in **MySQL**.

---

## 📂 Folder Contents

- `Banking_Sql_Queries.sql` – Full SQL script with table creation, data inserts, and queries
- `README.md` – Project documentation (this file)

---

## 🙌 Acknowledgements

This project was built as a personal learning initiative to strengthen SQL fundamentals and simulate real-world data analysis tasks in the context of banking.

