select name 
from Customer 
where (referee_id != 2 || referee_id = NULL);

-- Mistake 1: = NULL
-- In SQL, NULL is not a value.
-- You cannot compare it with =.


-- Mistake 2: ||
-- In MySQL, || is treated as string concatenation (unless weird SQL modes are on).
-- You want logical OR:

SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;


