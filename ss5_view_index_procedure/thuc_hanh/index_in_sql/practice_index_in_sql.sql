use classicmodels;
select * from customers where customerName = "Land of Toys Inc.";
explain select * from customers where customerName = "Land of Toys Inc.";
alter table customers add index idx_customename(customerName);
explain select * from customers where customerName = "Land of Toys Inc.";
alter table customers add index inx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
