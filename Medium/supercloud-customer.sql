select customer_id
from products p join customer_contracts cc 
on p.product_id= cc.product_id
group by customer_id
having count(distinct product_category) = (select count(distinct product_category) from products);

