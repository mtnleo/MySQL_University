/*Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'*/
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS null;

/*Show first name and last name concatinated into one column to show their full name.*/
SELECT CONCAT(first_name, " ", last_name) AS full_name FROM patients

/**/
