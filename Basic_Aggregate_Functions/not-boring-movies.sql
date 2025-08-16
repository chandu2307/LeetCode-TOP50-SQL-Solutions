select * from cinema
where
    id % 2 <> 0 and
    description not like upper("%boring%")
order by 
    rating desc
