with
    stg_sales_order_detail as (
        select
            cast(saledorderdetailid as int) as pk_salesorderdetail
            , cast(salesorderid as int) as fk_sales
            , cast(productid as int) as fk_product
            , cast(orderqty as int) as quantity
            , cast(unitprice as numeric(18, 4)) as unit_price
            , cast(unitpricediscount as numeric(18, 4)) as unit_price_discount
        from {{ source('raw_adventureworks', 'salesorderdetail') }}
    )

select *
from stg_sales_order_detail