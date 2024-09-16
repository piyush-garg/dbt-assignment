{{
  config(
    materialized='table'
  )
}}


with salespersubcategory as (

    select
        SUM(quantity) as total, category, sub_category
    from fivetran_db.sales_data.order_details
    WHERE category IS NOT NULL
    AND quantity IS NOT NULL
    AND sub_category IS NOT NULL
    GROUP BY category, sub_category
)

select * from salespersubcategory