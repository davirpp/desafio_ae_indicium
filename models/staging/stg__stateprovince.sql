with 
    stg_stateprovince as (
        select
            cast(stateprovinceid as int) as pk_stateprovince
            , cast(countryregioncode as int) as fk_country
            , cast(name as string) as stateprovince_name
            , cast(stateprovincecode as string) as stateprovince_code
        from {{ source('raw_adventureworks', 'stateprovince') }}
    )

select * 
from stg_stateprovince