{{
  config(
    materialized='table'
  )
}}

SELECT
  u.user_id,
  u.email,
  u.first_name,
  u.last_name,
  u.CREATED_AT,
  u.CREATED_AT::DATE AS registered_date,
  ad.address,
  ad.state,
  ad.zipcode,
  ad.country
FROM {{ ref('stg_postgres_users') }} u
LEFT JOIN {{ ref('stg_postgres_addresses') }} ad
  ON u.address_id = ad.address_id
