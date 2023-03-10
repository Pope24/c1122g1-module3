create database if not exists ss5_view_index_store_procedure;
use ss5_view_index_store_procedure;
create table products (
	id int auto_increment primary key,
    productCode varchar(25),
    productName varchar(100),
    productPrice long,
    productAmount int,
    productDescription text,
    productStatus bit
);
insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values 	("S10_1678", "1969 Harley Davidson Ultimate Chopper", 48.81, 9733, "This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.", 1),
		("S10_1949", "1998 Chrysler Plymouth Prowler", 58.48, 9354, "This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.", 0),
		("S10_4757", "1911 Ford Town Carr", 122.73, 992, "Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.", 1),
		("S18_1662", "1932 Model A Ford J-Coupe", 5649, 2018, "This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.", 0),
		("S18_1129", "P-51-D Mustang", 42.5, 8164, "Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.", 1),
		("S18_2319", "1999 Indy 500 Monte Carlo SS", 100, 548, "This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.", 0),
		("S18_2581", "1934 Ford V8 Coupe", 60.78, 1023, "This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.", 1);
select * from products;

-- T???o Index ---------------------------------------------------

-- T???c ????? tr?????c khi t???o unique index
explain select * from products where productCode = "S18_1129";

-- T???c ????? sau khi t???o unique index c???t productCode
alter table products add index idx_productCode(productCode);
select * from products where productCode = "S18_1129";
explain select * from products where productCode = "S18_1129";

-- T???c ????? sau khi t???o composite index c???t productName, productPrice
alter table products add index idx_product_name_price(productName, productPrice(20));
select * from products where productName = "P-51-D Mustang" and productPrice = "42.5";
explain select * from products where productName = "P-51-D Mustang" and productPrice = "42.5";

-- T???o View -----------------------------------------------------

-- T???o view l???y v??? c??c th??ng tin: productCode, productName, productPrice, productStatus t??? b???ng products.
create view products_views as 
select productCode, productName, productPrice, productStatus from products;
select * from products_views;

-- Ti???n h??nh s???a ?????i view
create or replace view products_views as 
select id, productCode, productName,productDescription, productPrice, productStatus from products where productStatus = 1;
select * from products_views;

-- Ti???n h??nh xo?? view
drop view products_views;

-- T???o store procedure -------------------------------------------

-- T???o store procedure l???y t???t c??? th??ng tin c???a t???t c??? c??c s???n ph???m trong b???ng product
DELIMITER //
create procedure findAllProducts()
begin
	select * from products;
end //
DELIMITER ;
call findAllProducts();

-- T???o store procedure th??m m???t s???n ph???m m???i
DELIMITER //
create procedure addMoreProduct(
	newProductCode varchar(25),
    newProductName varchar(100),
    newProductPrice long,
    newProductAmount int,
    newProductDescription text,
    newProductStatus bit
)
begin 
	insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    values (newProductCode, newProductName, newProductPrice, newProductAmount, newProductDescription, newProductStatus);
end //
DELIMITER ;
call addMoreProduct("C09-2832","new product",1000,500,"San pham moi khong phai la thuoc va khong the thay the thuoc chua benh ..",1);

-- T???o store procedure s???a th??ng tin s???n ph???m theo id
DELIMITER //
create procedure editProduct(
	id_edit int,
	newProductCode varchar(25),
    newProductName varchar(100),
    newProductPrice long,
    newProductAmount int,
    newProductDescription text,
    newProductStatus bit
)
begin 
	update products
		set 
			productCode = newProductCode,
            productName = newProductName,
            productPrice = newProductPrice,
            productAmount = newProductAmount,
            productDescription = newProductDescription,
            productStatus = newProductStatus
		where id_edit = products.id;
end //
DELIMITER ;
call editProduct(3,"C09-2832","new product",1000,500,"San pham moi khong phai la thuoc va khong the thay the thuoc chua benh ..",1);

-- T???o store procedure xo?? s???n ph???m theo id
DELIMITER //
create procedure deleteProduct(id_delete int) 
begin 
	delete from products where products.id = id_delete;
end //
DELIMITER ;
call deleteProduct(2);