SELECT account_id,
SUM(
CASE
  WHEN transaction_type = 'Deposit' then amount
  WHEN transaction_type = 'Withdrawal' then amount*(-1)
END) as final_balance
FROM transactions
group by account_id;