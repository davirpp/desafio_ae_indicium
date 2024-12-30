with 
    stg_credit_card as (
        select 
            cast(creditcardid as int) as pk_credit_card
            , cast(cardtype as string) as card_type
            from {{ source('raw_adventureworks', 'creditcard') }}
    )

select *
from stg_credit_card