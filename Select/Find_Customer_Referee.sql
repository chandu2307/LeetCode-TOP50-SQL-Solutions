select
    name
from
    Customers
where
    referee_id <> 2 or referee_id is null
