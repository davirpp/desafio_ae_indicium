with 
    stg_customer as (
        select 
            cast(customerid as int) as pk_customer
            , cast(personid as int) as fk_person
            , cast(storeid as int) as fk_store
        from {{ source('raw_adventureworks', 'customer') }}
    )

select *
from stg_customer