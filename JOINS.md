## SQL JOIN
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

- Different Types of SQL JOINs :

1] (INNER) JOIN: Returns records that have matching values in both tables

2] LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table

3] RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table

4] FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

__________________________________________________________________________________________________________________________________________

### LEFT JOIN :

CREATE TABLE a (

    id int,

    name varchar(255)

);

CREATE TABLE b (

    id int,
    
    name varchar(255)
)
;
INSERT INTO a VALUES (1, 'a');

INSERT INTO a VALUES (3, 'b');

INSERT INTO a VALUES (5, 'c');

INSERT INTO b VALUES (2, 'd');

INSERT INTO b VALUES (4, 'e');

INSERT INTO b VALUES (5, 'f');

SELECT * from a LEFT JOIN b ON a.id = b.id;

id      name      id          name

1         a     (NULL)       (NULL)

3         b     (NULL)       (NULL)

5         c     (NULL)       (NULL)
