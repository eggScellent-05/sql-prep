with sensor_read as (
select measurement_value, measurement_time::DATE as measurement_day,
row_number() over (partition by measurement_time::DATE order by measurement_time,measurement_id ) as nth
from measurements
)

select measurement_day,
sum(case when nth%2=1 then measurement_value else 0 end) as odd_sum,
sum(case when nth%2=0 then measurement_value else 0 end) as even_sum
from sensor_read
group by measurement_day
ORDER BY measurement_day;