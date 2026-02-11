
SQL Execution Order (Logical)
+----+----------------+
| 1  | FROM           |
| 2  | WHERE          |
| 3  | GROUP BY       |
| 4  | HAVING         |
| 5  | SELECT         |
| 6  | ORDER BY       |
+----+----------------+




+------------+---------------------------+---------------------------+
| Feature    | UNION                     | UNION ALL                 |
+------------+---------------------------+---------------------------+
| Duplicates | Removes duplicates        | Keeps duplicates          |
| Performance| Slower (extra sorting)    | Faster                    |
| Use Case   | Set logic (unique values) | Counting / aggregation    |
+------------+---------------------------+---------------------------+


+------------+----------------------------------+----------------------------------+
| Feature    | WHERE                            | HAVING                           |
+------------+----------------------------------+----------------------------------+
| Filters    | Rows before grouping             | Groups after grouping            |
| Used With  | SELECT                           | GROUP BY                         |
| Aggregates | Cannot use SUM(), COUNT(), etc   | Can use aggregates               |
| Execution  | Executes before GROUP BY         | Executes after GROUP BY          |
+------------+----------------------------------+----------------------------------+



+------------+---------------------------------------------+
| JOIN Type  | Result                                      |
+------------+---------------------------------------------+
| INNER JOIN | Only matching rows from both tables         |
| LEFT JOIN  | All rows from left + matches from right     |
| RIGHT JOIN | All rows from right + matches from left     |
+------------+---------------------------------------------+


+------------------+-----------------------------------------+
| Function         | Behavior                                |
+------------------+-----------------------------------------+
| COUNT(*)         | Counts all rows                        |
| COUNT(column)    | Counts non-NULL values only            |
| SUM(expression)  | Adds numeric values                    |
+------------------+-----------------------------------------+
COUNT(0) → counts row
COUNT(NULL) → does not count





  


+------------+------------------------------------------+
| Clause     | Purpose                                  |
+------------+------------------------------------------+
| ON         | Defines join condition                   |
| WHERE      | Filters final result                     |
+------------+------------------------------------------+
Important difference in LEFT JOIN:
If you put condition in WHERE → it may behave like INNER JOIN.
  +----------------+----------------------------------------------+----------------------------------------------+
| Clause         | ON                                           | WHERE                                        |
+----------------+----------------------------------------------+----------------------------------------------+
| Purpose        | Defines join matching condition              | Filters final result set                     |
| LEFT JOIN case | Keeps unmatched rows if condition in ON     | May remove unmatched rows if condition here  |
+----------------+----------------------------------------------+----------------------------------------------+
-- Case 1 (Correct LEFT behavior)
SELECT *
FROM A
LEFT JOIN B
ON A.id = B.id AND B.status = 'active';

-- Case 2 (Becomes INNER JOIN behavior)
SELECT *
FROM A
LEFT JOIN B
ON A.id = B.id
WHERE B.status = 'active';





+---------------+----------------------------+----------------------------+
| Feature       | PRIMARY KEY                | UNIQUE KEY                 |
+---------------+----------------------------+----------------------------+
| NULL allowed  | No                         | Yes (usually one NULL)     |
| Count allowed | Only one per table         | Multiple allowed           |
| Purpose       | Main identifier            | Enforce uniqueness         |
+---------------+----------------------------+----------------------------+



+-----------+----------------------+----------------------+----------------------+
| Command   | DELETE               | TRUNCATE             | DROP                 |
+-----------+----------------------+----------------------+----------------------+
| Removes   | Selected rows        | All rows             | Entire table         |
| WHERE     | Yes                  | No                   | No                   |
| Rollback  | Yes                  | Usually No           | No                   |
| Structure | Keeps table          | Keeps table          | Deletes structure    |
+-----------+----------------------+----------------------+----------------------+


