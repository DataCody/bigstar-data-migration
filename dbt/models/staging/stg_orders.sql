with source as (
    select * from {{ source('raw_data', 'orders') }}
)
select
    order_id,
    customer_id,
    status  as order_status,
    order_purchased_at,
    order_approved_at,
    order_delivered_at
from source