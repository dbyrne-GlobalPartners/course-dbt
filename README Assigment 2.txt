Part 1
What is our user repeat rate?

using a single intermedate table I was able to run a single SQL to get repeat rate.

select (select sum(number_orders) from int_user_purchases where number_orders > 2) /
(select sum(number_orders) from int_user_purchases) as Repeat_Rate

0.775623



Explain the product mart models you added. Why did you organize the models in the way you did?

  - name: dim_users.sql
    description: "contains all features of a user" gathered together user data in this one. 

  - name: fact_orders.sql
    description: "Facts about unique orders"  expanded on the order data including the user name and promos and calaulated out the days to deliver the order. Would exonad this to include order size like no. of items etc. 

  - name: int_user_purchases.sql
    description: "users with number of purchases"  This was useful i answering the origianl question about repeat rate. It can alos show the users with hte most order and those with none.

I only did he required but in Marketign I would have added intermedate models to show where and the ratio of users within the country.
look at number of user per mailing address to determien if there's possible fraud for promotions that would invoce first time ordering.

Part 2

Added tests to the models to esure the id's are unique

found one failure while testing but it was on the examples from week 1, my week 2 tests passed.

1 of 4 START test not_null_my_first_dbt_model_id ............................... [RUN]
18:55:14  1 of 4 FAIL 1 not_null_my_first_dbt_model_id ................................... [FAIL 1 in 1.99s]
18:55:14  2 of 4 START test not_null_my_second_dbt_model_id .............................. [RUN]
18:55:15  2 of 4 PASS not_null_my_second_dbt_model_id .................................... [PASS in 1.17s]
18:55:15  3 of 4 START test unique_my_first_dbt_model_id ................................. [RUN]
18:55:16  3 of 4 PASS unique_my_first_dbt_model_id ....................................... [PASS in 1.16s]
18:55:16  4 of 4 START test unique_my_second_dbt_model_id ................................ [RUN]
18:55:17  4 of 4 PASS unique_my_second_dbt_model_id ...................................... [PASS in 1.31s]
18:55:17  
18:55:17  Finished running 4 tests in 0 hours 0 minutes and 6.60 seconds (6.60s).
18:55:17  
18:55:17  Completed with 1 error and 0 warnings:
18:55:17  
18:55:17  Failure in test not_null_my_first_dbt_model_id (models/example/schema.yml)
18:55:17    Got 1 result, configured to fail if != 0
18:55:17  
18:55:17    compiled Code at target/compiled/greenery/models/example/schema.yml/not_null_my_first_dbt_model_id.sql
18:55:17  
18:55:17  Done. PASS=3 WARN=0 ERROR=1 SKIP=0 TOTAL=4



