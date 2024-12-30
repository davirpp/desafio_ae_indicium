with 
    stg_products as (
        select
            cast(productid as int) as pk_product
            , cast(name as string) as product_name
            , cast(productnumber as string) as product_number
            , cast(safetystocklevel as int) as stock_level
            , cast(listprice as numeric(18, 4)) as list_price
        from {{ source('raw_adventureworks', 'product') }}
    )

select * 
from stg_products