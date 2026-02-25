# SQL Murder Mystery Project

[SQL queries used to complete this project](solutions.sql)

**Project Objective:** 
A digital forensic investigation using SQL to identify a murderer from a city police database.
Starting off with utilizing only the following information: the crime was a ​**murder**​ that occurred sometime on ​**Jan.15, 2018​** and that it took place in **​SQL City**​

## Entity Relational Diagram of the Database: 
<img width="815" height="399" alt="schema" src="https://github.com/user-attachments/assets/ca161ebf-ec03-4ea7-8374-a431c07fcabb" />


**1. The Lead**: Filtered crime_scene_report for Jan 15, 2018 in SQL City.
  Result: Found two witnesses gathered from the description column of the crime_scene_report: 
  one on Northwestern Dr and one named Annabel on Franklin Ave.

<img width="760" height="77" alt="screen1" src="https://github.com/user-attachments/assets/f95d67fd-5cf2-4b1e-a570-f8b69532d6d3" />


**2. Witness Testimony**: 
After gathering that information I focus on identifying the two witnesses. I decide to query the person’s table to identify the witnesses using the information gathered: 
<img width="776" height="157" alt="screen2" src="https://github.com/user-attachments/assets/c7fd5cc6-83f1-41e5-a558-7bb1f635e652" />

And the second Witness: 

<img width="781" height="156" alt="screen3" src="https://github.com/user-attachments/assets/5ca2ae21-6684-4c0d-8f99-40a12255c2a0" />


**3. Retrieving Interview Transcripts**: 
Having recieved the personal ID's of the witnesses, I subquery the personal ID's on the interview table to gather the relative transcripts, and to ensure that the data being pulled will still be accurate regardless of whether the ID's change


<img width="778" height="266" alt="screen4" src="https://github.com/user-attachments/assets/bcf6e96b-a93d-48a8-bc24-a19f329902e6" />




**4. The Final Join**
I executed a 4-way join to isolate the suspect matching all criteria.

<img width="649" height="111" alt="screen5" src="https://github.com/user-attachments/assets/dbbbc242-d643-44e8-bda7-43be7d1de603" />



