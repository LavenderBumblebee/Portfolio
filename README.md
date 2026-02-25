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
<p align="center"> I filtered on the crime_scene_report table for Jan 15, 2018 in SQL City. I found two witnesses gathered from the description column of the crime_scene_report: 
  one on Northwestern Dr and one named Annabel on Franklin Ave. </p>
<br>
<p align="center"><img width="832" height="126" alt="screen1" src="https://github.com/user-attachments/assets/b22849ce-ed9e-4080-96df-a2cc51649e09" />
  </p>


<h3 align ="center"> 2. Witness Testimony: </h3>
<p align="center"> After gathering the description of the crime_scene_report for the murder on Jan 15, 2018 in SQL City, I focused on identifying the two witnesses mentioned in the description. To identify the witnesses I queried the information gathered from the description against the person table to filter out and identify the witnesses from the report: </p>
<p align="center">          <img width="193" height="87" alt="screen2" src="https://github.com/user-attachments/assets/28cf3677-a090-44e7-bdd0-4a1c8b5aa8ea" />
             </p>
<br>


<p align="center">    <img width="190" height="85" alt="screen3" src="https://github.com/user-attachments/assets/71b18694-1e09-4fed-b9c6-5188dbdf1c59" />
             </p>

<br>
<h3 align ="center" >3. Retrieving Interview Transcripts: </h3>
<p align="center"> After acquiring the id of the two witnesses. I can use that identifying information to locate their transcripts relative to their person_id on the interview table </p>


<p align="center">   <img width="827" height="178" alt="screen4" src="https://github.com/user-attachments/assets/610a87a2-9d8c-4762-ba7e-ff38e93240c4" />
      </p>




<h3 align ="center"> 4. The Final Join </h3>
<p align="center"> After having read their transcripts I gathered crucial information that would need to be cross referenced with multiple tables within the police database. So, I executed a 4-way join to isolate the suspect matching all criteria gathered from the transcripts, using the relative information  from the person, driver's license, get_fit_now_member, and get_fit_now_check_in tables  </p>

<p align="center">  <img width="631" height="83" alt="screen5" src="https://github.com/user-attachments/assets/336d8e67-db71-46de-97a1-9e2e5d53efbd" />  </p>




