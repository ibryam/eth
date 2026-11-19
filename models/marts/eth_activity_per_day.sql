{{config(
    materialized='table'
)}}

select

date,
transactions_category,
count(*) as tx_count,
{{ conversation('value', '18') }} as sum_eth_value -- to get value of eth, 1e18 is a wei that is 10th of 18 for a eth, this is how we find how much eth is wei value

from {{ ref('stg_transactions_enriched')}}

group by date, transactions_category
