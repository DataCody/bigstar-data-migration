with f as (
    select * from {{ ref('fact_orders') }}
)
select
    date_trunc('day', order_purchased_at) as order_date,
    count(distinct order_id) as total_orders,
    sum(order_total) as total_revenue
from f
group by 1
order by 1