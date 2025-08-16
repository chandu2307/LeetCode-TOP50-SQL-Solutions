with combined_data as(
    select
        a.product_id,
        a.price,
        b.units
    from
        Prices a
            left join
        UnitsSold b
            on
        a.product_id = b.product_id and
        b.purchase_date between a.start_date and a.end_date
)

select
    product_id,
    coalesce(round(sum(price * units) / sum(units) , 2),0) as average_price
from
    combined_data
group by 
    product_id
