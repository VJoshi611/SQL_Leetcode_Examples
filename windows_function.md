## Window's_function :

- OVER clause in SQL is used in conjunction with aggregate functions to perform calculations over a specific set of rows. It is commonly used in scenarios 
where you want to calculate aggregated values based on a specific grouping or windowing criteria.   cumulative or leading.


Q] find leading sum of sales day-wise 

To find the cumulative or leading sum of sales day-wise, you can use the SUM function with the OVER clause and order the results by date. 
Here's the query to achieve that:

SELECT date, SUM(amount) OVER (ORDER BY date) AS leading_sum
FROM sales
ORDER BY date;

In this query, the SUM function with the OVER clause calculates the running or cumulative sum of the sales amount. The ORDER BY clause ensures that the calculation 
is performed in the desired order of dates. The result will include the date and the corresponding leading sum of sales for each row in the sales table. For example, 
if your "sales" table has the following data:

date	    amount

2023-07-01	  100

2023-07-02	  200

2023-07-03	  150

2023-07-04	  300

2023-07-05	  250


The query will produce the following result:

date	leading_sum

2023-07-01	100

2023-07-02	300

2023-07-03	450

2023-07-04	750

2023-07-05	1000


The "leading_sum" column represents the cumulative or leading sum of sales day-wise.
