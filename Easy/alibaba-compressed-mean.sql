SELECT 
  round((sum(item_count*order_occurrences)*1.0/sum(order_occurrences)) ::numeric,1) AS MEAN
FROM items_per_order;

--round doesnt accept double precision so , numerical literal
--div by zero edge case but here the value added up to more than zero for sure
