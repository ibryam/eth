{{
  config(
    tags = ['stablecoin']
    )
}}

select

t.date,
t.token_address,
s.type,
s.symbol,
{{ conversation('t.value', 's.decimals')}} as total_usd_value
 --based on decimals Other Info  Token Contract (WITH 6 Decimals) from https://etherscan.io/token/0xdAC17F958D2ee523a2206206994597C13D831ec7




from {{ ref('stg_token_transfers') }} t
left join {{ref('stablecoins')}} s on t.token_address = s.contract_address

where s.contract_address is not null -- lower(t.token_address) in ('0xdac17f958d2ee523a2206206994597c13d831ec7', '0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48') 
-- contract codes are taken from  https://coinmarketcap.com/currencies/tether/ and https://coinmarketcap.com/currencies/usd-coin/
group by t.date, t.token_address, s.type, s.symbol