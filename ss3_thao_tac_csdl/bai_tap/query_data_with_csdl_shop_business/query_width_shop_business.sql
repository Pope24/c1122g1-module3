create database ss3_quan_ly_ban_hang;
use ss3_quan_ly_ban_hang;
create table customer (
	c_id int auto_increment primary key,
    c_name varchar(255),
    c_age tinyint not null
);
create table order_product (
	o_id int auto_increment primary key,
    c_id int,
    o_date date not null,
    o_total_price int,
    foreign key(c_id) references customer(c_id)
);
create table product (
	p_id int auto_increment primary key,
    p_name varchar(255),
    p_price int
);
create table order_detail(
	o_id int,
    p_id int,
    order_quantity int,
    
    primary key(o_id, p_id),
    foreign key(o_id) references order_product(o_id),
    foreign key(p_id) references product(p_id)
);
insert into customer(c_name, c_age)
values ("Minh Quan", 10),("Ngoc Oanh", 20),("Hong Ha", 50);
select * from customer;
insert into order_product(c_id, o_date)
values (1, "2006-03-21"),(2, "2006-03-23"),(1, "2006-03-16");
select * from order_product;
insert into product (p_name, p_price) 
values ("May Giat", 3),("Tu Lanh", 5),("Dieu Hoa", 7),("Quat", 1),("Bep Dien", 2);
select * from product;
insert into order_detail (o_id, p_id, order_quantity)
values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
select * from order_detail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order.
select o_id, o_date, o_total_price from order_product;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách.
select customer.c_name,customer.c_age, p.p_name, p.p_price
from customer
join order_product  as op on (customer.c_id = op.c_id) 
join order_detail as od on (op.o_id = od.o_id)
join product as p on (p.p_id = od.p_id);

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer where not exists(select * from order_product where customer.c_id = order_product.c_id);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
SET SQL_SAFE_UPDATES = 0;
update order_product as o 
join order_detail as od on o.o_id = od.o_id
join product as p on od.p_id = p.p_id 
set o.o_total_price = od.order_quantity * p.p_price;
select o_id, o_date, o_total_price from order_product;
SET SQL_SAFE_UPDATES = 1;