with f as (
    select * from {{ ref('fact_orders') }}
),
oi as (
    select * from {{ ref('stg_order_items') }}
)
select
    oi.product_id,
    count(distinct oi.order_item_id) as total_items_sold,
    sum(oi.product_price) as revenue
from f
join oi on f.order_id = oi.order_id
group by 1