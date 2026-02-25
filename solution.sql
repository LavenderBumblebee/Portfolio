.headers on
.mode column
/* SQL Murder Mystery Solution
Author: Anthony Tran
Description: Investigating a murder in SQL City on Jan 15, 2018.
*/

-- STEP 1: Find the crime scene report of the murder, utilizing the city, type of crime, and date in the crime_scene_report table to filter the correct report 

SELECT * FROM crime_scene_report 
WHERE date = 20180115 AND type = 'murder' AND city = 'SQL City';

-- STEP 2: Identify the two witnesses mentioned in the report by referencing their personal information gathered from the crime scene report through querying the person's table. 
-- Witness 1: Lives at the last house on Northwestern Dr (Filter for the highest address number on Northwestern Dr to identify the resident of the final house)

SELECT id,name FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1;

-- Witness 2: Named Annabel, lives on Franklin Ave (Used LIKE function in conjunction with address_street_name to single out the second witness)

SELECT id,name FROM person 
WHERE name LIKE 'Annabel%' AND address_street_name = 'Franklin Ave';

-- STEP 3: Retrieve interview transcripts using subqueries to dynamically pull person_id based on witness leads, ensuring the script remains functional if IDs in the person table change

SELECT * FROM interview 
WHERE person_id IN ((SELECT id  FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1),
(SELECT id FROM person 
WHERE name LIKE 'Annabel%' AND address_street_name = 'Franklin Ave'));

/* STEP 4: Join tables to cross reference relative Primary Keys and Foreign keys from the person, driver's license, get_fit_now_member, and get_fit_now_check_in tables to use all the evidence gathered to
identify the culprit*/

SELECT p.name,d.eye_color,d.hair_color, p.id, d.plate_number, f.membership_status
FROM person p
JOIN drivers_license d ON p.license_id = d.id
JOIN get_fit_now_member f ON p.id = f.person_id
JOIN get_fit_now_check_in c ON f.id = c.membership_id
WHERE c.check_in_date = 20180109 
  AND f.membership_status = 'gold'
  AND d.plate_number LIKE '%H42W%';
