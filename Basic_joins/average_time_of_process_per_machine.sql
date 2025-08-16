with calculate_avg_processing_time_per_machine as(
    select
        machine_id,
        process_id,
        case
            when 
                activity_type = 'start' then -timestamp
            when
                activity_type = 'end' then timestamp
        end as timestamp
    from
        Activity
)
select
    machine_id,
    round(sum(timestamp) / count(distinct process_id) , 3) as processing_time
from
    calculate_avg_processing_time_per_machine
group by machine_id
