# The Complete Oracle SQL Certification Course

### Environment Setup Guide:

* Go to the [APEX Site](https://apex.oracle.com/en/learn/getting-started/)
* Request a Free Workspace
* Enter requested information and a unique workspace name
* Follow the prompts until form submission
* Follow email instructions once your workspace request is approved

### Some General Syntax:

Rule-of-thumb for single table queries:

```
SELECT <column_name>, grouping_functions(aggregate_expression)
FROM <table_name>
WHERE single_row_functions() filter condition
GROUP BY <column_name>
HAVING grouping_functions() filter condition
ORDER BY <column_name> ASC or DESC;
```

Using GROUP BY clause for multiple columns:

```
SELECT col_1, col_2, col_3, group_function(aggregate_expression)
FROM tables
[ WHERE conditions ]
GROUP BY col_1, col_2, col_3, ... col_n
[ ORDER BY conditions ]
```
**Note: Any other expressions that are not group functions must also be in the GROUP BY clause**

### More Tutorial Resources:

* [Job Ready Programmer](https://www.jobreadyprogrammer.com/)
* [Tech on the Net](https://www.techonthenet.com/oracle/index.php)