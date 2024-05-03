#  584. Find Customer Referee

## Problem Description
https://leetcode.com/problems/find-customer-referee/
###
Find the names of the customer that are not referred by the customer with id = 2.

## Solution 1:
### T-SQL
```
# Write your MySQL query statement below
SELECT name
FROM Customer
WHERE referee_id != 2
OR referee_id IS NULL;
```
