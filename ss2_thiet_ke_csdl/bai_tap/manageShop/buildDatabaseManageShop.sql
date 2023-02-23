create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer (
	c_id varchar(255) primary key,
    c_name varchar(255),
    c_age varchar(255)
);
create table order_product (
	o_id varchar(255) primary key,
    c_id varchar(255),
    o_date date,
    o_total_price double,
    foreign key(c_id) references customer(c_id)
);
create table product (
	p_id varchar(255) primary key,
    p_name varchar(255),
    p_price double
);
create table order_detail(
	o_id varchar(255),
    p_id varchar(255),
    order_quantity int,
    
    primary key(o_id, p_id),
    foreign key(o_id) references order_product(o_id),
    foreign key(p_id) references product(p_id)
);
alter table customer
modify column c_age int;
insert into customer(c_id, c_name, c_age)
values 	("c1", "Nguyen Van Minh", 25),
		("c2", "Nguyen Anh Quoc", 23),
        ("c3", "Nguyen Quoc Anh", 22),
        ("c4", "Nguyen Minh Lanh", 32);
select * from customer;
insert into order_product(o_id, c_id, o_date, o_total_price)
values 	("o1", "c2", "2023-02-23", 10000000),
		("o2", "c3", "2023-02-22", 8000000000),
        ("o3", "c4", "2023-02-13", 459043283);
select * from order_product;
insert into product (p_id, p_name, p_price)
values 	("BG", "bot giat", 54630),
		("KDR", "kem danh rang", 16000),
        ("GVS", "giay ve sinh", 4000);
select * from product;
insert into order_detail(o_id, p_id, order_quantity)
values 	("o2", "KDR", 6),
		("o2", "BG", 2),
        ("o2", "GVS", 3),
        ("o3", "KDR", 3),
        ("o3", "BG", 15);
select * from order_detail;