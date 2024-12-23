with
    stg_person as (
        select
            cast(businessentityid as int) as pk_person
            , cast(concat(firstname, ' ', lastname) as string) as full_name
        from {{ source('raw_adventureworks', 'person') }}
    )

select * 
from stg_person