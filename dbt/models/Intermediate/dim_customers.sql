select
    customer_id,
    first_name,
    last_name,
    email,
    gender,
    country,
    city
from {{ ref('stg_customers') }}