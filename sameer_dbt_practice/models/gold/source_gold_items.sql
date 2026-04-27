WITH deduped_items AS (
    select
    *,
    row_number() over (partition by id order by updateDate desc) as dedup_id
    from
    {{ source('source', 'items') }}
)

select 
    id,
    name,
    category,
    updateDate
from deduped_items
where dedup_id = 1