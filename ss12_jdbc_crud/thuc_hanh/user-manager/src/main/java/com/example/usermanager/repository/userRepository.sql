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
        
-- Procedure get_user_by_id ----------------
DELIMITER $$
create procedure get_user_by_id(in user_id int) 
begin  
select * from ss12_user.users where id = user_id;
end$$
DELIMITER ;

-- Procedure insert_user -------------------
DELIMITER $$
create procedure insert_user(in user_name varchar(255), in user_email varchar(255), in user_country varchar(255))
begin
	insert into ss12_user.users(name, email, country)
	value (user_name, user_email, user_country);
end$$
DELIMITER ;

create table permision (
	id int(11) primary key,
    name varchar(50)
);
create table user_permision (
	permision_id int(11),
    user_id int(11)
);

insert into Permision(id, name) 
values(1, 'add'), (2, 'edit'), (3, 'delete'), (4, 'view');

-- Create procedure hien thi list user -------------------
DELIMITER $$
create procedure get_list_user()
begin
select * from users;
end$$
DELIMITER ;

-- Create procedure sua user -----------------------------
DELIMITER $$
create procedure edit_user(in user_id int, in user_name varchar(120), in user_email varchar(220), in user_country varchar(120))
begin
update users set name = user_name, email = user_email, country = user_country where id = user_id;
end$$
DELIMITER ; 

-- Create procedure xoa user -----------------------------
DELIMITER $$
create procedure delete_user(in user_id int)
begin 
delete from users where id = user_id;
end$$
DELIMITER ; 

