  
select concat(Name,'(',left(Occupation,1),')') as name from Occupations order by Name;
select concat('There are a total of',' ',count(occupation),' ',lower(occupation),'s','.') as total from Occupations group by Occupation
order by total;
