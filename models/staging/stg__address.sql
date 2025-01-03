with 
    stg_address as (
        select
            cast(addressid as int) as pk_address
            , case
                when addressline2 is null then addressline1
                else concat(addressline1, ', ', addressline2)
            end as full_address
            , cast(city as string) as city
            , cast(stateprovinceid as int) as fk_stateprovince
            , cast(postalcode as string) as postal_code
        from {{ source('raw_adventureworks', 'address') }}


    )

select * 
from stg_address