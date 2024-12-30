with
    sales_metrics as (
        select * 
        from {{ ref('int__order_details') }}
    )

select *
from sales_metrics