 <h1 align = "center">SQL Murder Mystery Project </h1>

<p align="center">
  <a href="https://github.com/LavenderBumblebee/Portfolio/blob/main/solution.sql">
    <b> The list of SQL queries I used to complete this project </b>
  </a>
</p>
<h2 align = "center"> Project Objective: </h2>
<br>

This is a digital forensic investigation using SQL to identify a murderer from a fictional city police database.
With only the following information- <br><br> "The crime was a ​**murder**​ that occurred sometime on ​**Jan.15, 2018​** and that it took place in **​SQL City**" <br><br> -I need to use SQL to find clues to help me identify the culprit of the crime​

<br>
<h2 align = "center"> Entity Relational Diagram of the Database: </h2>
<p align="center"> <img width="815" height="399" alt="schema" src="https://github.com/user-attachments/assets/ca161ebf-ec03-4ea7-8374-a431c07fcabb" /> </p>
<br> 

<h3 align ="center"> 1. The Lead: </h3>
<p align="center"> I filtered on the crime_scene_report table for a murder on Jan 15, 2018 in SQL City. I found two witnesses gathered from the description column of the crime_scene_report: 
  one on Northwestern Dr and one named Annabel on Franklin Ave. </p>
<br>
<p align="center"><img width="832" height="126" alt="screen1" src="https://github.com/user-attachments/assets/b22849ce-ed9e-4080-96df-a2cc51649e09" />
  </p>

  ```sql
SELECT * FROM crime_scene_report 
WHERE date = 20180115 AND type = 'murder' AND city = 'SQL City';

```


<h3 align ="center"> 2. Witness Testimony: </h3>
<p align="center"> Having gathered information from the description column of the crime_scene_report table for the murder on Jan 15, 2018 in SQL City, I query the info gathered from the description column on the person table to filter out and identify the witnesses from the report: </p>
<p align="center">          <img width="193" height="87" alt="screen2" src="https://github.com/user-attachments/assets/28cf3677-a090-44e7-bdd0-4a1c8b5aa8ea" />
             </p>
             
```sql           
SELECT id,name FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1;

```
<br>



<p align="center">    <img width="190" height="85" alt="screen3" src="https://github.com/user-attachments/assets/71b18694-1e09-4fed-b9c6-5188dbdf1c59" />
             </p>
             
```sql 
SELECT id,name FROM person 
WHERE name LIKE 'Annabel%' AND address_street_name = 'Franklin Ave';

```
<br>
<h3 align ="center" >3. Retrieving Interview Transcripts: </h3>
<p align="center"> After acquiring the id of the two witnesses. I can use that identifying information to locate their transcripts relative to their person_id on the interview table. I decide to subquery the transcripts to ensure that on the off chance the ID's within the database change, the information being pulled will still be valid </p>


<p align="center">   <img width="827" height="178" alt="screen4" src="https://github.com/user-attachments/assets/610a87a2-9d8c-4762-ba7e-ff38e93240c4" />
      </p>
      
```sql
SELECT * FROM interview 
WHERE person_id IN ((SELECT id  FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1),
(SELECT id FROM person 
WHERE name LIKE 'Annabel%' AND address_street_name = 'Franklin Ave'));

```

<h3 align ="center"> 4. The Final Join </h3>
<p align="center"> After having read their transcripts I gathered crucial information that would need to be cross referenced with multiple tables within the police database. So, I executed a 4-way join to isolate the suspect matching all criteria gathered from the transcripts, using the relative information  from the person, driver's license, get_fit_now_member, and get_fit_now_check_in tables  </p>

<p align="center">  <img width="631" height="83" alt="screen5" src="https://github.com/user-attachments/assets/336d8e67-db71-46de-97a1-9e2e5d53efbd" />  </p>

```sql
SELECT p.name,d.eye_color,d.hair_color, p.id, d.plate_number, f.membership_status
FROM person p
JOIN drivers_license d ON p.license_id = d.id
JOIN get_fit_now_member f ON p.id = f.person_id
JOIN get_fit_now_check_in c ON f.id = c.membership_id
WHERE c.check_in_date = 20180109 
  AND f.membership_status = 'gold'
  AND d.plate_number LIKE '%H42W%';
