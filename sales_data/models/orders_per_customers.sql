{{
  config(
    materialized='table'
  )
}}


with ordersdetailspercustomer as (

    select
        COUNT(order_id) as orders_count, customer_name
    from fivetran_db.sales_data.list_of_orders
    WHERE customer_name IS NOT NULL
    AND order_id IS NOT NULL
    GROUP BY customer_name
)

select * from ordersdetailspercustomer