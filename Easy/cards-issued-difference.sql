select card_name,abs( max(issued_amount) - min(issued_amount)) as difference
from monthly_cards_issued
group by card_name
order by difference DESC