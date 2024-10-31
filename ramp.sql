WITH DAY_LEVEL_TRANSACTIONS AS (
    select TRANSACTION_TIME::DATE AS T_DATE,SUM(TRANSACTION_AMOUNT) AS DAILY_T_AMOUNT
from transactions
group by 1
order by 1
)
,Rolling_3_day_Avg as (
    select *
    ,avg(DAILY_T_AMOUNT) over( order by T_DATE rows between 2 preceding and current row) as rolling_avg
from DAY_LEVEL_TRANSACTIONS
)
select rolling_avg
from Rolling_3_day_Avg where T_DATE='2021-01-31'
;
