with
    order_details as (
        select *
        from {{ ref('stg__sales_order_detail') }}
    )
    , order_header as (
        select *
        from {{ ref('stg__sales_order_header') }}
    )
    , order_header_reason as (
        select * 
        from {{ ref('stg__sales_order_header_sales_reason') }}
    )
    , products as (
        select * 
        from {{ ref('stg__products') }}
    )
    , int_order_details as (
        select
            order_details.pk_salesorderdetail as fk_salesorderdetail
            , order_details.fk_sales
            , order_header.fk_customer
            , order_header.fk_address
            , order_header.fk_credit_card
            , order_details.fk_product
            , order_header.order_date
            , case
                when order_header.order_status = 5 then 'Finished'
                else 'Pending'
            end as order_status
            , order_details.quantity
            , order_details.unit_price
            , order_details.unit_price_discount
        from order_details
        left join order_header
            on order_details.fk_sales = order_header.pk_sales
    )
    , final_metrics as (
        select
            *
            , cast((unit_price * quantity) as numeric(18, 4)) as total_gross
            , cast(((unit_price * (1 - unit_price_discount)) * quantity) as numeric(18, 4)) as total_with_discount
        from int_order_details
    )

select * 
from final_metrics