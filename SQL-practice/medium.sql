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

/*Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.*/
SELECT patient_id, diagnosis FROM admissions
group by diagnosis, patient_id
HAVING count(*) > 1

/*Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.*/
SELECT city, COUNT(*)
FROM patients
group by city
order by count(*) desc, city asc

/*Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor"*/
SELECT first_name, last_name, ('Patient') AS role
FROM patients
UNION ALL
SELECT first_name, last_name, ('Doctor') AS role
FROM doctors

/*Show all allergies ordered by popularity. Remove NULL values from query.*/
SELECT
  allergies,
  COUNT(*) AS total_diagnosis
FROM patients
WHERE
  allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_diagnosis DESC

/*Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.*/
SELECT
	first_name,
    last_name,
    birth_date
FROM
	patients
WHERE
	birth_date >= ('1970-01-01') AND	birth_date <= ('1979-12-31') 
ORDER BY
	birth_date ASC

/*We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane*/
SELECT
  CONCAT(UPPER(last_name),',',LOWER(first_name))
FROM patients
ORDER BY
	first_name DESC


/*Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.*/
SELECT
  province_id, SUM(height) AS sum_height
 FROM
 	patients
 group by province_id
 HAVING SUM(height) >= 7000

 /*Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'*/
 SELECT
  MAX (weight) - MIN(weight)
 from
 	patients
 WHERE
 	last_name LIKE 'Maroni'

  /*Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.*/
  SELECT DAY(admission_date), COUNT(admission_date) AS admission_count FROM admissions
  group by DAY(admission_date)
  order by admission_count DESC

/*Show all columns for patient_id 542's most recent admission_date.*/
SELECT * FROM admissions
WHERE patient_id = 542
ORDER BY admission_date DESC
LIMIT 1 

/*Show first_name, last_name, and the total number of admissions attended for each doctor.
Every admission has been attended by a doctor.*/
SELECT 
	first_name, last_name, COUNT(admissions.patient_id)
FROM doctors
JOIN admissions ON admissions.attending_doctor_id = doctors.doctor_id
GROUP BY doctor_id

/*For each doctor, display their id, full name, and the first and last admission date they attended.*/
SELECT 
	d.doctor_id, 
    concat(d.first_name, ' ', d.last_name) AS full_name,
    MIN(a.admission_date) AS first_admission,
    MAX(a.admission_date) AS last_admission
FROM admissions AS a 
JOIN doctors AS d 
ON d.doctor_id = a.attending_doctor_id
group by d.doctor_id