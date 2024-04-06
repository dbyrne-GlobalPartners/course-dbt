{{
  config(
    materialized='table'
  )
}}

select session_id,
{{ eventcount('session_id', 'page_view') }} as pageviews,
{{ eventcount('session_id', 'add_to_cart') }} as cartadds,
{{ eventcount('session_id', 'checkout') }} as checkouts,
{{ eventcount('session_id', 'package_shipped') }} as shippings
from {{ ref('stg_postgres_events')}}
