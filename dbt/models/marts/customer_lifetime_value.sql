with f as (
    select * from {{ ref('fact_orders') }}
)
select
    customer_id,
    count(distinct order_id) as total_orders,
    sum(order_total) as total_revenue,
    avg(order_total) as avg_order_value,
    min(order_purchased_at) as first_purchase,
    max(order_purchased_at) as last_purchase
from f
group by 1