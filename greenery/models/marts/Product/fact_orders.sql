{{
  config(
    materialized='table'
  )
}}

SELECT
  o.order_id,
  o.created_at,
  o.order_total,
  o.status,
  o.promo_id,
  pc.discount AS promo_discount,
  o.user_id,
  u.first_name AS user_first_name,
  DATEDIFF(day, o.created_at, o.delivered_at) AS days_to_deliver
FROM {{ ref('stg_postgres_orders') }} o
LEFT JOIN {{ ref('stg_postgres_promos') }} pc
  ON o.promo_id = pc.promo_id
LEFT JOIN {{ ref('stg_postgres_users') }} u
  ON o.user_id = u.user_id
