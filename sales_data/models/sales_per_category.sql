{{
  config(
    materialized='table'
  )
}}


with salespercategory as (

    select
        SUM(quantity), category
    from fivetran_db.sales_data.order_details
    WHERE category IS NOT NULL
    AND quantity IS NOT NULL
    GROUP BY category
)

select * from salespercategory