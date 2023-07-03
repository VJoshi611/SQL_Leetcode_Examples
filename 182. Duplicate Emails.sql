182. Duplicate Emails

-- Write a SQL query to find all duplicate emails in a table named Person.

-- +----+---------+
-- | Id | Email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- For example, your query should return the following for the above table:

-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+

-- Solution_1 :
SELECT DISTINCT a.email AS Email FROM Person a, Person b WHERE a.email = b.email and a.id != b.id  
  
-- Solution_2 :  
Select Email
from
(Select Email, count(Email)
from person
group by Email
having count(Email)>1) a

-- Solution_3 :
SELECT email AS Email FROM Person GROUP BY email having count(*) > 1;  

-- Solution_4 :
select distinct(p.email) as Email from Person p cross join Person q where p.email =q.email and p.id!=q.id;
              
