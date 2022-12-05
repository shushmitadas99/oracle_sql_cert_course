-- #16: Grouping Fubctions MIN, MAX, AVG, COUNT etc.

SELECT MAX(sal) AS MAX_SAL from emp;  -- => 5000
SELECT MIN(sal) AS MIN_SAL from emp;  -- => 800
SELECT SUM(sal) AS TOTAL_SAL from emp;  -- => 29025


-- Question: Write a query that returns the amounbt we pay to the highest paid manager in our company
SELECT MAX(sal) AS MAX_SAL FROM emp
WHERE UPPER(job) = 'MANAGER';  -- Working solution but different from instructor's

-- Instructor's solution: 
SELECT MAX(sal) FROM emp
WHERE LOWER(job) LIKE '%manager%';

SELECT AVG(sal) AS AVG_SAL from emp;  -- 2073.21428571428571428571428571428571429
SELECT ROUND(AVG(sal), 2) AS AVG_SAL from emp;  -- 2073.21

SELECT COUNT(ename) AS NUM_EMPLOYEES FROM emp;
SELECT COUNT(comm) AS COUNT FROM emp;  -- Shows 4 because there are only 4 data points in the comm column

SELECT SUM(sal) / COUNT(*) As "COMPUTED AVG", AVG(sal) AS "AVG FUNCTION" FROM emp;

-- Question: Give the average salary for each job title
SELECT DISTINCT(job), AVG(sal) FROM emp
GROUP BY job;  -- works as expected

------------------------------------------------------------------------------------------------------------------------------------------------

-- #17 GROUP BY Clause & HAVING Clause

-- Instructor's solution from previous question:
SELECT job, AVG(sal) FROM emp
GROUP BY job;  -- turns out I didn't need the DISTINCT() function because we used GROUP BY() clause instead

-- Gives the number of rows (records) belonging to every single job
SELECT job, COUNT(*)
FROM emp
GROUP BY job;

-- Gives the highest salary in every job category
SELECT job, MAX(sal)
FROM emp
GROUP BY job;

-- Question: Write a query that returns only those job roles that are filled by two employees
SELECT job
FROM emp
GROUP BY job
HAVING COUNT(ename) = 2;  -- Analyst

-- Instructor's solution:
SELECT job
FROM emp
GROUP BY job
HAVING COUNT(*) = 2;  -- Analyst

-- Question: Write a query that returns those department numbers that have more than three employees
SELECT deptno, COUNT(ename)
FROM emp
GROUP BY deptno
HAVING COUNT(ename) > 3;  -- 30, 20

-- Instructor's solution:
SELECT deptno
FROM emp
GROUP BY deptno
HAVING COUNT(*) > 3;  -- 30, 20

------------------------------------------------------------------------------------------------------------------------------------------------

-- #18 More Practice with The GROUP BY Clause

-- Question: We wanna know how many employyes there are for each job title
SELECT job, COUNT(ename)
FROM emp
GROUP BY job;

-- Instructor's solution:
SELECT job, COUNT(*)
FROM emp
GROUP BY job;

-- Question: Group by the job title and department number. What would be the output
SELECT job, deptno, COUNT(*)
FROM emp
GROUP BY job, deptno; -- Same as instructor's solution

