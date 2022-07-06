--
ALTER TABLE `stop` DROP `fk_city_id`;
CREATE table city_stop ( fk_stop_id int not null, fk_city_id int not null );
CREATE TABLE city ( city_id int PRIMARY KEY AUTO_INCREMENT, city_name varchar(50) not null, stop_address varchar(100) not null, stop_phone_nr varchar(15) not null );
CREATE table route ( route_id int PRIMARY KEY AUTO_INCREMENT, fk_bus_id int, fk_city_id int, total_distance_km int, route_start varchar(50), route_destination varchar(50) );
create table bus( bus_id int PRIMARY KEY AUTO_INCREMENT, bus_model varchar(50), bus_capacity int, driver_fName varchar(50), driver_lName varchar(50) );

​alter table route add FOREIGN KEY(fk_bus_id) REFERENCES bus(bus_id);
alter table route add FOREIGN KEY(fk_city_id) REFERENCES city(city_id);

alter table city_stop ADD CONSTRAINT ck_city_stop PRIMARY KEY(fk_stop_id, fk_city_id); 

alter table city_stop add FOREIGN KEY(fk_stop_id) REFERENCES stop(stop_id); 
alter table city_stop add FOREIGN KEY(fk_city_id) REFERENCES city(city_id); 
-- fill bus per gui
INSERT INTO `bus` (`bus_id`, `bus_model`, `bus_capacity`, `driver_fName`, `driver_lName`) VALUES (NULL, 'Mercedes', '54', 'Tom', 'Cruise'); 
INSERT INTO `bus` (`bus_id`, `bus_model`, `bus_capacity`, `driver_fName`, `driver_lName`) VALUES (NULL, 'DoubleDecker', '160', 'Anton', 'Tirol'), (NULL, 'RustBucket', '35', 'Mac', 'Fly');
INSERT INTO `bus` (`bus_id`, `bus_model`, `bus_capacity`, `driver_fName`, `driver_lName`) VALUES (NULL, 'VW', '6', 'Wally', ''), (NULL, 'JellyFish', '24', 'Sponge', 'Bob'), (NULL, 'RockROck', '3', 'Patrick', 'Star');  
--fill city
INSERT INTO `city` (`city_id`, `city_name`, `stop_address`, `stop_phone_nr`) VALUES (NULL, 'Wien', 'Hauptbahnhof Steig A1', '+43123456789'), (NULL, 'Graz', 'Hauptbahnhof Steig A42', '+43125647924'); 
INSERT INTO `city` (`city_id`, `city_name`, `stop_address`, `stop_phone_nr`) VALUES (NULL, 'St Pölten', 'St Pölten Busbahnhof', '+43000000000'), (NULL, 'Linz', 'Busbahnhof Steig A12', '+4300000000'), (NULL, 'Salzburg', 'SBG Flughafen', '+43000000000'), (NULL, 'Innsbruck', 'INN Flughafen', '+4300000000'), (NULL, 'Kloten', 'ZRH International Airport', '+00000000000'), (NULL, 'Bern', 'BRN International Airport', '+0000000000'); 
--fill route
INSERT INTO `route` (`route_id`, `fk_bus_id`, `fk_city_id`, `total_distance_km`, `route_start`, `route_destination`) VALUES (NULL, '1', '1', NULL, 'Wien', 'Graz'); 
-- query
SELECT * FROM city WHERE city_name='Wien'; 
SELECT `city`.`city_name` , `route`.`route_start`, `route`.`route_destination` FROM `city` INNER JOIN `route` on fk_city_id = city_id; 
--new
CREATE table route ( route_id int PRIMARY KEY AUTO_INCREMENT, fk_bus_id int, total_distance_km int, fk_route_start_id int, fk_route_destination_id int ); 
--
create table bus( bus_id int PRIMARY KEY AUTO_INCREMENT, bus_model varchar(50), bus_capacity int, driver_fName varchar(50), driver_lName varchar(50) );

CREATE table route ( route_id int PRIMARY KEY AUTO_INCREMENT, fk_bus_id int, total_distance_km int, fk_route_start_id int, fk_route_destination_id int );
ALTER TABLE `city` ADD `city_phone_nr` VARCHAR(50) NOT NULL AFTER `city_name`;

ALTER TABLE `route` DROP `fk_route_start_id`;
ALTER TABLE `route` DROP `fk_route_destination_id`;
ALTER TABLE `route` ADD `fk_destination_id` INT NOT NULL AFTER `total_distance_km`, ADD `fk_start_id` INT NOT NULL AFTER `fk_destination_id`;
CREATE TABLE destination ( destination_id int not null PRIMARY KEY AUTO_INCREMENT, destination_name varchar(50) );
CREATE TABLE start ( start_id int not null PRIMARY KEY AUTO_INCREMENT, start_name varchar(50) );
ALTER TABLE route ADD FOREIGN KEY(fk_destination_id) REFERENCES destination(destination_id);
ALTER TABLE route ADD FOREIGN KEY(fk_start_id) REFERENCES start(start_id);
ALTER TABLE route ADD FOREIGN KEY(fk_bus_id) REFERENCES bus(bus_id);
ALTER TABLE `stop` ADD `stop_name` VARCHAR(50) NOT NULL AFTER `stop_id`;

ALTER TABLE `city` DROP `city_phone_nr`;
ALTER TABLE `city` ADD `fk_stop_id` INT NOT NULL AFTER `city_id`;
ALTER TABLE city ADD FOREIGN KEY(fk_stop_id) REFERENCES stop(stop_id);
ALTER TABLE city DROP fk_stop_id;

ALTER TABLE `stop` ADD `fk_city_id` INT NOT NULL AFTER `stop_id`;
ALTER TABLE stop ADD FOREIGN KEY(fk_city_id) REFERENCES city(city_id);
SELECT * FROM `route`
ALTER TABLE `route` ADD `fk_stop_id` INT NOT NULL AFTER `route_id`;
ALTER TABLE route ADD FOREIGN KEY(fk_stop_id) REFERENCES stop(stop_id);