# Write your MySQL query statement below
SELECT 
    person_id AS id,
    COUNT(*) AS num
FROM (
    SELECT requester_id AS person_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS person_id
    FROM RequestAccepted
) t
GROUP BY person_id
ORDER BY num DESC
LIMIT 1;



# Write your MySQL query statement below
-- select id , count(id) as num
-- from (
    --select requester_id as id from RequestAccepted
    -- union all
    -- select accepter_id as id from RequestAccepted
 --) as t1

-- group by id
-- order by num desc 
-- limit 1


-- # Write your MySQL query statement below
-- SELECT id, COUNT(id) AS num
-- FROM (
--     SELECT requester_id AS id FROM RequestAccepted
--     UNION ALL
--     SELECT accepter_id AS id FROM RequestAccepted
-- ) temp

-- GROUP BY id
-- ORDER BY num DESC
-- LIMIT 1;




-- Input: 
-- RequestAccepted table:
-- +--------------+-------------+-------------+
-- | requester_id | accepter_id | accept_date |
-- +--------------+-------------+-------------+
-- | 1            | 2           | 2016/06/03  |
-- | 1            | 3           | 2016/06/08  |
-- | 2            | 3           | 2016/06/08  |
-- | 3            | 4           | 2016/06/09  |
-- +--------------+-------------+-------------+
-- Output: 
-- Write a solution to find the people who have the most friends and the most friends number.
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 3  | 3   |
-- +----+-----+
-- Explanation: 
-- The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.




-- CREATE TABLE RequestAccepted (
--     requester_id INT NOT NULL,
--     accepter_id INT NOT NULL,
--     accept_date DATE,
--     PRIMARY KEY (requester_id, accepter_id)
-- );




-- Final ER Understanding
-- Entity: User
-- Relationship: Friendship (self-relationship)
-- Type: Many-to-Many recursive
-- Attributes on relationship: accept_date


-- 2️⃣ Where is UNION used (not UNION ALL)?
-- Difference first:
-- UNION	UNION ALL
-- Removes duplicates	Keeps duplicates
-- Slower	Faster
-- Used for set logic	Used for counting/aggregation
