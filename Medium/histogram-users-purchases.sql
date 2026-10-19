with recent as (
  select
  *,
  MAX(transaction_date) over (partition by user_id) as last_transaction
  from user_transactions
)

select transaction_date,user_id,count(product_id) as purchase_count from recent
where transaction_date = last_transaction
group by user_id, transaction_date -- last_transaction and transaction_date becomes same at this point in the query
order by transaction_date;


--could've used first_value and also last_value with unbounded...etc