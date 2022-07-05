-- D1 Ex1
-- line 3 GUI generated
CREATE TABLE `d2_library`.`author` (`author_id` INT NOT NULL AUTO_INCREMENT , `f_Name` VARCHAR(50) NOT NULL , `l_Name` VARCHAR(50) NOT NULL , PRIMARY KEY (`author_id`)) ENGINE = InnoDB;
--line 5 SQL generated
CREATE TABLE book ( book_id int PRIMARY KEY AUTO_INCREMENT, title varchar(100) not null, topic varchar(50) null, price int null, publisher varchar(50) not null, chapter int, buy_date date null, finished boolean, time_finished date null, fk_author_id int, FOREIGN KEY(fk_author_id) REFERENCES author(author_id) );
CREATE TABLE library ( library_id int PRIMARY KEY AUTO_INCREMENT, title varchar(100) not null, location varchar(100) not null, topic varchar(50) null, fk_book_id int, FOREIGN KEY(fk_book_id) REFERENCES book (book_id) );

​