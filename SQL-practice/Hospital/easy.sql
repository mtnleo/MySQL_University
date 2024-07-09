/*Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'*/
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS null;

/*Show first name and last name concatinated into one column to show their full name.*/
SELECT CONCAT(first_name, " ", last_name) AS full_name FROM patients

/*Show first name, last name, and the full province name of each patient.*/
SELECT patients.first_name, patients.last_name, province_names.province_name FROM patients
LEFT JOIN province_names
ON patients.province_id = province_names.province_id;

/*Show how many patients have a birth_date with 2010 as the birth year.*/
SELECT count(patient_id) FROM patients
WHERE birth_date BETWEEN '2010-01-01' AND '2010-31-12'

/*Show the first_name, last_name, and height of the patient with the greatest height.*/
SELECT first_name, last_name, MAX(height) FROM patients

/*Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000*/
SELECT * FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000)

/*Show the total number of admissions*/
SELECT COUNT(*) FROM admissions

/*Show all the columns from admissions where the patient was admitted and discharged on the same day.*/
SELECT * FROM admissions
WHERE admission_date = discharge_date

/*Show the patient id and the total number of admissions for patient_id 579.*/
SELECT patient_id, COUNT(*) FROM admissions
where patient_id = 579

/*Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?*/
SELECT DISTINCT(city) FROM patients
WHERE province_id = 'NS'

/*Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70*/
SELECT first_name, last_name, birth_date FROM patients
WHERE height > 160 AND weight > 70

/*Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'*/
SELECT first_name, last_name, allergies FROM patients
WHERE allergies NOT null
AND city IS 'Hamilton'
