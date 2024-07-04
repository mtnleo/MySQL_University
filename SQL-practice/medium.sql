/*Show unique birth years from patients and order them by ascending.*/
SELECT DISTINCT(YEAR(birth_date)) as birth_year FROM patients
ORDER BY birth_date asc

/**Show unique first names from the patients table which only occurs once in the list.
For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.*/
SELECT first_name FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1

/*Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.*/
SELECT patient_id, first_name FROM patients
WHERE first_name LIKE 's%s' AND length(first_name) >= 6

/*Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
Primary diagnosis is stored in the admissions table.*/
SELECT patients.patient_id, first_name, last_name FROM patients
lEFT JOIN admissions
ON patients.patient_id = admissions.patient_id
WHERE diagnosis LIKE 'Dementia'

/*Display every patient's first_name.
Order the list by the length of each name and then by alphabetically.*/
SELECT first_name FROM patients
ORDER by LENGTH(first_name), first_name

/*Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.*/
SELECT (SELECT COUNT(*) AS male_count FROM patients WHERE gender = 'M') AS male_count, COUNT(gender) as female_count
FROM patients WHERE gender = 'F'

/*Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.*/
SELECT first_name, last_name, allergies FROM patients
WHERE allergies LIKE 'Penicillin' OR allergies LIKE 'Morphine'
ORDER by allergies ASC, first_name, last_name