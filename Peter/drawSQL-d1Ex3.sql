--generated and exported with drawsql

CREATE TABLE `customer`(
    `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_Name` VARCHAR(255) NOT NULL,
    `first_Name` VARCHAR(255) NOT NULL,
    `last_Name` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `customer` ADD UNIQUE `customer_user_name_unique`(`user_Name`);
ALTER TABLE
    `customer` ADD UNIQUE `customer_email_unique`(`email`);
CREATE TABLE `auction`(
    `auction_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fk_customer_id` INT NOT NULL,
    `bid_amount` INT NOT NULL,
    `bid_date` DATE NOT NULL,
    `bid_time` TIMESTAMP NOT NULL,
    `fk_prod_set_id` INT NOT NULL
);
CREATE TABLE `product_set`(
    `prod_set_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fk_prod_id` INT NOT NULL,
    `start_price` INT NOT NULL,
    `time_remain` TIME NOT NULL
);
CREATE TABLE `product`(
    `prod_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `prod_code` INT NOT NULL,
    `prod_name` VARCHAR(255) NOT NULL,
    `prod_description` TEXT NOT NULL,
    `prod_image` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `auction` ADD CONSTRAINT `auction_fk_customer_id_foreign` FOREIGN KEY(`fk_customer_id`) REFERENCES `customer`(`customer_id`);
ALTER TABLE
    `product_set` ADD CONSTRAINT `product_set_fk_prod_id_foreign` FOREIGN KEY(`fk_prod_id`) REFERENCES `product`(`prod_id`);
ALTER TABLE
    `auction` ADD CONSTRAINT `auction_fk_prod_set_id_foreign` FOREIGN KEY(`fk_prod_set_id`) REFERENCES `product_set`(`prod_set_id`);