with source as (
    select * from {{ source('raw_data', 'order_items') }}
)
select
    order_item_id,
    order_id,
    product_id,
    product_price
from source