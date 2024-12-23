with
    credit_card as (
        select *
        from {{ ref('stg__credit_card') }}
    )

select * 
from credit_card