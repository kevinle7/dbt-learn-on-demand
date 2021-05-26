-- use warehouse compute_wh;

SELECT 
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    {{ cents_to_dollars('amount', 4) }} AS amount,
    created as created_at
FROM {{ source('stripe', 'payment') }}
