with f as (
    select * from {{ ref('fact_orders') }}
),
c as (
    select * from {{ ref('dim_customers') }}
)
select
    c.customer_id,
    c.gender,
    c.country,
    count(distinct f.order_id) as total_orders,
    sum(f.order_total) as total_revenue,
    avg(f.order_total) as avg_order_value,
    min(f.order_purchased_at) as first_purchase,
    max(f.order_purchased_at) as last_purchase
from f
left join c on f.customer_id = c.customer_id
group by
    c.customer_id,