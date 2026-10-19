with first_issue as 
(
select *,
row_number() over(partition by card_name order by issue_year,issue_month) as chrono
from monthly_cards_issued
)

select card_name,issued_amount
from first_issue
where chrono = 1
order by issued_amount desc;




-----------------------------------------------------------------------------
--site's answer:
WITH card_launch AS (
  SELECT 
    card_name,
    issued_amount,
    MAKE_DATE(issue_year, issue_month, 1) AS issue_date,
    MIN(MAKE_DATE(issue_year, issue_month, 1)) OVER (
      PARTITION BY card_name) AS launch_date
  FROM monthly_cards_issued
)

SELECT 
  card_name, 
  issued_amount
FROM card_launch
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;
