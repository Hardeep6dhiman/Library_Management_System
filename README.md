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

**Task 2: Update an Existing Member's Address**
-- Update the address '125 Oak St' where member id is C103

**Task 3: Delete a Record from the Issued Status Table**
-- Objective: Delete the record with issued id = 'IS140' from the issued_status table.

**Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with employee id = 'E101'.

**Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.

**Create Table as Select
**Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_count**
--Objective: Generating new table with Select statemnet by joining tables.

**Task 7. Retrieve All Books in a Specific Category:
--Objective: Retrieve all data from books table where cook category is 'classic'.

**Task 8: Find Total Rental Income by Category:
--Objective: Find the Toatal rental inncome.

**Task 9: List Employees with Their Branch Manager's Name and their branch details:
--Objective: Retrieve all data of employess and thier branch managers.

**Task 10: Create a Table of Books with Rental Price Above a Certain Threshold $7.
--Objective: Retrieve all data from books where rental price is greater than $7.

**Task 11: Retrieve the List of Books Not Yet Returned
--Objective: Retrieve all the list of Books Id those are not return yet.


## Reports

- **Database Schema**: Detailed table structures and relationships.
- **Data Analysis**: Insights into book categories, employee salaries, member registration trends, and issued books.
- **Summary Reports**: Aggregated data on high-demand books and employee performance.

## Conclusion

This project demonstrates the application of SQL skills in creating and managing a library management system. It includes database setup, data manipulation, and advanced querying, providing a solid foundation for data management and analysis.
