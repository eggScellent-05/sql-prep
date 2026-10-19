with top_selling as (
  SELECT p.category_name,p.product_name, ---or * is alright too
  rank() over (partition by p.category_name order by ps.sales_quantity desc,ps.rating desc) as best
  from products p inner join product_sales ps 
  on p.product_id=ps.product_id
)

select category_name,product_name 
from top_selling
where best = 1
order by category_name,product_name; --productname ordering doesn't really matter if i had used row_number. doesn't matter here too but for the sake of the question.