+------------+----------------------------------+--------------------------+
| Feature    | GROUP BY                         | DISTINCT                 |
+------------+----------------------------------+--------------------------+
| Purpose    | Group rows for aggregation       | Remove duplicate rows    |
| Aggregates | Required for SUM, COUNT, etc     | Not used with aggregates |
| Output     | One row per group                | Unique rows only         |
+------------+----------------------------------+--------------------------+


  +----------------------+----------------------------+
| Wrong                | Correct                    |
+----------------------+----------------------------+
| column = NULL        | column IS NULL             |
| column != NULL       | column IS NOT NULL         |
+----------------------+----------------------------+


  +------------+----------------------------------+----------------------------------+
| Feature    | CASE                             | IF                               |
+------------+----------------------------------+----------------------------------+
| Standard   | ANSI SQL                         | MySQL specific                   |
| Portable   | Yes                              | No                               |
| Usage      | Conditional expressions          | Simple conditions                |
+------------+----------------------------------+----------------------------------+


  
  +------------+----------------------------------+----------------------------------+
| Feature    | EXISTS                           | IN                               |
+------------+----------------------------------+----------------------------------+
| Execution  | Stops when match found           | Checks entire subquery           |
| Performance| Better for large data            | Fine for small sets              |
| Logic      | Boolean existence check          | Value comparison                 |
+------------+----------------------------------+----------------------------------+



+---------------+---------------------------------------------+
| Function      | Behavior                                    |
+---------------+---------------------------------------------+
| ROW_NUMBER    | Unique sequential number (no ties)          |
| RANK          | Same rank for ties, gaps in ranking         |
| DENSE_RANK    | Same rank for ties, no gaps                 |
+---------------+---------------------------------------------+
+-----------+-------------+--------+-------------+
| Score     | ROW_NUMBER  | RANK   | DENSE_RANK  |
+-----------+-------------+--------+-------------+
| 100       | 1           | 1      | 1           |
| 90        | 2           | 2      | 2           |
| 90        | 3           | 2      | 2           |
| 80        | 4           | 4      | 3           |
+-----------+-------------+--------+-------------+







+--------------+----------------------------------+----------------------------------+
| Feature      | Subquery                         | CTE (WITH)                      |
+--------------+----------------------------------+----------------------------------+
| Readability  | Harder for complex logic         | Cleaner and modular             |
| Reuse        | Cannot reuse easily              | Can reference multiple times    |
| Recursion    | Not supported                    | Supported (Recursive CTE)       |
+--------------+----------------------------------+----------------------------------+





+------------------+--------------------------------------------+--------------------------------------------+
| Feature          | Clustered Index                            | Non-Clustered Index                       |
+------------------+--------------------------------------------+--------------------------------------------+
| Storage          | Physically sorts table data                | Separate structure                        |
| Count allowed    | Only one per table                         | Multiple allowed                          |
| Speed            | Faster for range queries                   | Faster for lookups                        |
+------------------+--------------------------------------------+--------------------------------------------+




+------------------+----------------------------------+----------------------------------+
| Feature          | Single Column Index              | Multi-column (Composite) Index   |
+------------------+----------------------------------+----------------------------------+
| Optimizes        | One column searches              | Combined column searches         |
| Order matters    | No                               | Yes                              |
+------------------+----------------------------------+----------------------------------+


+------------+----------------------------------+----------------------------------+
| Feature    | CHAR                             | VARCHAR                          |
+------------+----------------------------------+----------------------------------+
| Length     | Fixed length                     | Variable length                  |
| Speed      | Slightly faster                  | Slightly slower                  |
| Storage    | Wastes space if unused           | Efficient                        |
+------------+----------------------------------+----------------------------------+



+------------------+----------------------------------+----------------------------------+
| Feature          | GROUP BY                         | Window Function                  |
+------------------+----------------------------------+----------------------------------+
| Rows returned    | One row per group                | Keeps original rows              |
| Aggregation      | Collapses rows                   | Adds calculation per row         |
+------------------+----------------------------------+----------------------------------+






