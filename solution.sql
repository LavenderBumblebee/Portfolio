/* SQL Murder Mystery Solution
Author: Anthony Tran
Description: Investigating a murder in SQL City on Jan 15, 2018.
*/

-- STEP 1: Find the crime scene report
SELECT * FROM crime_scene_report 
WHERE date = 20180115 AND type = 'murder' AND city = 'SQL City';

-- STEP 2: Find the two witnesses mentioned in the report
-- Witness 1: Lives at the last house on Northwestern Dr
SELECT * FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1;

-- Witness 2: Named Annabel, lives on Franklin Ave
SELECT * FROM person 
WHERE name LIKE 'Annabel%' AND address_street_name = 'Franklin Ave';

-- STEP 3: View the interview transcripts of the witnesses
SELECT * FROM interview 
WHERE person_id IN (14887, 16371);

-- STEP 4: The Final Join to find the killer (Jeremy Bowers)
SELECT p.name, p.id, d.plate_number, f.membership_status
FROM person p
JOIN drivers_license d ON p.license_id = d.id
JOIN get_fit_now_member f ON p.id = f.person_id
JOIN get_fit_now_check_in c ON f.id = c.membership_id
WHERE c.check_in_date = 20180109 
  AND f.membership_status = 'gold'
  AND d.plate_number LIKE '%H42W%';
