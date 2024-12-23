with
    stg_store as (
        select
            cast(businessentityid as int) as pk_store
            , cast(name as string) as store_name
        from {{ source('raw_adventureworks', 'store') }}
    )

select *
from stg_store