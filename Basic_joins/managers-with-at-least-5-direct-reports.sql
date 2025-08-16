select
    a.name
from
    Employee a
where
    (
        select 
            count(*) 
        from 
            Employee b
        where
            a.id = b.managerId) >=5 
