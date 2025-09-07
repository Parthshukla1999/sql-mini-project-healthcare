==============================
4. QUERIES 
==============================

1. see all records first in each table 

select * from patients
select * from doctors
select * from appointment
select * from payments

2. List top 5 most expensive appointments.
select * from appointment order by bill_amount desc limit 5

3. Show patients older than 50 with upcoming appointments.
SELECT CURRENT_DATE;   to check the current date 

using sub query out if the data is large that time it will take to much time for that we can use joins for query optimizaiton

select * from patients where age >50 and patient_id in  (select patient_details from appointment where apt_date >= current_date)

using joins for this same query 
select p.* from patients as p
join appointment as a
on p.patient_id = a.patient_details 
where p.age>50 and a.apt_date >= current_date

4. Count how many appointments each doctor handled.
select count(doctor_details) as doc_appointments, doctor_details from appointment
group by doctor_details
order by doctor_details 

5. Find doctors with avg bill_amount > 2000.
select avg(bill_amount) as avg_bill_amount , doctor_details from appointment
group by doctor_details
having avg(bill_amount)>2000
order by doctor_details

6. Get patient names with their doctor’s department.
	select p.first_name, p.last_name , d.department from appointment as a join patients as p
	on a.patient_details = p.patient_id
	join doctors as d
	on a.doctor_details = d.doctor_id

7. Find patients who don’t have any appointments

select p.* from patients as p left join appointment as a on p.patient_id = a.patient_details  where a.apt_id is null

8 . Show each doctor’s patients and their total billings.
	select p.first_name, d.doctor_name, sum(a.bill_amount)as total_bill from appointment as a join patients as p
	on a.patient_details = p.patient_id
	join doctors as d
	on a.doctor_details = d.doctor_id
	group by p.first_name , d.doctor_name
	order by d.doctor_name

or
	
	select sum(bill_amount),doctor_name,first_name from (select p.*, d.*, a.* from appointment as a join patients as p
	on a.patient_details = p.patient_id
	join doctors as d
	on a.doctor_details = d.doctor_id) as club_table
	group by doctor_name, first_name
	order by doctor_name


9. Which department generated the most revenue?

select  d.department, sum(a.bill_amount) as total_revenue from doctors as d left Join appointment as a 
on a.doctor_details = d.doctor_id
group by d.department
order by total_revenue

10. Find patients who spent more than the average bill_amount. (using subquery)
select patient_details,
(SELECT first_name FROM patients p WHERE p.patient_id = a.patient_details) AS patient_name,
sum(bill_amount) AS total_spent
from appointment a
group by patient_details
having sum(bill_amount) >(select avg(bill_amount) from appointment) 
