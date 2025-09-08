with source as (
    select * from {{ source('raw_data', 'customers') }}
)
select
    customer_id,
    first_name,
    last_name,
    email,
    country,
    gender,
    city
from source