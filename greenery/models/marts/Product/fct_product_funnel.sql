 {{
  config(
    materialized='table'
  )
}}
 
 select fps.product_id, p.name,
    sum(case when fps.page_views > 0 then 1 else 0 end) as pageviews, 
    sum(case when fps.add_to_carts > 0 then 1 else 0 end) as cartadds, 
    cartadds/pageviews as view2cart_rate, 
    sum(case when fps.checkouts > 0 then 1 else 0 end) as checkedout,
    checkedout/cartadds as cart2checkedout_rate
 from fct_product_session fps, stg_postgres_products p
 where p.product_id = fps.product_id
 group by fps.product_id, p.name