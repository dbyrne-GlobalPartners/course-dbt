{{
  config(
    materialized='table'
  )
}}

select pr.product_id, 
    pr.name as product_name, (select count( distinct ev.session_id)  from {{ ref('stg_postgres_events')}} ev where ev.event_type = 'page_view' and ev.product_id = pr.product_id) as pageview_total from {{ ref('stg_postgres_products')}} pr