196. Delete Duplicate Emails

-- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Id is the primary key column for this table.
-- For example, after running your query, the above Person table should have the following rows:

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+

-- solution_1 :
delete a from Person a, Person b  where a.email = b.email and a.id > b.id   
  
-- Solution_2 :
With t1 as
(
 Select *,
    row_number() over(partition by email order by id) as rk
    from person
)
Delete from person
where id in (Select t1.id from t1 where t1.rk>1)

-- solution_3 :
DELETE
FROM Person 
WHERE (
    id NOT IN (
        SELECT *
        FROM (
            SELECT min(id)
            FROM Person
            GROUP BY email
        ) as rst
    )
)

-- solution_4 :
with temp as(
select min(id) from Person group by email
)
delete from Person where id not in (select * from temp);
