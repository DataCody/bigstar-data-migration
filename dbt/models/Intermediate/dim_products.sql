select
    product_id,
    product_name,
    category,
    collection,
    price,
    rating,
    availability
from {{ ref('stg_products') }}