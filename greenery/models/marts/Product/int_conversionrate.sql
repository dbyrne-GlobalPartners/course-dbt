{{
  config(
    materialized='table'
  )
}}

select ( select count(distinct session_id) from {{ ref('stg_postgres_events')}} where event_type = 'checkout')/(select count(distinct session_id) from {{ ref('stg_postgres_events')}}) as conversion_rate