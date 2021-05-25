with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount
    from payments
    group by 1
),
final as (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        coalesce(amount, 0) as amount
    FROM orders o
    LEFT JOIN order_payments USING(order_id)
)

select * from final