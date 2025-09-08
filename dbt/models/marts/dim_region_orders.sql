with c as (
    select
        customer_id,
        country,
        city
    from {{ ref('dim_customers') }}
),
o as (
    select
        customer_id,
        order_id,
        order_total,
        order_purchased_at
    from {{ ref('fact_orders') }}
),
agg as (
    select
        c.country,
        c.city,
        count(distinct o.order_id) as total_orders,
        count(distinct c.customer_id) as unique_customers,
        sum(o.order_total) as total_revenue,
        avg(o.order_total) as avg_order_value,
        sum(o.order_total) / nullif(count(distinct c.customer_id),0) as revenue_per_customer,
        min(o.order_purchased_at) as first_order,
        max(o.order_purchased_at) as last_order
    from c
    left join o using (customer_id)
    group by c.country, c.city
)
select *
from agg