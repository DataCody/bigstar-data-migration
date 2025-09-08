with p as (
    select * from {{ ref('dim_products') }}
),
oi as (
    select * from {{ ref('stg_order_items') }}
),
o as (
    select * from {{ ref('stg_orders') }}
),
agg as (
    select
        p.product_id,
        p.product_name,
        p.category,
        p.collection,
        p.price,
        p.rating,
        p.availability,

        count(distinct oi.order_id) as total_orders,
        sum(oi.product_price) as total_revenue,
        avg(oi.product_price) as avg_order_value,
        min(o.order_purchased_at) as first_order,
        max(o.order_purchased_at) as last_order
    from p
    left join oi on p.product_id = oi.product_id
    left join o on oi.order_id = o.order_id
    group by
        p.product_id, p.product_name, p.category, p.collection, p.price, p.rating, p.availability
)
select * from agg