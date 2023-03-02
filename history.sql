/* for create new db run this query */

CREATE DATABASE my_db DEFAULT CHARACTER SET = 'utf8mb4';

/* for select db use this query */

USE my_db;

/* for create  new table use this query*/

CREATE TABLE
    `users`(
        `id` int NOT NULL,
        `first_name` varchar(255),
        `last_name` varchar(255),
        `age` int
    );

/* for create table with CONSTRAINT*/

CREATE TABLE
    `users`(
        `id` int NOT NULL,
        `first_name` varchar(255),
        `last_name` varchar(255),
        `age` int,
        constraint CHK_users CHECK(age >= 18)
    );

/* query for drop a show fields of specific table */

SHOW CREATE TABLE `users`;

/* query for drop a CONSTRAINT */

ALTER TABLE `users` DROP CONSTRAINT `CHK_users`;

/* query for drop ADD new CONSTRAINT to each field of TABLE */

ALTER TABLE `users` ADD CONSTRAINT CHK_user CHECK(age>=18);

/* query for CREATE new TABLE with DEFAULT value */

CREATE TABLE
    `users`(
        `id` int NOT NULL,
        `first_name` varchar(255),
        `last_name` varchar(255),
        `age` int,
        `city` varchar(255) DEFAULT 'Isfahan'
    );

/* query for SET DEFAULT value to each field of table */

ALTER TABLE `users` ALTER `age` SET DEFAULT '10';

/

/*MODIFY is to edit COLUMN of table*/

ALTER TABLE `users` MODIFY `city` VARCHAR(120);

/*for ADD new COLUMN to TABLE*/

ALTER TABLE users ADD COLUMN `city` VARCHAR(255);

/*for DROP COLUMN of table*/

ALTER TABLE `users` DROP COLUMN `email`;

/*use COLUMNs ADD UNIQUE() to make a COLUMN as Uniqe data*/

ALTER TABLE `users` ADD UNIQU(email);

/*can use UNIQUE inside create Table but it should be end of all fieldes*/

CREATE Table `cars`( `id` INT NOT NULL, UNIQUE(id) );

/* add PRIMARY KEY to COLUMN of TABLE */

ALTER TABLE `users` ADD CONSTRAINT PK_users PRIMARY KEY (id);

/* add PRIMARY KEY and FOREIGN KEY inside CREATE TABLE */

CREATE TABLE
    cars(
        `id` int NOT NULL AUTO_INCREMENT,
        `car_name` VARCHAR(255),
        `user_id` int,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES users(id)
    );

/*
 **********************************************************************
 ***                                                                ***
 ***                      W3School Examples                         ***
 ***                                                                ***
 **********************************************************************
 */

/*(Example From W3School DB) add INDEX to each column of table (index use form dataes we search on theme many time )*/

CREATE INDEX idx_country ON customers(Country);

/*(Example From W3School DB) for delete index of a COLUMN in TABLE*/

ALTER TABLE customers DROP INDEX idx_country;

/*(Example From W3School DB) add INDEX when create new table*/

CREATE TABLE
    `cars`(
        `id` int,
        `name` varchar(255),
        INDEX(id, name)
    );

/*(start CRUD) for show all data of any colum of table example: show all `ProductName`*/

SELECT `ProductName` FROM products;

SELECT `Country` FROM customers;

/*show two columns of data in products*/

SELECT `ProductName` , `Price` FROM products;

/*show all data of table*/

SELECT * FROM products;

/*DISTINCT don't show duplicated of data in each field*/

SELECT DISTINCT `Country` FROM customers ;

/*WHERE define Condition for show dataes Contains of this condition*/

SELECT * FROM customers WHERE `Country`='Germany';

SELECT * FROM customers WHERE `CustomerID`>20;

/********************  Methods  *******************/

SELECT MAX(`Price`) FROM products;

SELECT MIN(`Price`) FROM products;

SELECT COUNT(`CustomerID`) FROM customers;

SELECT AVG(`Price`) FROM products;

SELECT SUM(`Quantity`) FROM order_details;

SELECT * FROM products WHERE `Price` IN(81,55,53);

SELECT * FROM customers WHERE `Country` IN('Germany','USA','Brazil');

SELECT * FROM products WHERE `Price` BETWEEN 50 AND 80;

SELECT *
FROM products
WHERE
    `Price` BETWEEN 50 AND 100
    AND `ProductID` NOT IN(10, 20, 30);

SELECT *
FROM products
WHERE
    `Price` BETWEEN 50 AND 100
    AND `ProductID` NOT IN(10, 20, 30)
ORDER BY `ProductName` DESC;

SELECT `ProductID` AS id FROM products;

SELECT `ProductID` AS `id` ,`ProductName` AS `name` FROM products;