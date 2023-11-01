create database project;
use project;

select * from finance_1;
select * from finance_2;

# Total loan amount
select 
sum(loan_amnt) as total_loan_amount
from finance_1;

# Total Loan Distribed to people
select
distinct count(member_id) as total_loan_distributed
from finance_1;

# Cumulutive interest rate
select avg(int_rate) as cumulutive_interest_rate
from finance_1;

# KPI 1
# Year Wise Loan Amount stats
Select SUBSTRING(issue_d, -2) AS a_year,sum(loan_amnt) as loan_amnt
from project.finance_1
group by a_year
order by a_year;

# KPI 2
#Grade and sub grade wise revol_bal
select 
f1.grade,
f1.sub_grade ,
sum(f2.revol_bal) as total
from
 finance_1 f1 
left join finance_2 f2
 on f1.id = f2.id
 group by grade,sub_grade
 order by grade;

# KPI 3
# Total Payment for Verified Status Vs Total Payment for Non Verified Status
select
f1.verification_status ,
sum(f2.total_pymnt) as Total_Payment
  from 
finance_1 f1
left join finance_2 f2
on f1.id = f2.id
group by verification_status
order by Total_payment;


# KPI 4 
# State wise and last_credit_pull_d wise loan status
select 
f1.addr_state,
f1.loan_status,
count(f2.last_credit_pull_d) as Last_Credit_Pull_d
from 
finance_1 as f1 
left join finance_2 as f2
on f1.id = f2.id
group by f1.addr_state,f1.loan_status
order by Last_Credit_Pull_d desc;

# KPI 5
# Home ownership Vs last payment date stats
select 
f1.home_ownership,
count(f2.last_pymnt_d) as Last_payment_date_stats
from
finance_1 f1
left join finance_2 f2
on f1.id = f2.id
group by f1.home_ownership
order by Last_payment_date_stats desc;

