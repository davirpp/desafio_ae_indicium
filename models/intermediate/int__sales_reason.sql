with 
    sales_order_header_sales_reason as (
        select *
        from {{ ref('stg__sales_order_header_sales_reason') }}
    )
    , order_details as (
        select *
        from {{ ref('int__order_details') }}
    )
    , sales_reason as (
        select *
        from {{ ref('stg__sales_reason') }}
    )
    , joined as (
        select
            sales_order_header_sales_reason.sk_sales_order_header_sales_reason as sk_reason
            , sales_order_header_sales_reason.fk_sales
            , sales_reason.reason_name
            , sales_reason.reason_type
        from sales_order_header_sales_reason
        left join sales_reason
            on sales_order_header_sales_reason.fk_sales_reason = sales_reason.pk_sales_reason
        left join order_details
            on sales_order_header_sales_reason.fk_sales = order_details.fk_sales
    )

select * 
from joined