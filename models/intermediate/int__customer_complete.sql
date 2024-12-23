with 
    customer as (
        select *
        from {{ ref('stg__customer') }}
    )
    , person as (
        select *
        from {{ ref('stg__person') }}
    )
    , store as (
        select *
        from {{ ref('stg__store') }}
    )
    , customer_joined as (
        select
            customer.pk_customer
            , customer.fk_person
            , customer.fk_store
            , case
                when fk_person is null then store.store_name
                else person.full_name
            end as customer_name
            , case
                when fk_person is null then 'Store'
                else 'Person'
            end as customer_type
        from customer
        left join store
            on customer.fk_store = store.pk_store
        left join person 
            on customer.fk_person = person.pk_person
    )

select *
from customer_joined