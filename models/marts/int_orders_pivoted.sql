{%- set methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

select
      order_id,
      
      {% for method in methods -%}

      sum(case when payment_method = '{{ method }}' then amount else 0 end) as {{ method }}_amount 
      {%- if not loop.last -%} , {% endif -%}

      {%- endfor %}
from {{ ref('stg_payments') }}
group by 1
