-- #11 Single Row Functions (SRF) and Using The Dual Table

-- CONCAT: Takes up different arguments (even a column name) to concatenate them together
select 'my name is ' || ename 
from emp;

select concat('my name is ', ename)
from emp;

-- UPPER: Taakes a string value (constant value) and converts it to uppercase | Opposite function: LOWER()
select upper('hello')
from emp;

-- Special table in APEX -> DUAL
SELECT * FROM dual; -- Gives a single record character 'X' in a column named 'dummy'

-- We can give anything for SELECT statement in this table
SELECT 'pizza' AS FOOD, 'fanta' AS DRINK, CONCAT('PIZZARONI ', 'FANTASTICA') AS MEAL FROM dual;

-- Using multiple functions together
SELECT CONCAT(UPPER(ename), LOWER(' is the name')) FROM emp
WHERE deptno = 20;

-- Question: Concatenate the value above that's being returned with the satement 'and their job is: MANAGER' for example
-- Full statement example: "jones IS THE NAME and their job is: MANAGER"
SELECT CONCAT(CONCAT(LOWER(ename), UPPER(' is the name')), CONCAT(LOWER(' and their JOB is: '), UPPER(job))) AS "CONCATENATED STRING" FROM emp -- works
WHERE deptno = 20;
-- Note: I tried to put all arguments in one single concat and it doesn't seem to work (can't have repeated functions maybe)

-- Instructor's solution:
SELECT CONCAT(CONCAT(LOWER(ename), UPPER(' is the name')), CONCAT(LOWER(' and their JOB is: '), UPPER(job))) AS "function call" FROM emp -- works
WHERE deptno = 20;

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- #12 Using Functions in WHERE and Character Based SRFs

-- We can also use SRFs in the WHERE clause
SELECT * FROM emp
WHERE LOWER(ename) = 'jones';

-- SRF Character Based Functions: Upper, Lower, Concat

-- INITCAP('hello there') => Gives Hello There
SELECT INITCAP('hello my name is shushmita') AS sentence
FROM dual

-- LENGTH('hello there') => Gives the number of characters in a given sequence (11 in this case)
SELECT LENGTH('hello my name is shushmita') AS "character count"
FROM dual

SELECT ename, LENGTH(ename) AS length
FROM emp
WHERE LENGTH(ename) = 5;

-- SUBSTR('Some str', <start position>, <# of chars to be extracted>) -> Used for exdtraxting a part of the original string
SELECT SUBSTR('hello', 2, 3) FROM dual  -- counting starts from 1 and not 0 for start position

-- Left and Right Padding
-- LPAD('Some Str', <# total width of string after padding A>, 'character') | RPAD => Right padding
-- Creates sort of padding of extra characters to the left of any word or character sequence
-- LPAD('Day', 6, '$') => '$$$Day'
SELECT LPAD('hello', 10, '%'), RPAD('hello', 10, '%') FROM dual;

-- Left and Right Trimming
-- LTRIM('data we wanna trim', 'character to trim') | RTRIM => Right triming
SELECT LTRIM('HHHHHello', 'H'), RTRIM('Hellowwwwwwwww', 'w') FROM dual;

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- #13 Nureric And Date type SRFs

-- Numeric Functions: Accept numbers as arguments 

-- ROUND(<number to round>, <# of decimal places to round by>)
SELECT ROUND(107.088, 2) FROM dual; -- => 107.09 | Absence of 2nd argument would just round the number to a whole number => 107

-- TRUNC() truncates the 1st argument to the number of places defined by the 2nd argument
SELECT TRUNC(107.887, 2) FROM dual;  -- => 107.88 (unlike ROUND(), it doesn't round up but chops off instead)

-- Date / Time Functions

-- SYSDATE: Returns the current date that is set on the OS where this particular database
-- Note: No parenthesis needed since there's no arguments
SELECT SYSDATE FROM dual; -- => 12/01/2022

-- SYSTIMESTAMP: Returns more details compared to the previous one for the OS where database is instlled
SELECT SYSTIMESTAMP FROM dual  -- => 01-DEC-22 08.43.07.102702 PM +00:00 (Date|Timestamp(HH.MM.SS.ssssss)|AM/PM|Timezone)

-- ADD_MONTHS('some date', <# of months to be adde to given date>)
SELECT ADD_MONTHS('06/18,1996', 9) FROM dual; -- => 03/18/1998
SELECT ADD_MONTHS('06/18,1997', -9) FROM dual  -- => 09/18/1996 | can also go back in time using the above function
SELECT ADD_MONTHS(SYSDATE, -3) FROM dual;  -- => 09/01/2022 | can also use it with current date

-- MONTHS_BETWEEN(dateA(larger), dateB(smaller))
SELECT MONTHS_BETWEEN ('01/01/2023', '09/01/2022') FROM dual;  -- => 4

-- TRUNC(date, 'MONTH'/'YEAR') => Removes unnecessary info.
SELECT TRUNC(SYSTIMESTAMP) FROM dual;  -- => 12/01/2022 | Truncates all the extra information after the date
SELECT TRUNC(SYSTIMESTAMP, 'MONTH') FROM dual;  -- => 12/01/2022 | Gives us 1st of the month
SELECT TRUNC(SYSTIMESTAMP, 'YEAR') FROM dual;  -- => 01/01/2022 | Gives us 1st of the year
SELECT hiredate, TRUNC(hiredate, 'MONTH') FROM emp;  -- 1st of the month each employee were hired

SELECT ename, hiredate, TRUNC(hiredate, 'MONTH') FROM emp  -- employees hired in 1982
WHERE TRUNC(hiredate, 'YEAR') = '01/01/1982';

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- #14 Conversion SRFs & Date Formatting

-- TOCHAR(<date>/<numeric>, 'formatting template'): Covert a date or a number to a character string
SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY') FROM dual;  -- => 12-01-2022
SELECT TO_CHAR(SYSDATE, 'DDth "of" MONTH, YYYY') FROM dual;  -- => 01ST of DECEMBER , 2022





