with o as (
    select * from {{ ref('stg_orders') }}
),
oi as (
    select * from {{ ref('stg_order_items') }}
)
select
    o.order_id,
    o.customer_id,
    o.status,
    o.order_purchased_at,
    count(distinct oi.order_item_id) as items_count,
    sum(oi.product_price) as order_total
from o
left join oi on o.order_id = oi.order_id
group by 1,2,3,4