/*
1. Selezionare tutti gli studenti nati nel 1990 (160)
2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
3. Selezionare tutti gli studenti che hanno più di 30 anni
4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286)
5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21)
6. Selezionare tutti i corsi di laurea magistrale (38)
7. Da quanti dipartimenti è composta l'università? (12)
8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
*/



--1
SELECT * FROM `students` WHERE YEAR(`date_of_birth`) = 1990;

--2
SELECT * FROM `courses` WHERE `cfu` > 10;

--3
SELECT * FROM `students` WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;

--4
SELECT * FROM `courses` WHERE `period` = "I semestre" AND `year` = 1; 

--5
SELECT * FROM `exams` WHERE `date` = "2020-06-20" AND HOUR(`hour`)> 14;

--6
SELECT * FROM `degrees` WHERE `level` = "magistrale";

--7
SELECT COUNT(id) AS `departments_count` FROM `departments`;

--8
SELECT COUNT(id) AS `teachers_without_phone` FROM `teachers` WHERE `phone` IS NULL;


/*
1. Contare quanti iscritti ci sono stati ogni anno
2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
3. Calcolare la media dei voti di ogni appello d'esame
4. Contare quanti corsi di laurea ci sono per ogni dipartimento
*/

--1
SELECT YEAR(`enrolment_date`) AS `year`, COUNT(id) AS `students_count` FROM `students` GROUP BY `year`;

--2
SELECT `office_address`, COUNT(id) FROM `teachers` GROUP BY `office_address`;

--3
SELECT AVG(`vote`) as `avg_vote`, `exam_id` FROM `exam_student` GROUP BY `exam_id`;

--4
SELECT COUNT(*) as `courses_count`, `department_id` FROM `degrees` GROUP BY `department_id`;