create database if not exists quan_ly_diem_thi;
use quan_ly_diem_thi;
create table hoc_sinh (
	ma_hs varchar(20) primary key,
    ten_hs varchar(100),
    ngay_sinh datetime,
    lop varchar(20),
    gt varchar(20)
);
create table mon_hoc (
	ma_mh varchar(20) primary key,
    ten_mh varchar(20),
    ma_gv varchar(20)
);
create table bang_diem (
	ma_hs varchar(20),
    ma_mh varchar(20),
    diem_thi double,
    ngay_kt datetime,
    primary key(ma_hs, ma_mh),
    foreign key (ma_hs) references hoc_sinh(ma_hs),
    foreign key (ma_mh) references mon_hoc(ma_mh)
);
create table giao_vien(
	ma_gv varchar(20) primary key,
    ten_gv varchar(100),
    sdt varchar(20)
);
alter table mon_hoc add constraint foreign key (ma_gv) references giao_vien(ma_gv);
select * from hoc_sinh;
alter table hoc_sinh
modify ngay_sinh date;
insert into hoc_sinh(ma_hs, ten_hs, ngay_sinh, lop, gt)
values ("1", "Le Van Chinh", '2003-02-24', "C1122G1", "typescript"),
("2", "Nguyen Van Minh", "1998-09-08", "C1122G1", "java"),
("3", "Nguyen Quoc Anh", "2001-02-25", "C1122G1", "sql");
select * from bang_diem;
alter table bang_diem
modify ngay_kt date;
insert into mon_hoc(ma_mh, ten_mh, ma_gv) 
values ("TO", "TOAN", "HaiTT"),
("VA", "VAN", "CongNN"),
("TA", "TIENG ANH", "TrungDC");
select * from mon_hoc;
insert into bang_diem(ma_hs, ma_mh, diem_thi, ngay_kt)
values ("1","TO", 9.8 , "2023-02-22"), 
("2", "VA", 6.6 , "2023-02-23"), 
("3", "TA", 10 , "2023-02-23");
select * from bang_diem;
insert into giao_vien(ma_gv, ten_gv, sdt) 
values ("HaiTT", "Truong Tan Hai", "012923838453"),("CongNN", "Nguyen Chi Cong", "0129238337826"),("TrungDC", "Dang Chi Trung", "0928387388948");
select * from giao_vien;