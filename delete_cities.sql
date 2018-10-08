delete from cities c1
where
    c1.id in (
             select c1.id from cities c1,
                               (select min(id) min_id, name from cities t group by name having count(*) >= 2) c2
             where c1.name = c2.name and c1.id!=c2.min_id
             );