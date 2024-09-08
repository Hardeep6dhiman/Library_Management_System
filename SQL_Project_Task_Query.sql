USE Library_Project

SELECT * FROM dbo.books
SELECT * FROM dbo.members
SELECT * FROM dbo.branch
SELECT * FROM dbo.employees
SELECT * FROM dbo.issued_status
SELECT * FROM dbo.return_status


--PROJECT TASK

--TASK 1:  Create a New Book Record 
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn, book_title,category,rental_price,status,author,publisher) 
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')
SELECT * FROM books

--TASK 2: Update an Existing Member's Address

UPDATE members
SET member_address = '125 Main St'
WHERE member_id = 'C101'
SELECT * FROM members

--Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS140' from the issued_status table.

SELECT * FROM issued_status

DELETE FROM issued_status
WHERE issued_id = 'IS140'

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status
WHERE issued_emp_id='E101'

-- Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_member_id, COUNT(issued_id) AS total_books_issued
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(issued_id) > 1


-- Create Table as Select
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_count**


SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS no_issued
INTO no_issued_books
FROM books AS b
JOIN
issued_status AS ist
ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn,b.book_title

SELECT * FROM no_issued_books

-- Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM books
WHERE category = 'Classic'

-- Task 8: Find Total Rental Income by Category:

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

-- Task 9: List Employees with Their Branch Manager's Name and their branch details:

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

--Task 10: Create a Table of Books with Rental Price Above a Certain Threshold $7.

SELECT * 
INTO books_price_greater_than_seven
FROM books
WHERE rental_price>=7

SELECT * 
FROM books_price_greater_than_seven
ORDER BY rental_price DESC

-- Task 11: Retrieve the List of Books Not Yet Returned

SELECT
DISTINCT iss.issued_id,
iss.issued_book_name
FROM issued_status AS iss
LEFT JOIN
return_status AS rs
ON iss.issued_id=rs.issued_id
WHERE rs.return_id is NULL

--Task 12: Find Employees with the Most Book Issues Processed with their branch

SELECT * FROM issued_status
SELECT * FROM employees
SELECT * FROM branch

SELECT
emp.emp_name,
b.branch_id,
b.branch_address,
COUNT(ist.issued_id) AS issued_books
FROM issued_status AS ist
JOIN
employees AS emp
ON ist.issued_emp_id=emp.emp_id
JOIN 
branch AS b
ON emp.branch_id=b.branch_id
GROUP BY emp.emp_name,b.branch_id,b.branch_address
ORDER BY issued_books DESC 








