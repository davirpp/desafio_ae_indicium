with
    stg_sales_order_header_sales_reason as (
        select
            cast(salesorderid as int) || '-' || cast(salesreasonid as int) as sk_sales_order_header_sales_reason
            , cast(salesorderid as int) as fk_sales
            , cast(salesreasonid as int) as fk_sales_reason
        from {{ source('raw_adventureworks', 'salesorderheadersalesreason') }}
    )

select * 
stg_sales_order_header_sales_reason