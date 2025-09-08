with source as (
    select * from {{ source('raw_data', 'products') }}
)
select
    product_id,
    name as product_name,
    category,
    collection,
    price,
    rating,
    availability
from source