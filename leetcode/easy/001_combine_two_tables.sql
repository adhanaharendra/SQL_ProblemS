-- Platform: LeetCode
-- Problem: 175. Combine Two Tables
-- Difficulty: Easy
-- Concepts: LEFT JOIN, NULL handling

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;
