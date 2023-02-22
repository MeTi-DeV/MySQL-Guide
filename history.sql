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
/******************** CRUD *******************/
/****READ****/
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

/* operators in SQL AND NOT OR (it's most like programming languages like && ! ||)*/

SELECT *
FROM customers
WHERE
    `Country` = 'Germany'
    AND `City` = 'Berlin';

SELECT * FROM products WHERE `ProductName`='Chang' AND `Price`=19;

SELECT * FROM products WHERE `Price` = 18 OR `Price`=20 ;

SELECT * FROM products WHERE NOT `Price`=19 AND NOT `Price`=20 ;

SELECT * FROM products WHERE `Price`<>19 AND `Price`<>20 ;

/* multie usage from operators*/

SELECT *
FROM products
WHERE
    `ProductName` = 'Chang'
    AND(
        `Price` = 18
        OR `Price` = 19
    );

SELECT *
FROM customers
WHERE
    `Country` = 'Germany'
    AND (
        `City` = 'Stuttgart'
        OR `City` = 'Berlin'
    );

SELECT *
FROM customers
WHERE
    NOT `Country` = 'USA'
    AND NOT `Country` = 'Brazil';
/*for sorting data as ascending and descending use ORDER BY*/
SELECT * FROM customers ORDER BY `CustomerName` ;
/*ASC for ascending and its as default*/
/*ASC for ascending and its as default*/
SELECT * FROM products ORDER BY `Price` ASC ;
/*DESC for descending and for apply should write it*/
SELECT * FROM products ORDER BY `Price` DESC ;
/* also we can sorting data as several values just enough to write those*/
SELECT * FROM customers ORDER BY `Country` , `CustomerName`;
/* also ASC and DESC working for all of them*/
SELECT * FROM customers ORDER BY `Country` ASC, `CustomerName` DESC;
/********************Continue CRUD*******************/
/****CREATE****/
/*next step of CRUD is create new record to tabel*/
/* its start with INSERT INTO and after that we choose table that we decide to add new record.
after that open () and inside it we choose columns that should fill with data like `CategoryName` and `Description` in the following use VALUES key and inside () we define those dataes like 'Sports' and 'Sport Products'*/

INSERT INTO categories (`CategoryName` ,`Description`)VALUES('Sports' , 'Sport Products');
/****DELETE****/
/*for delete a record from table*/
/*💀💀!!!!!!!!!!!!!!!!!!!!!!!!!!   ATENTION   !!!!!!!!!!!!!!!!!!!!!!!!!!💀💀*/
/*its very important to choose which record will be deleted if you don't choose that and for example only run DELETE FROM categories it's will delete all records inside your table*/
/*it's better to delete records by something like `CategoryID` because it's as PRIMARY*/
DELETE FROM categories WHERE `CategoryID`=9;
/****UPDATE****/
/*for update a record from table*/
/*💀💀!!!!!!!!!!!!!!!!!!!!!!!!!!   ATENTION   !!!!!!!!!!!!!!!!!!!!!!!!!!💀💀*/
/*just like deleting in update we should choose which record will update and if don't do this , all records data will update */
UPDATE categories SET `CategoryName`='Cat-name' ,`Description`='Cat-desc' WHERE `CategoryID`=8;
/*IS operator*/
SELECT * FROM categories WHERE `Description` IS NULL;
SELECT * FROM categories WHERE `Description` IS NOT NULL;