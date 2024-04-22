create database healthcare;
use healthcare;
select * from healthcare_data;

-- Count the number of Patient
select count(*) from healthcare_data;
/*Insight:
	Counting the number of patients in the healthcare data offers insights into population size, 
    resource needs, health trends, service usage, finances, epidemiology, and benchmarks for comparison.
*/

-- Get a count of patients by gender or age group.
select age,count(age) from healthcare_data group by age; 
select gender,count(gender) from healthcare_data group by gender; 
 /*Insights:
 		By examining both age and gender distributions together, one can uncover intersections between age, gender, and healthcare utilization.
 		For example, it may reveal whether certain health conditions are more prevalent in specific age-gender groups.
		This combined analysis can inform targeted healthcare policies, interventions, and research efforts aimed at improving healthcare outcomes for diverse demographic groups.*/

-- Listing patients with a specific medical condition=Diabetes
select * from healthcare_data where medical_condition="Diabetes";
/*Insight:
	->Further analysis, such as tracking changes over time or comparing outcomes between different patient groups, 
    can enhance understanding and inform targeted interventions for diabetes care.*/

-- Finding patients who were admitted for more than 1 year.
select * from healthcare_data where (Date_of_Admission-Discharge_Date)>12;
/*Insights:
	1)Understanding the reasons for prolonged hospital stays can help optimize treatment protocols and resource allocation.
	2)Monitoring trends in extended hospitalizations can inform healthcare planning and identify areas for improvement in care delivery and patient outcomes.*/
    
-- Determine the average length of stay for patients.    
select ceiling(avg(Date_of_Admission-Discharge_Date))as avg_month from healthcare_data;
/*Insights:
	1)Monitoring changes in the average length of stay over time can help identify improvements or inefficiencies in healthcare processes and protocols.
	2)Understanding the factors influencing length of stay, such as medical condition severity, treatment effectiveness, and discharge planning, can guide 
    efforts to optimize patient care pathways and reduce unnecessary hospitalizations.*/
    
 -- Identify the most common admission types
 select admission_type,count(admission_type) from healthcare_data group by admission_type;
-- Insight:Identifying the most common admission types sheds light on how patients enter healthcare facilities, 
--  providing insights into healthcare utilization patterns and potential areas for improvement.

-- Determine the total billing amount covered by each insurance provider.
select sum(Billing_Amount),insurance_provider from healthcare_data group by insurance_provider;
/*Insights:
1)Understanding the distribution of billing amounts across different insurance providers helps identify the financial impact of each provider on healthcare facilities.
2)Analyzing the billing amounts covered by each insurance provider can inform negotiations and agreements between healthcare facilities and insurance companies.
3)Identifying variations in billing amounts among different insurance providers may highlight disparities in coverage and reimbursement rates,
 potentially impacting patient access to care.
4)Monitoring changes in billing amounts over time can help healthcare facilities assess the financial stability of their patient population and 
adjust revenue management strategies accordingly.*/

-- Determine the most common medication conducted in the hospital.
select medication,count(medication) as medication_Count from healthcare_data group by medication order by medication_Count desc;
/*
Insight: 
	1)Analyzing medication trends over time can indicate changes in disease prevalence, treatment guidelines, or prescribing practices.
	2)Monitoring the usage of specific medications can inform healthcare providers about potential areas for quality improvement or adverse drug event prevention.*/
    
-- Find rooms that are frequently occupied by patients.
select room_number,count(room_number) as room from healthcare_data group by room_number order by room desc;
/*Insight:
	1)Recognizing the most frequently occupied rooms helps optimize bed management and resource allocation within the hospital.
	2)Understanding room occupancy patterns can inform staffing levels, cleaning schedules, and facility maintenance.*/

-- Calculating the average billing amount by each doctor.
select avg(billing_amount),doctor from healthcare_data group by doctor;
-- Insight:Understanding the average billing amount by each doctor helps evaluate their contribution to the healthcare facility's financial performance.