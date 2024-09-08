# Library Management System using SQL Project

## Project Overview

**Project Title**: Library Management System  
**Level**: Intermediate  
**Database**: 'Library_Project

This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

## Objectives

1. **Set up the Library Management System Database**: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
2. **CRUD Operations**: Perform Create, Read, Update, and Delete operations on the data.
3. **Advanced SQL Queries**: Develop complex queries to analyze and retrieve specific data.

## Project Structure

### 1. Database Setup
 **Database Creation**: Created a database named `Library_Project`.
- **Table Creation**: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.

### 2. CRUD Operations

- **Create**: Inserted sample records into the `books` table.
- **Read**: Retrieved and displayed data from various tables.
- **Update**: Updated records in the `employees` table.
- **Delete**: Removed records from the `members` table as needed.

**Task 1. Create a New Book Record**
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn, book_title,category,rental_price,status,author,publisher) 
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')
SELECT * FROM books

**Task 2: Update an Existing Member's Address**
-- Update the address '125 Oak St' where member id is C103

UPDATE members
SET member_address = '125 Main St'
WHERE member_id = 'C101'
SELECT * FROM members

**Task 3: Delete a Record from the Issued Status Table**
-- Objective: Delete the record with issued id = 'IS140' from the issued_status table.

SELECT * FROM issued_status

DELETE FROM issued_status
WHERE issued_id = 'IS140'

**Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with employee id = 'E101'.

SELECT * FROM issued_status
WHERE issued_emp_id='E101'

**Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_member_id, COUNT(issued_id) AS total_books_issued
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(issued_id) > 1

**Create Table as Select
**Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_count**


SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS no_issued
INTO no_issued_books
FROM books AS b
JOIN
issued_status AS ist
ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn,b.book_title

SELECT * FROM no_issued_books

**Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM books
WHERE category = 'Classic'

**Task 8: Find Total Rental Income by Category:

SELECT 
b.category,
SUM(b.rental_price) AS price,
COUNT(*) AS no_times
FROM books AS b
JOIN
issued_status AS ist
ON ist.issued_book_isbn = b.isbn
GROUP BY b.category
ORDER BY price DESC

**Task 9: List Employees with Their Branch Manager's Name and their branch details:

SELECT 
em.*,
b.manager_id,
em2.emp_name AS manager
FROM employees AS em
JOIN
branch AS b
ON em.branch_id=b.branch_id
JOIN
employees AS em2
ON b.manager_id=em2.emp_id

**Task 10: Create a Table of Books with Rental Price Above a Certain Threshold $7.

SELECT * 
INTO books_price_greater_than_seven
FROM books
WHERE rental_price>=7

SELECT * 
FROM books_price_greater_than_seven
ORDER BY rental_price DESC

**Task 11: Retrieve the List of Books Not Yet Returned

SELECT
DISTINCT iss.issued_id,
iss.issued_book_name
FROM issued_status AS iss
LEFT JOIN
return_status AS rs
ON iss.issued_id=rs.issued_id
WHERE rs.return_id is NULL
## Reports

- **Database Schema**: Detailed table structures and relationships.
- **Data Analysis**: Insights into book categories, employee salaries, member registration trends, and issued books.
- **Summary Reports**: Aggregated data on high-demand books and employee performance.

## Conclusion

This project demonstrates the application of SQL skills in creating and managing a library management system. It includes database setup, data manipulation, and advanced querying, providing a solid foundation for data management and analysis.
