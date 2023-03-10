CREATE DATABASE ss12_user;
USE ss12_user;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) 
values	('Minh','minh@codegym.vn','Viet Nam'), 
		('Kante','kante@che.uk','Kenia');