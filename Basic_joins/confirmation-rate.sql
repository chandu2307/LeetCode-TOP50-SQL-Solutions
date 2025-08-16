with confirmation_users as(
    select
        a.user_id,
        sum(case 
            when b.action = 'confirmed' then 1
            else 0
        end) as  confirmed_cnts,
        count(b.action) as total_cnts
    from
        Signups a
            left join
        Confirmations b
            on
        a.user_id = b.user_id
    group by a.user_id
)

select 
    user_id,
    coalesce(round(confirmed_cnts / total_cnts , 2),0) as confirmation_rate
from
    confirmation_users
