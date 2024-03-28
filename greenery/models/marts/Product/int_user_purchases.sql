{{
  config(
    materialized='table'
  )
}}

select du.user_id,
du.first_name,
du.last_name,
du.email,
(select count(o.order_id) from {{ ref('stg_postgres_orders') }} o where o.user_id = du.user_id ) as number_orders
from {{ ref('dim_users') }} du
group by du.user_id, du.first_name, du.last_name, du.email