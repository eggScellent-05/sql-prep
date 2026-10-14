-- if a row had a NULL message_id but a valid sender_id and sent_date, COUNT(*) would count it as a message.

select sender_id, count(message_id) as message_count
from messages
WHERE sent_date >= '2022-08-01' AND sent_date < '2022-09-01'
group by sender_id
order by count(message_id) DESC
limit 2;