create table patients (
patient varchar(100) primary key not null, 
birthdate date,
deathdate date,
ssn varchar(100),
drivers varchar(100),
passport varchar(100),
prefix char(10),
first_name char(30),
last_name char(30),
suffix char(10),
maiden char(20),
marital char(10),
race char(20),
ethnicity char(30),
gender char(10),
birthplace char(30),
address varchar(100));

create table patient_condition (
start_date date,
stop_date date,
patient varchar(100),
encounter_id varchar(100),
code_id int,
condition_description varchar(100));

create table medications (
start_date date,
stop_date date,
patient varchar(100),
encounter_id varchar(100),
code_id int,
medication_description varchar(100),
reason_code int,
reason_description char(100));

select * 
from patients
limit 10;

select * 
from medications
limit 10;

select *
from patient_condition
limit 10;

#The most reoccurent disease in patient
select condition_description, count(*) as no_of_occurence
from patient_condition
group by condition_description
order by no_of_occurence desc
limit 10;

#Number of viral sinusitis conditions in males and females
select p.gender, pc.condition_description, count(*) as no_of_occurencies
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by p.gender, pc.condition_description
having pc.condition_description = 'Viral sinusitis (disorder)'
order by no_of_occurencies;

#Number of males and females with Acute Bronchitis
select p.gender, pc.condition_description, count(*) as no_of_occurencies
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by p.gender, pc.condition_description
having pc.condition_description = 'Acute bronchitis (disorder)'
order by no_of_occurencies;

#Number of pregnancy according to ethnic group
select p.ethnicity, pc.condition_description, count(*) as no_of_occurencies
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by p.ethnicity, pc.condition_description
having pc.condition_description = 'Normal pregnancy'
order by no_of_occurencies desc
limit 10;

#Medications and the reason for their use
select medication_description, reason_description, count(*) as frequency
from medications
group by medication_description, reason_description
order by frequency desc;

#The medications most used by each ethnic group 
select p.ethnicity, m.medication_description, count(*) as frequency
from patients p inner join medications m
on p.patient = m.patient
group by p.ethnicity, m.medication_description
order by frequency desc;

#Number of dead patient who took injections
select count(p.deathdate) as no_of_death
from (select * from medications where medication_description like '%Injection') i
inner join patients p on i.patient = p.patient;

#Medications most used by married patients
select p.marital, m.medication_description, count(*) as frequency
from patients p inner join medications m
on p.patient = m.patient
group by p.marital, m.medication_description
having p.marital = 'M'
order by frequency desc
limit 10;

#The race using the most drugs related to disorder
select p.race, m.reason_description, count(*) as frequency
from patients p inner join medications m
on p.patient = m.patient
group by p.race, m.reason_description
having m.reason_description like '%(disorder)'
order by frequency desc;

#Conditions encountered by most dead patient
select pc.condition_description, count(deathdate) as frequency
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by pc.condition_description
order by frequency desc
limit 10;

#Conditions with the highest average number of days to recover
select condition_description, avg(datediff(stop_date, start_date)) as recover_days
from patient_condition
group by condition_description
order by recover_days desc
limit 10;

#Conditions with the lowest average number of days to recover
select condition_description, avg(datediff(stop_date, start_date)) as recover_days
from patient_condition
group by condition_description
order by recover_days 
limit 10;

#Average number of days it takes for each gender to recover from disorders
select p.gender, pc.condition_description, avg(datediff(pc.stop_date, pc.start_date)) as recover_days
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by gender, condition_description
having pc.condition_description like '%(disorder)'
order by 2;

#Birthplace of patients with highest number of conditions
select p.birthplace, count(pc.condition_description) as no_of_conditions
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by birthplace
order by no_of_conditions desc
limit 1;

#Number of pregnancy by race
select p.race, pc.condition_description, count(*) as no_of_pregnancies
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by race, condition_description
having pc.condition_description = 'Normal pregnancy'
order by no_of_pregnancies desc;

#The name of patients with the most number of conditions
select p.first, p.last, count(*) as no_of_conditions
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by first, last
order by no_of_conditions desc
limit 10;

#The patients with the least number of conditions
select p.first, p.last, count(*) as no_of_conditions
from patients p inner join patient_condition pc
on p.patient = pc.patient
group by first, last
order by no_of_conditions 
limit 10;