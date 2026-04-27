{{
    config(
        materialized='view'
    )
}} -- block level config

select 
*
from 
{{ source('source', 'fact_sales') }} 