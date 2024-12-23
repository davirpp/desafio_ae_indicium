with
    stg_sales_order_header as (
        select
            cast(salesorderid as int) as pk_sales
            , cast(customerid as int) as fk_customer
            , cast(billtoaddressid as int) as fk_address
            , cast(creditcardid as int) as fk_credit_card
            , cast(orderdate as date) as order_date
            , cast(status as int) as order_status
            , cast(subtotal as numeric(18, 4)) as subtotal
            , cast(taxamt as numeric(18, 4)) as tax
            , cast(freight as numeric(18, 4)) as freight
            , cast(totaldue as numeric(18, 4)) as total_due
        from {{ source('raw_adventureworks', 'salesorderheader') }}
    )



select * 
from stg_sales_order_header