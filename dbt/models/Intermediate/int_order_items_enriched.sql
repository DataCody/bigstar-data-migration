with order_items as (
    select
        order_id,
        product_id,
        product_price,
        count(*) as quantity,
        count(*) * product_price as total_amount
    from {{ source('raw_data', 'order_items') }}
    group by order_id, product_id, product_price
)

select *
from order_items