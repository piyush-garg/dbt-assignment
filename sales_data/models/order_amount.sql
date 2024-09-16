{{
  config(
    materialized='table'
  )
}}


with ordersdetails as (

    select
        order_id,
        order_date
    from fivetran_db.sales_data.list_of_orders
    WHERE order_id IS NOT NULL
    AND order_date IS NOT NULL
),

amountdetails as (
    select
        order_id,
        amount,
        profit
    from fivetran_db.sales_data.order_details
    WHERE order_id IS NOT NULL
    AND amount IS NOT NULL
    AND profit IS NOT NULL
),

orderamountprofit as (
    select
        ordersdetails.order_id,
        amountdetails.amount,
        amountdetails.profit,
        ordersdetails.order_date
    
    from ordersdetails

    left join amountdetails using (order_id)
)

select * from orderamountprofit