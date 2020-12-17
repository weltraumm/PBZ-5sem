CREATE DATABASE PBZ_lab1;
use PBZ_lab1;

/*****************TASK 1*****************/

CREATE TABLE teachers (
  id varchar(10) NOT NULL,
  surname varchar(30) DEFAULT NULL,
  position varchar(50) DEFAULT NULL,
  department  varchar(50) DEFAULT NULL,
  speciality varchar(50) DEFAULT NULL,
  phone_number int DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE subjects (
  id varchar(5) NOT NULL,
  subject_name varchar(20) DEFAULT NULL,
  hours int DEFAULT NULL,
  speciality varchar(20) DEFAULT NULL,
  semester int DEFAULT NULL,
  PRIMARY KEY (id)
) ;

CREATE TABLE students_group (
  id varchar(5) NOT NULL,
  group_name varchar(10) DEFAULT NULL,
  number_of_people int DEFAULT NULL,
  speciality varchar(30) DEFAULT NULL,
  headman_surname varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
  ) ;

CREATE TABLE teacher_teaches_subjects_in_groups (
  group_id varchar(5) DEFAULT NULL,
  subject_id varchar(5) DEFAULT NULL,
  teacher_id varchar(6) DEFAULT NULL,
  classroom_id int DEFAULT NULL,
  KEY group_id (group_id), 
  KEY subject_id (subject_id),
  KEY teacher_id (teacher_id),
  CONSTRAINT teacher_teaches_subjects_in_groups_ibfk_1 FOREIGN KEY (group_id) REFERENCES students_group (id),
  CONSTRAINT teacher_teaches_subjects_in_groups_ibfk_2 FOREIGN KEY (subject_id) REFERENCES subjects (id),
  CONSTRAINT teacher_teaches_subjects_in_groups_ibfk_3 FOREIGN KEY (teacher_id) REFERENCES teachers (id)
) ;

insert into teachers (id, surname, position, department, speciality, phone_number) VALUES
('221Л','Фролов','Доцент', 'ЭВМ' ,'АСОИ,ЭВМ',487),
('222Л','Костин','Доцент', 'ЭВМ' ,'ЭВМ',543),
('225Л','Бойко','Профессор', 'АСУ' ,'АСОИ,ЭВМ',112),
('430Л','Глазов','Ассистент', 'ТФ' ,'СД',421),
('110Л','Петров','Ассистент', 'Экономики' ,'Международная экономика',324);

INSERT INTO subjects (id,subject_name,hours,speciality,semester) VALUES
('12П','Мини ЭВМ',36,'ЭВМ',1),
('14П','ПЭВМ',72,'ЭВМ',2),
('17П','СУБД ПК',48,'АСОИ',4),
('18П','ВКСС',52,'АСОИ',6),
('34П','Физика',30,'СД',6),
('22П','Аудит',24,'Бухучета',3);

INSERT INTO students_group (id, group_name, number_of_people, speciality, headman_surname) VALUES
('8Г','Э-12',18,'ЭВМ','Иванова'),
('7Г','Э-15',22,'ЭВМ','Сеткин'),
('4Г','АС-9',24,'АСОИ','Балабанов'),
('3Г','АС-8',20,'АСОИ','Чижов'),
('17Г','С-14',29,'СД','Амросов'),
('12Г','М-6',16,'Междунарожная экономика','Трубин'),
('10Г','Б-4',21,'Бухучет','Зязюткин');

insert into teacher_teaches_subjects_in_groups(group_id,subject_id,teacher_id,classroom_id) values
('8Г','12П','222Л',112),
('8Г','14П','221Л',220),
('8Г','17П','222Л',112),
('7Г','14П','221Л',220),
('7Г','17П','222Л',241),
('7Г','18П','225Л',210),
('4Г','12П','222Л',112),
('4Г','18П','225Л',210),
('3Г','12П','222Л',112),
('3Г','17П','221Л',241),
('3Г','18П','225Л',210),
('17Г','12П','222Л',112),
('17Г','22П','110Л',220),
('17Г','34П','430Л',118),
('12Г','12П','222Л',112),
('12Г','22П','110Л',210),
('10Г','12П','222Л',210),
('10Г','22П','110Л',210);

/*****************TASK 2*****************/

CREATE TABLE supplier (
    id_sup     VARCHAR(3)  PRIMARY KEY,
    name   VARCHAR(30)  NOT NULL,
    status INT     NOT NULL,
    city   VARCHAR(60) NOT NULL
);

CREATE TABLE detail (
    id_det    VARCHAR(3) PRIMARY KEY,
    name  VARCHAR(30) NOT NULL,
    colour VARCHAR(30) NOT NULL,
    size  INT    NOT NULL,
    city  VARCHAR(60) NOT NULL
);

CREATE TABLE project (
    id_pj   VARCHAR(4) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    city VARCHAR(60) NOT NULL
);

CREATE TABLE detail_number (
    supplier_id VARCHAR(64) NOT NULL,
    detail_id   VARCHAR(64) NOT NULL,
    project_id  VARCHAR(64) NOT NULL,
    s    INT      NOT NULL
   );

INSERT INTO supplier(id_sup, name, status, city) VALUES 
('П1', 'Петров', 20, 'Москва'),
('П2', 'Синицын', 10, 'Таллин'),
('П3', 'Федоров', 30, 'Таллин'),
('П4', 'Чаянов', 20, 'Минск'),
('П5', 'Крюков', 30, 'Киев');

INSERT INTO detail(id_det, name, colour, size, city) VALUES 
('Д1', 'Болт', 'Красный', 12, 'Москва'),
('Д2', 'Гайка', 'Зеленая', 17, 'Минск'),
('Д3', 'Диск', 'Черный', 17, 'Вильнюс'),
('Д4', 'Диск', 'Черный', 14, 'Москва'),
('Д5', 'Корпус', 'Красный', 12, 'Минск'),
('Д6', 'Крышки', 'Красный', 19, 'Москва');

INSERT INTO project(id_pj, name, city) VALUES 
('ПР1', 'ИПР1', 'Минск'),
('ПР2', 'ИПР2', 'Таллин'),
('ПР3', 'ИПР3', 'Псков'),
('ПР4', 'ИПР4', 'Псков'),
('ПР5', 'ИПР5', 'Москва'),
('ПР6', 'ИПР6', 'Саратов'),
('ПР7', 'ИПР7', 'Москва');

INSERT INTO detail_number(supplier_id, detail_id, project_id,s) VALUES 
('П1', 'Д1', 'ПР1', 200),
('П1', 'Д1', 'ПР2', 700),
('П2', 'Д3', 'ПР1', 400),
('П2', 'Д2', 'ПР2', 200),
('П2', 'Д3', 'ПР3', 200),
('П2', 'Д3', 'ПР4', 500),
('П2', 'Д3', 'ПР5', 600),
('П2', 'Д3', 'ПР6', 400),
('П2', 'Д3', 'ПР7', 800),
('П2', 'Д5', 'ПР2', 100),
('П3', 'Д3', 'ПР1', 200),
('П3', 'Д4', 'ПР2', 500),
('П4', 'Д6', 'ПР3', 300),
('П4', 'Д6', 'ПР7', 300),
('П5', 'Д2', 'ПР2', 200),
('П5', 'Д2', 'ПР4', 100),
('П5', 'Д5', 'ПР5', 500),
('П5', 'Д5', 'ПР7', 100),
('П5', 'Д6', 'ПР2', 200),
('П5', 'Д1', 'ПР2', 100),
('П5', 'Д3', 'ПР4', 200),
('П5', 'Д4', 'ПР4', 800),
('П5', 'Д5', 'ПР4', 400),
('П5', 'Д6', 'ПР4', 500);