WITH sales AS (
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        {{ multiply( 'unit_price', 'quantity') }} as calculated_gross_amount,
        gross_amount,
        payment_method
    FROM {{ ref("bronze_sales") }}
),
products AS (
    SELECT
        product_sk,
        category
    FROM {{ ref("bronze_product") }}
),

customers AS (
    SELECT
        customer_sk,
        gender
    FROM {{ ref("bronze_customer") }}
),

joined_query AS (
select
    sales.sales_id,
    sales.gross_amount,
    sales.payment_method,
    sales.calculated_gross_amount,
    products.category,
    customers.gender
from sales
join products on sales.product_sk = products.product_sk
join customers on sales.customer_sk = customers.customer_sk
)

select 
    category,
    gender,
    sum(gross_amount) as total_sales
from joined_query
group by category, gender
order by total_sales desc