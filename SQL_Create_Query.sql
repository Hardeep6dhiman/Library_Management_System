--Library System Management Project

CREATE database Library_Project

USE Library_Project

--Branch Table

CREATE table branch(
branch_id VARCHAR(10) PRIMARY KEY, 
manager_id VARCHAR(10), 
branch_address VARCHAR(15), 
contact_no VARCHAR(12))

--Emplyoees Table

CREATE table employees(
emp_id VARCHAR(10) PRIMARY KEY,
emp_name VARCHAR(30),
position VARCHAR(15),
salary INT,
branch_id VARCHAR(10) FOREIGN KEY REFERENCES branch(branch_id))

--Books Table

CREATE table books(
isbn VARCHAR(20) PRIMARY KEY,
book_title VARCHAR(75),
category VARCHAR(30),
rental_price FLOAT,
status VARCHAR(10),
author VARCHAR(30),
publisher VARCHAR(50))

--MEMBERS TABLE

CREATE table members(
member_id VARCHAR(10) PRIMARY KEY,
member_name VARCHAR(30),
member_address VARCHAR(50),
reg_date DATE)

--ISSUE STATUS table

CREATE table issued_status(
issued_id VARCHAR(10) PRIMARY KEY,
issued_member_id VARCHAR(10) FOREIGN KEY REFERENCES members(member_id),
issued_book_name VARCHAR(75),
issued_date DATE,
issued_book_isbn VARCHAR(20) FOREIGN KEY REFERENCES books(isbn),
issued_emp_id VARCHAR(10) FOREIGN KEY REFERENCES employees(emp_id))

--RETURN STATUS Table

CREATE table return_status(
return_id VARCHAR(10) PRIMARY KEY,
issued_id VARCHAR(10) FOREIGN KEY REFERENCES issued_status(issued_id),
return_book_name VARCHAR(75),
return_date DATE,
return_book_isbn VARCHAR(20) FOREIGN KEY REFERENCES books(isbn))


