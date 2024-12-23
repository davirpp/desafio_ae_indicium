with
    stg_sales_reason as (
        select
            cast(salesreasonid as int) as pk_sales_reason
            , cast(name as string) as reason_name
            , cast(reasontype as string) as reason_type
        from {{ source('raw_adventureworks', 'salesreason') }}
    )

select * from stg_sales_reason