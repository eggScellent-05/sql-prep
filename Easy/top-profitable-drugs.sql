select drug , total_sales-cogs as total_profit
from pharmacy_sales
order by total_profit DESC
limit 3;

--if there are multiple rows of product
select drug , sum(total_sales)-sum(cogs) as total_profit
from pharmacy_sales
group by drug
order by total_profit DESC
limit 3;