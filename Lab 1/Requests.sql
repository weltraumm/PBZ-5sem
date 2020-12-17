/*****************TASK 1*****************/

/*1.1*/ SELECT * FROM teachers;

/*1.2*/ SELECT * FROM students_group WHERE speciality='ЭВМ';

/*1.3*/ SELECT teacher_id, clASsroom_id FROM teacher_teaches_subjects_in_groups WHERE subject_id='18П';

/*1.4*/ SELECT DISTINCT teacher_teaches_subjects_in_groups.subject_id,    subjects.subject_name 
FROM teacher_teaches_subjects_in_groups 
JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
JOIN subjects ON subjects.id=teacher_teaches_subjects_in_groups.subject_id
WHERE teachers.surname='Костин';

/*1.5*/ SELECT group_id FROM teacher_teaches_subjects_in_groups
JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
WHERE surname='Фролов';

/*1.6*/ SELECT * FROM subjects WHERE speciality='АСОИ';

/*1.7*/ SELECT * FROM teachers WHERE speciality LIKE 'АСОИ%';

/*1.8*/ SELECT DISTINCT surname FROM teachers JOIN teacher_teaches_subjects_in_groups ON id=teacher_id
WHERE clASsroom_id=210;

/*1.9*/ SELECT DISTINCT subjects.subject_name, students_group.group_name FROM subjects 
JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.subject_id=subjects.id
JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
WHERE clASsroom_id BETWEEN 100 AND 200;

/*1.10*/ SELECT DISTINCT s1.id AS '1' , s2.id AS '2'
FROM students_group AS s1 JOIN students_group AS s2 
ON s1.id != s2.id WHERE
 (s1.speciality  = s2.speciality AND s1.id  < s2.id);

/*1.11*/ SELECT  sum(number_of_people) FROM students_group WHERE speciality='ЭВМ';

/*1.12*/ SELECT  id FROM teachers WHERE speciality LIKE '%ЭВМ';

/*1.20*/ SELECT DISTINCT  teacher_id FROM teacher_teaches_subjects_in_groups 
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE teachers.department='ЭВМ' AND students_group.speciality= ANY (SELECT teachers.speciality FROM teachers);

/*1.14*/ SELECT DISTINCT surname FROM teachers
JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.teacher_id=teachers.id
WHERE subject_id in (SELECT DISTINCT id FROM subjects
JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.subject_id=subjects.id
WHERE teacher_id= (SELECT DISTINCT teacher_id FROM teacher_teaches_subjects_in_groups WHERE subject_id='14п')
);

/*1.15*/ SELECT DISTINCT * FROM subjects
WHERE subjects.id  not in( SELECT DISTINCT subject_id FROM teacher_teaches_subjects_in_groups 
WHERE teacher_id='221Л') ;

/*1.16*/ SELECT DISTINCT * FROM subjects 
    WHERE subjects.id not in (SELECT DISTINCT teacher_teaches_subjects_in_groups.subject_id FROM teacher_teaches_subjects_in_groups 
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id 
    WHERE students_group.group_name='М-6');

/*1.17*/ SELECT DISTINCT * FROM teachers
    JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.teacher_id=teachers.id
    WHERE (teachers.positiON='Доцент' AND teacher_teaches_subjects_in_groups.group_id in ('3Г','8Г'));

/*1.18*/ SELECT DISTINCT subject_id, teacher_id, group_id FROM teacher_teaches_subjects_in_groups 
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    WHERE (teachers.department='ЭВМ' AND teachers.speciality LIKE 'АСОИ%');

/*1.19*/ SELECT DISTINCT  group_id FROM teacher_teaches_subjects_in_groups 
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE students_group.speciality= ANY (SELECT teachers.speciality FROM teachers);

/*1.20*/ SELECT DISTINCT  teacher_id FROM teacher_teaches_subjects_in_groups 
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE teachers.department='ЭВМ' AND students_group.speciality= ANY (SELECT teachers.speciality FROM teachers);

/*1.21*/ SELECT DISTINCT students_group.speciality FROM students_group
    JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.group_id=students_group.id
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    WHERE teachers.department='АСУ';

/*1.22*/ SELECT DISTINCT subject_id FROM teacher_teaches_subjects_in_groups
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE students_group.group_name='АС-8';

/*1.23*/ SELECT DISTINCT group_id FROM teacher_teaches_subjects_in_groups
    WHERE subject_id  IN (SELECT DISTINCT subject_id FROM teacher_teaches_subjects_in_groups
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE students_group.group_name='АС-8');

/*1.24*/ SELECT DISTINCT group_id FROM teacher_teaches_subjects_in_groups
    WHERE subject_id NOT IN (SELECT DISTINCT subject_id FROM teacher_teaches_subjects_in_groups
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE students_group.group_name='АС-8');
/*1.25*/ SELECT DISTINCT group_id 
FROM teacher_teaches_subjects_in_groups WHERE subject_id NOT IN(SELECT DISTINCT  subject_id
FROM teacher_teaches_subjects_in_groups WHERE teacher_id = '430Л');

/*1.26*/ SELECT DISTINCT teacher_id FROM teacher_teaches_subjects_in_groups
WHERE subject_id != '12П' AND group_id = (SELECT DISTINCT id FROM students_group WHERE group_name='Э-15');

/*****************TASK 2*****************/

/*26*/
SELECT DISTINCT project_id FROM detail_number WHERE
(SELECT MAX(s) FROM detail_number WHERE project_id = 'ПР1') < (SELECT AVG(s) FROM detail_number WHERE detail_id = 'Д1');

/*17*/
SELECT DISTINCT sum(detail_number.s) AS count, detail_number.supplier_id, detail_number.detail_id 
FROM detail_number GROUP BY detail_number.supplier_id, detail_number.detail_id ;

/*25*/
SELECT id_pj
FROM project
ORDER BY city ASC
LIMIT 1;

/*8*/
SELECT DISTINCT id_pj FROM project
WHERE project.city='Минск';

/*4*/
SELECT
*FROM detail_number
WHERE s BETWEEN 300 AND 750;

/*7*/
SELECT DISTINCT supplier_id, detail_id, project_id FROM detail_number
JOIN supplier ON supplier.id_sup=detail_number.supplier_id
JOIN project ON project.id_pj=detail_number.detail_id
JOIN detail ON detail.id_det=detail_number.project_id
WHERE supplier.city!=project.city AND supplier.city!=detail.city AND project.city!=detail.city;

/*11*/
SELECT DISTINCT supplier.city, project.city FROM detail_number
JOIN supplier ON detail_number.supplier_id = supplier.id_sup
JOIN project ON detail_number.project_id = project.id_pj
ORDER BY supplier.city;

/*36*/
SELECT DISTINCT s1.supplier_id AS 'Px' , s2.supplier_id AS 'Py'
FROM detail_number AS s1 JOIN detail_number AS s2 
ON s1.supplier_id != s2.supplier_id WHERE
 (s1.detail_id  = s2.detail_id AND s1.s  = s2.s AND s1.supplier_id < s2.supplier_id);

/*16*/
SELECT SUM(S) FROM detail_number
WHERE detail_id = 'Д1' AND supplier_id = 'П1';

/*30*/
SELECT detail_id FROM detail_number
JOIN project ON detail_number.project_id = project.id_pj
WHERE project.city = 'Лондон';