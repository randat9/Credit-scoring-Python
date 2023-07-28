proc sql; 
create table  &zbior._score as 
select indataset.*  
, case 
when app_number_of_children < 1 then 141.0 
when 1 <= app_number_of_children  and  app_number_of_children < 2 then 148.0 
when 2 <= app_number_of_children then 168.0 
else 141.0 end as PSC_app_number_of_children 
 
, case 
when app_spendings < 250.0 then 141.0 
when 950.0 <= app_spendings then 146.0 
when 250.0 <= app_spendings  and  app_spendings < 430.0 then 150.0 
when 470.0 <= app_spendings  and  app_spendings < 950.0 then 151.0 
when 430.0 <= app_spendings  and  app_spendings < 470.0 then 158.0 
else 141.0 end as PSC_app_spendings 
 
, case 
when 1.6 <= act_call_cc then 141.0 
when 1.3 <= act_call_cc  and  act_call_cc < 1.6 then 161.0 
when 0.9 <= act_call_cc  and  act_call_cc < 1.3 then 176.0 
when 0.5 <= act_call_cc  and  act_call_cc < 0.9 then 182.0 
when act_call_cc < 0.5 then 189.0 
else 141.0 end as PSC_act_call_cc 
 
, case 
when 3.5 <= act_ccss_n_loan  and  act_ccss_n_loan < 5.5 then 141.0 
when 2.5 <= act_ccss_n_loan  and  act_ccss_n_loan < 3.5 then 150.0 
when 1.5 <= act_ccss_n_loan  and  act_ccss_n_loan < 2.5 then 163.0 
when 5.5 <= act_ccss_n_loan then 174.0 
when act_ccss_n_loan < 1.5 then 179.0 
else 141.0 end as PSC_act_ccss_n_loan 
 
, case 
when 28.5 <= act_cins_min_seniority  and  act_cins_min_seniority < 71.5 then 141.0 
when 17.5 <= act_cins_min_seniority  and  act_cins_min_seniority < 28.5 then 147.0 
when 71.5 <= act_cins_min_seniority then 150.0 
when 4.5 <= act_cins_min_seniority  and  act_cins_min_seniority < 17.5 then 156.0 
when act_cins_min_seniority < 4.5 then 169.0 
else 141.0 end as PSC_act_cins_min_seniority 
 
, case 
when 0.9 <= act_ccss_n_statC  and  act_ccss_n_statC < 4.1 then 141.0 
when 4.1 <= act_ccss_n_statC  and  act_ccss_n_statC < 7.1 then 148.0 
when act_ccss_n_statC < 0.9 then 152.0 
when 7.1 <= act_ccss_n_statC  and  act_ccss_n_statC < 15.4 then 166.0 
when 15.4 <= act_ccss_n_statC then 207.0 
else 141.0 end as PSC_act_ccss_n_statC 
 
, case 
when 2.5 <= ags3_Max_CMaxA_Due then 141.0 
when 1.5 <= ags3_Max_CMaxA_Due  and  ags3_Max_CMaxA_Due < 2.5 then 159.0 
when 0.5 <= ags3_Max_CMaxA_Due  and  ags3_Max_CMaxA_Due < 1.5 then 192.0 
when ags3_Max_CMaxA_Due < 0.5 then 213.0 
else 141.0 end as PSC_ags3_Max_CMaxA_Due 
 
, case 
when app_gender_job_code in ('Female_Owner company') then 174.0 
when app_gender_job_code in ('Male_Permanent', 'Male_Retired') then 182.0 
when app_gender_job_code in ('Female_Retired') then 185.0 
when app_gender_job_code in ('Female_Permanent') then 188.0 
else 141.0 end as PSC_app_gender_job_code 
 
, case 
when app_job_code_home_status in ('Owner company_Owner') then 162.0 
when app_job_code_home_status in ('Permanent_Owner', 'Retired_Owner') then 174.0 
when app_job_code_home_status in ('Permanent_Rental') then 181.0 
when app_job_code_home_status in ('Retired_Rental') then 189.0 
else 141.0 end as PSC_app_job_code_home_status 
 
, case 
when app_marital_status_cars in ('Divorced_No', 'Divorced_Owner') then 141.0 
when app_marital_status_cars in ('Maried_Owner') then 152.0 
when app_marital_status_cars in ('Widowed_Owner') then 156.0 
when app_marital_status_cars in ('Maried_No', 'Widowed_No') then 162.0 
else 141.0 end as PSC_app_marital_status_cars 
 
/* , 1/(1+exp(-(-0.03383025960268688*(0.0+ calculated PSC_app_number_of_children+ calculated PSC_app_spendings+ calculated PSC_act_call_cc+ calculated PSC_act_ccss_n_loan+ calculated PSC_act_cins_min_seniority+ calculated PSC_act_ccss_n_statC+ calculated PSC_ags3_Max_CMaxA_Due+ calculated PSC_app_gender_job_code+ calculated PSC_app_job_code_home_status+ calculated PSC_app_marital_status_cars)+(55.24520477588763)))) as PD */ 
 
, 0.0 
+ calculated PSC_app_number_of_children + calculated PSC_app_spendings + calculated PSC_act_call_cc + calculated PSC_act_ccss_n_loan + calculated PSC_act_cins_min_seniority + calculated PSC_act_ccss_n_statC + calculated PSC_ags3_Max_CMaxA_Due + calculated PSC_app_gender_job_code + calculated PSC_app_job_code_home_status + calculated PSC_app_marital_status_cars  as SCORECARD_POINTS 
 
from &zbior as indataset; 
quit; 
