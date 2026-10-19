with highest as (
  select to_char(date,'Mon-YYYY') as date,ticker,open,
  row_number() over (PARTITION BY ticker order by open desc) as hrank
  from stock_prices
),
lowest as (
  select to_char(date,'Mon-YYYY') as date,ticker,open,
  row_number() over (PARTITION BY ticker order by open ) as lrank
  from stock_prices
)

select h.ticker, h.date as highest_mth, h.open as highest_open,
l.date as lowest_mth,l.open as lowest_open
from highest h join lowest l 
on h.ticker=l.ticker where h.hrank=1 and l.lrank=1  --AND/WHERE DOESNT MATTER HERE BUT CHANGES RESULTS ACCORDING TO WHICH JOINS ARE USED


