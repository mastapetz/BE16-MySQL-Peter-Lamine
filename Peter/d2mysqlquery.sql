-- D1 Ex1
-- line 3 GUI generated
CREATE TABLE `d2_library`.`author` (`author_id` INT NOT NULL AUTO_INCREMENT , `f_Name` VARCHAR(50) NOT NULL , `l_Name` VARCHAR(50) NOT NULL , PRIMARY KEY (`author_id`)) ENGINE = InnoDB;
--line 5 SQL generated
CREATE TABLE book ( book_id int PRIMARY KEY AUTO_INCREMENT, title varchar(100) not null, topic varchar(50) null, price int null, publisher varchar(50) not null, chapter int, buy_date date null, finished boolean, time_finished date null, fk_author_id int, FOREIGN KEY(fk_author_id) REFERENCES author(author_id) );
CREATE TABLE library ( library_id int PRIMARY KEY AUTO_INCREMENT, title varchar(100) not null, location varchar(100) not null, topic varchar(50) null, fk_book_id int, FOREIGN KEY(fk_book_id) REFERENCES book (book_id) );
-- SQL generated insert
INSERT INTO `author`(`f_Name`, `l_Name`) VALUES ('Dan','Abbenet'),('Steven','King'),('Dan','Brown');
INSERT INTO `book`(`title`, `topic`, `price`, `publisher`, `chapter`, `buy_date`, `finished`, `time_finished`, `fk_author_id`) VALUES ('Galaxy In Flames','Eternal War','15','black library','24','2016-09-07','1','2016-09-12','1'),('The Horus Heresy','Eternal War','21','black library','38','2017-09-07','1','2017-09-12','1'),('Carrie','Horror','9','Springer','10', null,'0', null,'2'); 
​INSERT INTO `home_library`(`title`, `location`, `topic`, `fk_book_id`) VALUES ('Carrie','Shelf 1','Horror','3'), ('Galaxy In Flames','Shelf 2','Eternal War','1'), ('The Horus Heresy','Shelf 2','Eternal War','1'); 
--ex6 airports
CREATE DATABASE d2_flight CHARACTER SET 'UTF8';
CREATE TABLE plane( plane_reg_NR int PRIMARY KEY, plane_model varchar(10) not null, plane_manufacturer varchar(20) not null, plane_capacity int not null, plane_range_hours int not null, plane_flight_date date null ); 
CREATE TABLE flight( flight_ID int PRIMARY KEY, fk_plane_reg_NR int, flight_origin varchar(30)not null, flight_destination varchar(30)not null, FOREIGN KEY(fk_plane_reg_NR) REFERENCES plane(plane_reg_NR) ); 
CREATE TABLE airport( airport_code varchar(5) PRIMARY KEY, fk_flight_ID int, airport_city varchar(30)not null, airport_country varchar(30)not null, FOREIGN KEY(fk_flight_ID) REFERENCES flight(flight_ID) ); 
--changes 1
    ALTER TABLE `airport` DROP PRIMARY KEY, ADD PRIMARY KEY(`airport_code`);
    ALTER TABLE `airport` ADD `airport_ID` INT NOT NULL AFTER `airport_country`;
    ALTER TABLE `airport` DROP PRIMARY KEY, ADD PRIMARY KEY(`airport_ID`);
    Expand Requery Edit Bookmark Database : d2_flight Queried time : 13:47:55
    ALTER TABLE `airport` ADD UNIQUE(`airport_code`);
--changes 2
    ALTER TABLE `flight` ADD `fk_airport_ID` INT NOT NULL AFTER `flight_ID`; 
    ALTER TABLE flight ADD FOREIGN KEY(fk_airport_ID) REFERENCES airport(airport_ID); 
--data
INSERT INTO `airport`(`airport_code`, `airport_city`, `airport_country`) VALUES ('CDG','Paris','France'), ('VIE','Vienna','Austria'), ('SZG','Salzburg','Austria'), ('INN','Innsbruck','Austria'), ('GRZ','Graz','Austria'), ('ZRH','Zurich','Switzerland'),
('FRA','Frankfurt','Germany'), ('SIN','Singapore','Singapore'), ('BCN','Barcelona','Spain')
--data 2
INSERT INTO `plane`(`plane_model`, `plane_manufacturer`, `plane_capacity`, `plane_range_hours`, `plane_flight_date`) VALUES ('747','Boeing','240','15',null);
--plane_reg_NR not set to A_I
INSERT INTO `plane`(`plane_reg_NR`, `plane_model`, `plane_manufacturer`, `plane_capacity`, `plane_range_hours`, `plane_flight_date`) VALUES ('4240','A380','Airbus','420','19',null)
--changes 3 with GUI
    UPDATE `plane` SET `plane_reg_NR` = '3230' WHERE `plane`.`plane_reg_NR` = 0; 
--data 3
INSERT INTO `flight`(`fk_airport_ID`, `fk_plane_reg_NR`, `flight_origin`, `flight_destination`) VALUES ('1','4240','Paris CDG','Singapore SIN'), ('2','4250','Vienna VIE','Zurich ZRH'),('8','4240','Singapore SIN', 'Paris CDG'); 