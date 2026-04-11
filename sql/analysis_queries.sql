create database banking_data;

-- data imported using data import wizard and stored in a table named transactions

select * from transactions;

alter table transactions rename column ï»¿step to step;

-- checking, are there any duplicates?
with cte as
(
	select *, row_number() over(partition by step, `type`,amount, nameOrig,oldbalanceOrg, newbalanceOrig,nameDest, oldbalanceDest,newbalanceDest,isFraud,isFlaggedFraud) as row_num
    from transactions
)select * from cte where row_num>1;

-- no duplicate value present

select count(*) as mismatch_count from transactions
where round(oldbalanceorg - amount, 2) != round(newbalanceorig, 2);

-- that is my mistake, we can not apply this logic to every type of payment,
-- we should remember the logic of addtion when there is a cash_in type of payment

select count(*) as mismatch_count from transactions
where (
    (type in ('payment','transfer','cash_out') 
     and round(oldbalanceorg - amount, 2) != round(newbalanceorig, 2))
    or
    (type = 'cash_in' 
     and round(oldbalanceorg + amount, 2) != round(newbalanceorig, 2))
);

-- we were missing a type 'debit' from the dataset

select distinct type from transactions;

-- there are 5 type : debit, cash_out, transfer, payment, cash_in
-- we should update our query

select count(*) as mismatch_count, round((count(*)*100)/(select count(*) from transactions),2) as percentage 
from transactions
where (
    (type in ('payment','transfer','cash_out','debit') 
     and round(oldbalanceorg - amount, 2) != round(newbalanceorig, 2))
    or
    (type = 'cash_in' 
     and round(oldbalanceorg + amount, 2) != round(newbalanceorig, 2))
);

-- 32224 data inconsistency ie 58 percenatge

select type, count(*) as total, round(avg(amount),2) as avg_amount
from transactions
group by type
order by 3 desc;

-- found that 'payment'type is mostly used transaction medium with over 24k transaction
-- least is 'debit' with only arounf 700 transactions
-- type 'transfer' has the maximum average amount ie 776521
-- type debit has the least avg_amount ie 3806

select type, count(*) as total, sum(isfraud) as fraud_cases
from transactions
group by type;

-- only type 'transfer' and 'cash_out' has fraud cases 
-- transfer with 49 and cash_out with 51 fraud cases

select type,count(*) as total, sum(isfraud) as fraud_cases, round((sum(isfraud) / count(*)) * 100, 2) as fraud_percentage
from transactions
group by type;

-- type 'transfer' has 0.94% chances of fraud
-- and type 'cash_out' has 0.33% chances of fraud

with cte as
(
select 
    case 
        when amount > (select avg(amount) from transactions) then 'high_value'
        else 'low_value'
    end as value_category,
count(*) as total, sum(isfraud) as fraud_cases 
from transactions
group by 1
) select *, round((fraud_cases/total)*100,2) as probability_of_fraud from cte;

-- 'low_value' has 67 fraud cases (high) but with less fraud probability around 0.17%
-- while 'high_value' has 33 fraud cases (less) but higher fraud probability arounf 0.20%