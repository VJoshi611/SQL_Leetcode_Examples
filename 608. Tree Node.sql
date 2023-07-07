608. Tree Node
level : medium

company : Uber

Input: 
Tree table:
+----+------+
| id | p_id |
+----+------+
| 1  | null |
| 2  | 1    |
| 3  | 1    |
| 4  | 2    |
| 5  | 2    |
+----+------+

  Output: 
+----+-------+
| id | type  |
+----+-------+
| 1  | Root  |
| 2  | Inner |
| 3  | Leaf  |
| 4  | Leaf  |
| 5  | Leaf  |
+----+-------+

Explanation: 
Node 1 is the root node because its parent node is null and it has child nodes 2 and 3.
Node 2 is an inner node because it has parent node 1 and child node 4 and 5.
Nodes 3, 4, and 5 are leaf nodes because they have parent nodes and they do not have child nodes.

Example 2:
Input: 
Tree table:
+----+------+
| id | p_id |
+----+------+
| 1  | null |
+----+------+

Output: 
+----+-------+
| id | type  |
+----+-------+
| 1  | Root  |
+----+-------+
Explanation: If there is only one node on the tree, you only need to output its root attributes.


solution_1 :
select id,
       CASE
            when id in (select distinct p_id from tree where p_id is not null) then 'Inner'
            when p_id is null then 'Root'
            else 'Leaf'
       END as type
from Tree;


solution_2  with some modification :
select id,  
  case when p_id is null then 'Root'
      when id in (select distinct p_id from Tree) then 'Inner'
      else 'Leaf'
  end as type 
from Tree;


solution_3 :
select id,
  case
    when p_id is null then 'Root'
    when id in (select p_id from tree) and p_id in (select id from tree) then 'Inner'
    else 'Leaf'
  end as type
from Tree;
