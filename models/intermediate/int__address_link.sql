with
    address as (
        select *
        from {{ ref('stg__address') }}
    )
    , stateprovince as (
        select *
        from {{ ref('stg__stateprovince') }}
    )
    , country as (
        select *
        from {{ ref('stg__country') }}
    )
    , address_link as (
        select
            address.pk_address
            , address.full_address
            , address.city
            , address.postal_code
            , stateprovince.stateprovince_name
            , stateprovince.stateprovince_code
            , country.country_name
            , country.pk_countryregion as country_code

        from address
        left join stateprovince 
            on address.fk_stateprovince = stateprovince.pk_stateprovince
        left join country 
            on stateprovince.fk_country = country.pk_countryregion
    )

select * 
from address_link