with RT as (
  SELECT *,
  ROW_NUMBER() OVER (PARTITION BY USER_ID ORDER BY TRANSACTION_DATE) as nth_transaction
  FROM transactions

)

SELECT user_id , spend, transaction_date 
FROM RT
where nth_transaction=3;