--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
 INSERT INTO books 
 values ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

 --Task 2: Update an Existing Member's Address 
 UPDATE members
 SET member_address = '125 Oak St'
 WHERE member_address = 'C103';

 --Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
 DELETE FROM issued_status 
 WHERE issued_id= 'IS121';

--Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT FROM issued_status 
WHERE issued_emp_id = 'E101';

--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT M.member_id ,M.member_name, COUNT (ist.issued_member_id)

FROM members AS M 
JOIN issued_status AS ist
ON ist.issued_member_id = M.member_id 
GROUP BY 1 
HAVING COUNT (ist.issued_member_id) > 1 ;



--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

CREATE TABLE book_count AS
SELECT b.isbn , b.book_title, COUNT(ist.issued_id) AS book_issued_cnt

FROM books AS b 
JOIN issued_status AS ist 
ON ist.issued_book_isbn = b.isbn
GROUP BY 1 ;

--Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM books
WHERE category = 'Classic';

--Task 8: Find Total Rental Income by Category:

SELECT b.category , SUM(b.rental_price) AS income , count (ist.issued_id)
FROM books AS b
JOIN issued_status AS ist 
ON ist.issued_book_isbn = b.isbn
GROUP BY 1;

--List Members Who Registered in the Last 180 Days:
 SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days';



