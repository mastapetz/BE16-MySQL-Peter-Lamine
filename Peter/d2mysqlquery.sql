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