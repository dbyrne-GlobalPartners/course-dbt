part 1:

week 3 to 4 product change

select PRODUCT_ID, NAME, INVENTORY from orders_snapshot
 where dbt_Updated_at > '2024-04-11'

PRODUCT_ID				NAME			PRICE	INVENTORY
689fb64e-a4a2-45c5-b9f2-480c2155624d	Bamboo			15.25	23
fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80	String of pearls	80.5	10
4cda01b9-62e2-46c5-830f-b7f262a58fb1	Pothos			30.5	20
be49171b-9f72-4fc9-bf7a-9a52e259836b	Monstera		50.75	31
55c6a062-5f4a-4a8b-a8e5-05ea5e6715a3	Philodendron		45	30
b66a7143-c18a-43bb-b5dc-06bb5d1d3160	ZZ Plant		25	41
product with no more inventory

select PRODUCT_ID, NAME, INVENTORY from orders_snapshot
 where INVENTORY = 0


PRODUCT_ID				NAME			PRICE	INVENTORY
4cda01b9-62e2-46c5-830f-b7f262a58fb1	Pothos			30.5	0
fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80	String of pearls	80.5	0

part 2:

built a funnel model

was able to show or highest (String of pearls) to lowest (Pothos) product views to cart and the highest (Money Tree) to lowest (Angel Wings Begonia) cart to purchase.


Part 3A
if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?

A better undstanding of data modeling and the confidence to begin experimeting witin my onw dev schems on our snowflake environment.