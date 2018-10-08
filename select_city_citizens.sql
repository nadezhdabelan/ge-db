select  p1.country, city, to_char( ((p1.citizen/c1.sum)*100), '99.99%') percent_citizen
from population p1,
     (select sum(citizen) sum, country from population
      group by country) c1
where city in (select  city from population p2
               where p1.country=p2.country limit 3)
  and p1.country = c1.country
order by c1.country, percent_citizen desc;