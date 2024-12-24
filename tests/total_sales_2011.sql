with
    total_sales_2011 as (
        select
            cast(sum(total_gross) as numeric(18, 2)) as total_gross
        from {{ ref('fct__sales') }}
        where year(order_date) = 2011
    )

select *
from total_sales_2011
where total_gross != 12646112.16