select item_count as mode 
from items_per_order
where order_occurrences = (SELECT max(order_occurrences) FROM items_per_order)
order by item_count


