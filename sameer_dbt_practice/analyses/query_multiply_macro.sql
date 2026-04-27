
select 
    unit_price,
    quantity,
    {{ multiply('unit_price', 'quantity') }} as total_amount
from 
{{ ref('bronze_sales') }}
