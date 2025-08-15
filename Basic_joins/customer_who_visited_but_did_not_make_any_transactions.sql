with no_transactions_done as(
    select
        a.customer_id,
        b.transaction_id,
        b.amount
    from
        Visits a
            left join
        Transactions b  
            on
        a.visit_id = b.visit_id
    where
        b.transaction_id is null    and
        b.amount is null
)
select
    customer_id,
    count(*) as count_no_trans
from
    no_transactions_done
group by
    customer_id
