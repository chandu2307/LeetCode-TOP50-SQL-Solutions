with rising_temperature as(
    select
        id,
        recordDate,
        lag(recordDate) over(order by recordDate) as previous_recordDate,
        temperature,
        lag(temperature) over(order by recordDate) as previous_temperature
        from
        Weather
)
select 
    id
from 
    rising_temperature
where
    DATEDIFF(recordDate ,previous_recordDate) = 1 and
    temperature > previous_temperature