with
    dim_customer as (
        select *
        from {{ ref('int__customer_complete') }}
    )

select *
from dim_customer