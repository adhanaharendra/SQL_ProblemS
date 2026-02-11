-- https://leetcode.com/problems/monthly-transactions-i/description/
# Write your MySQL query statement below

# what is challeng3
-- 1. extracting date--  creating a date variable in the table
-- 2. months should be distinct
-- 3. store the count of transactions
-- 4. sum of total amt
-- 5. check for approved total amt
-- 6. check for country


select left(trans_date,7) as month, country,
count(id) as trans_count , 
sum(state="approved") as  approved_count ,
sum(amount) as  trans_total_amount ,
sum((state="approved") * amount) as approved_total_amount 
from transactions 
group by month , country




-- SELECT
--     DATE_FORMAT(trans_date, '%Y-%M') AS month,
--     country,
--     COUNT(*) AS trans_count,
--     SUM(amount) AS trans_total_amount,
--     SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
--     SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
-- FROM Transactions
-- GROUP BY month, country;



-- 1. DATE_FORMAT(trans_date, '%Y-%M') as month
-- 2. using ---Group By month, country----------use it at the end--can be used with more that one properties
-- 3. Count(*) as trans_count-------ye bhi group by ke andar aa jaega
-- 4. sum(amount) 
-- 5. sum(case when state='approved' then 1 else 0 end) as approved_count




-- why sum() for number of approved counts, 
-- why not COUNT(state = 'approved') AS approved_count????

-- In MySQL:

-- state = 'approved' returns TRUE (1) or FALSE (0)
-- COUNT() counts non-null values
-- Both 1 and 0 are non-null
-- So it counts all rows
-- It doesn’t filter properly.
