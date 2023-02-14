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