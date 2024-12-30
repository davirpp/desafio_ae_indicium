with
    stg_country as (
        select
            cast(countryregioncode as string) as pk_countryregion
            , cast(name as string) as country_name
        from {{ source('raw_adventureworks', 'countryregion') }}
    )

select * 
from stg_country