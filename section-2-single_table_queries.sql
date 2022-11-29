-- #8 QUERY FILTERING CONTINUED: BETWEEN, IN AND NULL

-- Question: Return the names and hiredates of employees working in Dallas and Chicago 
SELECT emp.ename, emp.hiredate FROM emp JOIN dept
ON emp.deptno = dept.deptno
WHERE dept.loc IN ('DALLAS', 'CHICAGO');

-- Instructor's solution: Needs further data analysis before the result query unlike my single join operation based on the question
SELECT ename, hiredate FROM EMP
WHERE DEPTNO IN (20, 30);

-- Q: Write a query that returns those employees that have the salary between 1000 and 2000
-- Note: The values 1000 and 2000 are inclusive
SELECT * FROM emp 
WHERE sal BETWEEN 1000 AND 2000;

-------------------------------------------------------------------------------------------------------------------------------------------------

-- #9 Query Filtering Conditions & Operator Precedence

-- Question: Write a query that returns those employees that don't make any commision and have a salary greater than 1100 but less that 5000.
-- Exclude those employees that have a salary equal to 3000
SELECT * FROM emp
WHERE comm IS NULL -- Would have used BTEWEEN if isntructor didn't mention greater than 1100 or less than 5000
AND sal > 1100 AND sal < 5000 AND sal <> 3000; -- <> means not equal to, same as != 

-- Instructor's solution: I missed Turner - the employee with  commision value of 0 and salary of 1500
SELECT * FROM emp WHERE (comm IS NULL
AND sal > 1100 AND sal < 5000 
AND sal <> 3000)
OR comm = 0;
-- Note: In SQL, we combine all ANDs together for condition to work as expected ('OR comm = 0' must come in the end)
-- We also use parenthesis to group and evaluate different conditions together

-- The above query gives the correct data but the query itself is incorrect. Why?

-- Imagine we change the question to the following instead:
-- Write a query that returns those employees that don't make any commision and have a salary greater than 1100 but less that 5000.
-- Exclude those employees that have a salary equal to 1500 (salary of the employee with commision of 0)

-- My Gueses: Using Paranthesis to order the conditions based on the question:
SELECT * FROM emp WHERE (comm IS NULL OR comm = 0)
AND sal > 1100 AND sal < 5000 
AND sal <> 1500;

-- Question: Return those employees that are salesman and that make either 300 dollars in commision or greater than 1000 dollars in commision
SELECT * FROM emp WHERE JOB = 'SALESMAN'
AND (comm = 300 OR comm > 1000);

-------------------------------------------------------------------------------------------------------------------------------------------------

-- #10 Ordering, Concatenating, & Aliasing Query Results

-- Comparison (whether the table contains something) -> Single quotes
-- Aliases -> Double quotes
SELECT ENAME AS "EMPLOYEE NAME", SAL AS SALARY, COMM AS COMMISION
FROM EMP;

-- Use '||' or pipes to concatenate
SELECT 'Hello, my name is ' || ename AS "CONCATENATED VALUE"
FROM EMP
WHERE job = 'MANAGER';

-- Question: Create a sort of report that gives results in the format "King makes $5000 per month"
SELECT ename || ' makes $' || sal || 'per month' AS "EMPLOYEE SALARY"
FROM EMP;

-- ORDER BY: Sort the data based on a particular column
SELECT DEPTNO, SAL, ENAME
FROM EMP
ORDER BY DEPTNO, SAL;

