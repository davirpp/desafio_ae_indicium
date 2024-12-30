with
    dim_address as (
        select *
        from {{ ref('int__address_link') }}
    )

select * 
from dim_address