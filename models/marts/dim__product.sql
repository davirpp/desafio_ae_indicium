with 
    dim_product as (
        select *
        from {{ ref('stg__products') }}
    )

select * 
from dim_product