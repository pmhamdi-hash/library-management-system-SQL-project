#  Library Management System --- SQL Project

A PostgreSQL-based Library Management System designed to demonstrate
practical SQL and database management skills.

##  Project Overview

This project implements a complete library database using PostgreSQL. It
covers database creation, table relationships, CRUD operations, data
analysis, joins, aggregations, CTAS queries, and stored procedures.

###  Technologies

-   **Database:** PostgreSQL
-   **Language:** SQL / PL/pgSQL
-   **Level:** Intermediate

##  Objectives

-   Design and create a relational library database.
-   Create tables with primary and foreign keys.
-   Insert, retrieve, update, and delete data.
-   Practice `WHERE`, `GROUP BY`, `HAVING`, `JOIN`, and aggregate
    functions.
-   Use CTAS (`CREATE TABLE AS SELECT`) to generate summary tables.
-   Analyze library activity and rental revenue.
-   Create stored procedures for issuing and returning books.
-   Generate reports about branches, employees, members, and books.

## Database Schema

The database is named:

``` sql
CREATE DATABASE library_db;
```

The main tables are:

-   `branch`
-   `employees`
-   `members`
-   `books`
-   `issued_status`
-   `return_status`

The tables are connected through primary and foreign key relationships
to maintain data integrity.

## 🔄 CRUD Operations

The project demonstrates the four fundamental database operations:

-   **Create** --- Insert new books and records.
-   **Read** --- Retrieve information using `SELECT`.
-   **Update** --- Modify existing records.
-   **Delete** --- Remove records using conditions.

## 🔎 SQL Queries & Data Analysis

The project contains queries for:

-   Finding books by category.
-   Calculating rental income by category.
-   Finding members with recent registrations.
-   Displaying employees and branch managers.
-   Finding expensive books.
-   Identifying books that have not been returned.
-   Detecting overdue books.
-   Finding employees who process the most book issues.
-   Analyzing branch performance.
-   Identifying active members.
-   Calculating overdue fines.

## 🔗 JOIN Operations

Different JOIN operations are used to combine related data from multiple
tables.

Example:

``` sql
SELECT
    e.emp_id,
    e.emp_name,
    e.position,
    b.branch_id,
    b.branch_address
FROM employees AS e
JOIN branch AS b
    ON e.branch_id = b.branch_id;
```

## 📊 Aggregations

Aggregate functions are used to analyze library data:

-   `COUNT()`
-   `SUM()`
-   `GROUP BY`
-   `HAVING`

Example:

``` sql
SELECT
    category,
    SUM(rental_price)
FROM books
GROUP BY category;
```

## 🏗️ CTAS --- Create Table As Select

The project uses CTAS to create new tables from query results.

Example:

``` sql
CREATE TABLE book_issued_cnt AS
SELECT
    b.isbn,
    b.book_title,
    COUNT(ist.issued_id) AS issue_count
FROM issued_status AS ist
JOIN books AS b
    ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;
```

## ⚙️ Stored Procedures

PL/pgSQL stored procedures are used to automate library operations.

### Issue a Book

The `issue_book` procedure checks whether a book is available, creates
the issue record, updates its status, and displays an appropriate
message.

### Return a Book

The return procedure records the returned book, retrieves the issued
book information, updates the book status, and displays a confirmation
message.

## 📈 Reports

The project includes reports covering:

-   Database schema and relationships.
-   Book categories and rental prices.
-   Member activity.
-   Employee performance.
-   Branch performance.
-   Issued and returned books.
-   Overdue books and fines.

## 🚀 How to Use

### 1. Clone the repository

``` bash
git clone <YOUR_REPOSITORY_URL>
cd library-management-system-sql
```

### 2. Create the database

``` sql
CREATE DATABASE library_db;
```

### 3. Run the SQL scripts

Execute the database setup and analysis SQL files in PostgreSQL.

### 4. Explore the queries

Experiment with:

-   `JOIN`
-   `GROUP BY`
-   `HAVING`
-   Subqueries
-   Aggregate functions
-   CTAS
-   Stored procedures

## 📁 Project Structure

``` text
library-management-system-sql/
│
├── database_setup.sql
├── analysis_queries.sql
├── README.md
└── images/
    ├── library.jpg
    └── library_erd.png
```

## 🎓 Skills Practiced

-   Relational database design
-   PostgreSQL
-   SQL CRUD operations
-   Primary and foreign keys
-   JOIN operations
-   Aggregate functions
-   `GROUP BY` and `HAVING`
-   Subqueries
-   CTAS
-   PL/pgSQL
-   Stored procedures
-   Data analysis and reporting

## 👤 Author

**Hamdi Mohamed Islem**

Student --- ESI Algiers

------------------------------------------------------------------------

⭐ If you find this project useful, feel free to explore the SQL queries
and experiment with the database.
