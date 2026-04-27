select 
*
from 
{{ source('source', 'dim_store') }} 