-- Please note that the assignment work is based on KNOWLEDGE guesswork as there is no actual database to test out the queries
-- It is similar to a paper examination scenario.

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Considering the data exists in the city table, write a query that will return records similar to what is shown below for 
-- those cities that have the COUNTRYCODE of 'cbd':

-- "NEW YORK CITY has the population of 8,500,000"
-- "lOS ANGELES has the population of 632,000"

-- Note: Use functions in the SELECT statement to solve the problem
SELECT CONCAT(
    CONCAT(
        UPPER(NAME), 
        LOWER(' has the population of ')
        ), 
        TO_CHAR(POPULATION, '9,999,999')
        )
FROM CITY;
WHERE COUNTRYCODE = 'cbd';

----------------------------------------------------------------------------------
-- Write a query that would show the the first 3 letters and the last 3 letters of the district capitalized and seperated by a dash.
SELECT CONCAT(
    CONCAT(
        UPPER(
            SUBSTR(DISTRICT, 1, 3)), '-'),
             UPPER(
                SUBSTR(DISTRICT, -3, 3))
                ) 
FROM CITY;

----------------------------------------------------------------------------------
-- Review trhe following SQL statement:
SELECT MONTHS_BETWEEN(LAST_DAY('15-JAN-12')+1, '01-APR-12') FROM DUAL;

-- Considering the database is configured for the given date format, wht will be the result of executing the query?

-- MONTHS_BETWEEN prints the number of months between the 2 valid date arguments passed within the function. The above date format is invalid
-- Hypothetically given that the database accepts the above format as valid date, there is a +1 to mess up the date again. Not sure, if that
-- makes the argument valid. 

-- Assuming the database does accept the above factors as valid arguments, I would say the difference between February
-- and April is 2 and since the larger date is the latter one, the result would be -2

----------------------------------------------------------------------------------
-- True/False: Giving the date arguments in chronological order to the MONTHS_BETWEEN function will result in an error => False | Will not result 
-- in an error, but generate inaccurate result, which would be a negative result. The larger date must come first for proper result.

----------------------------------------------------------------------------------
-- Which of the following is true regarding character functions? => C || Same as Instructor's solution
-- A) They always accept characters as parameters and nothing else
-- b) They always return a character value
-- C) They are generally used to process text data
-- D) They gerally have the letters CHAR somewhere in the function name

----------------------------------------------------------------------------------
-- Which of the following is true regarding functions in SQL? => C  || Same as Instructor's solution
-- A) They never return a value
-- B) They often return a value
-- C) They always return a value
-- D) There is no consistent answer to whether they return a value or not

----------------------------------------------------------------------------------
-- Review the following SQL statement:
SELECT SUBSTR('2009',1,2) || LTRIM('1124',1) FROM DUAL;

-- What will be the result of executingthe SQL statement?  => A  || Same as Instructor's solution
-- A) 2024
-- B) 221
-- C) 20124
-- D) A syntax error

----------------------------------------------------------------------------------
-- True/False: Review the syntax of how the NULLIF function is used:
NULLIF(expr1, expr2)  

-- The NULLIF function returns expr1 if expr1 and expr2 are not equal  => True  || Same as Instructor's solution

----------------------------------------------------------------------------------
-- True/False: The TO_CHAR function converts data from various data types to character data. It can accept characters, a number or a 
-- date as valid arguments  => False | Only accepts Date/Time/Numeric values as arguments

-- Instructor's solution: True | It was a tricky one. I had a hard time going forward with an answer for this one.
----------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSTRUCTOR'S SOLUTIONS

SELECT CONCAT(
    CONCAT(
        UPPER(NAME), 
        'has the population of'), 
        POPULATION
        ) -- => I added additional numeric formatting for population
FROM CITY
WHERE LOWER(COUNTRYCODE) = 'CBD'; -- => Didn't add this one in my solution

----------------------------------------------------------------------------------

SELECT CONCAT(CONCAT(UPPER(SUBSTR(district, 1, 3)), ' - '),

       UPPER(SUBSTR(district, LENGTH(district) - 2)))

FROM city;

----------------------------------------------------------------------------------

/* -2

The reason -2 will be returned is that the LAST_DAY function will transform the value of '15-JAN-12' TO '31-JAN-12' and then the result 
of that will be added to 1. So the first argument of the MONTHS_BETWEEN function ends up being '01-FEB-12'. Difference between the 2 
dates results in a -2.

*/

----------------------------------------------------------------------------------

/*

Giving the date arguments in chronological order to the MONTHS_BETWEEN function will result in an error.

FALSE.

You may give the 2 dates in any order you please. If the dates are in chronological order, the result will be a negative number. 
If the dates are in reverse chronological order, the answer will be a positive number.

*/

----------------------------------------------------------------------------------

