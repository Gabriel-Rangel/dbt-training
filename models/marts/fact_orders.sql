select
    order_id,
    customer_id,
    order_date,
    sum(case when stg_payments.status = 'sucess' then amount else 0 end) as amount

from {{ref('stg_payments')}}

left join {{ref('stg_orders')}} using(order_id)

group by 1, 2, 3