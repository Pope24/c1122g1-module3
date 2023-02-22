create database if not exists `student-management`;
CREATE TABLE `student` (
	id int,
    name varchar(255),
    age int,
    country varchar(255)
);
CREATE TABLE `class` (
	id int,
    name varchar(255)
);
CREATE TABLE `teacher` (
	id int,
    name varchar(255),
    age int,
    country varchar(255)
)