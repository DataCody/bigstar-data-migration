with o as (
    select * from {{ ref('stg_orders') }}
),
oi as (
    select
        order_id,
        product_id,
        product_price,
        count(*) as quantity,
        count(*) * product_price as total_amount
    from {{ ref('stg_order_items') }}
    group by order_id, product_id, product_price
)
select
    o.order_id,
    o.customer_id,
    o.status,
    o.order_purchased_at,
    sum(oi.quantity) as items_count,
    sum(oi.total_amount) as order_total
from o
left join oi on o.order_id = oi.order_id
group by 1,2,3,4