-- Please note that the assignment work is based on KNOWLEDGE guesswork as there is no actual database to test out the queries
-- It is similar to a paper examination scenario.

-- Write a query that retrieves suppliers that work in either Georgia or California
SELECT * FROM SUPPLIER
WHERE state IN ('Georgia', 'California');  -- Still correct and mnore efficient compared to instructor's solutions

-- Write a query that retrieves suppliers with the characters "wo" and the character "i" or "i" in their name
SELECT * FROM SUPPLIER
WHERE SUPPLIER_NAME LIKE '%wo%'
AND (SUPPLIER_NAME LIKE '%I%' OR SUPPLIER_NAME LIKE '%i%');  -- Same as instructor's

-- Write a query that retrieves the suppliers on which a minimum of 37,000 and a maximum of 80,000 was spent
SELECT * FROM SUPPLIER
WHERE TOTAL_SPENT BETWEEN 37,000 AND 80,000;  -- Still correct and mnore efficient compared to instructor's solutions

-- Write a query that returns the supplier names and the state in which they operate meeting the following conditions:

-- belong in the state Georgia or Alaska
-- the supplier id is 100 or greater than 600
-- the amount spent is less than 100,000 or the amount spent is 220,000

SELECT SUPPLIER_NAME, STATE FROM SUPPLIER
WHERE STATE IN ('Georgia', 'Alaska')
AND (SUPPLIER_ID = 100 OR SUPPLIER_ID > 600)
AND (TOTAL_SPENT < 100,000 OR TOTAL_SPENT = 220,000);  -- Same as instructor's 

--------------------------------------------------------------------------------------------------------------------------------------

-- True or False Questions:

-- The keywords such as SELECT and WHERE must always be capital in the SQL Query => FALSE

-- The database works on first processing the filtering conditions and then processes the FROM condition => FALSE

-- Having just the filter condition shown below in a SQL Query will return all of the records from the table => FALSE -> Wrong -> TRUE
-- WHERE 1 = 1

--  NULL can not be compared using and equal sign => TRUE

-- The  ORDER BY clause is processed before the FROM clause in a SQL statement and it's used to sort the columns in an ascwnding 
-- or descending fasion => FALSE



/*------------------------------------------------------------------------------------------------------------------------------------

  INSTRUCTOR SOLUTIONS - ASSIGNMENT 1

------------------------------------------------------------------------------------------------------------------------------------*/

-- Write a query that retrieves suppliers that work in either Georgia or California
SELECT * 
FROM suppliers
WHERE state = 'Georgia', 
OR state = 'California';

-- Write a query that retrieves suppliers with the characters "wo" and the character "i" or "i" in their name
SELECT * 
FROM suppliers
WHERE SUPPLIER_NAME LIKE '%wo%'
AND (SUPPLIER_NAME LIKE '%I%' OR SUPPLIER_NAME LIKE '%i%');

-- Write a query that retrieves the suppliers on which a minimum of 37,000 and a maximum of 80,000 was spent
SELECT * 
FROM suppliers
WHERE TOTAL_SPENT >= 37,000 
AND TOTAL_SPENT <= 80,000;

-- Write a query that returns the supplier names and the state in which they operate meeting the following conditions:

-- belong in the state Georgia or Alaska
-- the supplier id is 100 or greater than 600
-- the amount spent is less than 100,000 or the amount spent is 220,000

SELECT supplier_name, state
FROM suppliers
WHERE STATE IN ('Georgia', 'Alaska')
AND (SUPPLIER_ID = 100 OR SUPPLIER_ID > 600)
AND (TOTAL_SPENT < 100,000 OR TOTAL_SPENT = 220,000);

--------------------------------------------------------------------------------------------------------------------------------------

-- True or False Questions:

-- The keywords such as SELECT and WHERE must always be capital in the SQL Query => FALSE

-- The database works on first processing the filtering conditions and then processes the FROM condition => FALSE

-- Having just the filter condition shown below in a SQL Query will return all of the records from the table => TRUE
-- WHERE 1 = 1

--  NULL can not be compared using and equal sign => TRUE

-- The  ORDER BY clause is processed before the FROM clause in a SQL statement and it's used to sort the columns in an ascwnding 
-- or descending fasion => FALSE
