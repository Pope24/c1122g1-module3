create database if not exists furama_resort;
use furama_resort;

-- Nhan vien ---------------------------------
create table vi_tri (
	ma_vi_tri int auto_increment primary key,
    ten_vi_tri varchar(45)
);
create table trinh_do (
	ma_trinh_do int auto_increment primary key,
    ten_trinh_do varchar(45)
);
create table bo_phan (
	ma_bo_phan int auto_increment primary key,
    ten_bo_phan varchar(45)
);
create table nhan_vien (
	ma_nhan_vien int auto_increment primary key,
    ho_ten varchar(45),
    ngay_sinh date,
    so_cmnd varchar(45),
    luong double,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int,
    ma_trinh_do int,
    ma_bo_phan int,
    foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);

-- Khach hang -----------------------------------------
create table loai_khach(
	ma_loai_khach int auto_increment primary key,
    ten_loai_khach varchar(45)
);
create table khach_hang (
	ma_khach_hang int auto_increment primary key,
    ma_loai_khach int,
    ho_ten varchar(45),
    ngay_sinh date,
    gioi_tinh bit default 1,
    so_cmnd varchar(45),
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    foreign key(ma_loai_khach) references loai_khach(ma_loai_khach)
);
alter table khach_hang modify ma_loai_khach int after dia_chi;

-- Hop dong chi tiet, dich vu di kem ------------------
create table dich_vu_di_kem(
	ma_dich_vu_di_kem int auto_increment primary key,
    ten_dich_vu_di_kem varchar(45),
    gia double,
    don_vi varchar(10),
    trang_thai varchar(45)
);
create table hop_dong_chi_tiet (
	ma_hop_dong_chi_tiet int auto_increment primary key,
    ma_hop_dong int,
    ma_dich_vu_di_kem int,
    so_luong int,
    foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
alter table hop_dong_chi_tiet modify so_luong int after ma_hop_dong_chi_tiet;

-- Dich vu --------------------------------------------
create table loai_dich_vu(
	ma_loai_dich_vu int auto_increment primary key,
    ten_loai_dich_vu varchar(45)
);
create table kieu_thue (
	ma_kieu_thue int auto_increment primary key,
    ten_kieu_thue varchar(45)
);
create table dich_vu (
	ma_dich_vu int auto_increment primary key,
    ten_dich_vu varchar(45),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    ma_kieu_thue int,
    ma_loai_dich_vu int,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi  double,
    so_tang int,
    foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);
alter table dich_vu modify ma_kieu_thue int after so_tang;
alter table dich_vu modify ma_loai_dich_vu int after ma_kieu_thue;

-- Hop dong chinh -----------------------------------
create table hop_dong(
	ma_hop_dong int auto_increment primary key,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int,
    ma_khach_hang int,
    ma_dich_vu int,
    foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
    foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);

-- ************************************ CHÈN DỮ LIỆU VÀO BẢNG *********************************************

-- Chèn giá trị bảng vi_tri -------------------------
insert into vi_tri (ten_vi_tri)
values ("Quản Lý"), ("Nhân Viên");
select * from vi_tri;

-- Chèn giá trị bảng trinh_do -----------------------
insert into trinh_do (ten_trinh_do)
values ("Trung Cấp"),("Cao Đẳng"),("Đại Học"),("Sau Đại Học");
select * from trinh_do;

-- Chèn giá trị bảng bo_phan ------------------------
insert into bo_phan(ten_bo_phan)
values ("Sale-Marketing"),("Hành chính"),("Phục vụ"),("Quản lý");
select * from bo_phan;

-- Chèn giá trị bảng nhan_vien ----------------------
insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
values 	("Nguyễn Văn An", '1970-11-07', "456231786", 10000000, "0901234121", "annguyen@gmail.com", "295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1),
		("Lê Văn Bình", '1997-04-09', "654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng", 1, 2, 2),
		("Hồ Thị Yến", '1995-12-12', "999231723", 14000000, "0412352315", "thiyen@gmail.com", "K234/11 Điện Biên Phủ, Gia Lai", 1, 3, 2),
		('Võ Công Toản', '1980-04-04', '123231365',	17000000, '0374443232',	'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4,	4),
		('Nguyễn Bỉnh Phát', '1999-12-09', '454363232',	6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng',	2, 1, 1),
		('Khúc Nguyễn An Nghi',	'2000-11-08', '964542311', 7000000,	'0978653213', 'annghi20@gmail.com',	'294 Nguyễn Tất Thành, Đà Nẵng', 2,	2, 3),
		('Nguyễn Hữu Hà',	'1993-01-01', '534323231', 8000000,	'0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3,	2),
		('Nguyễn Hà Đông', '1989-09-03', '234414123',	9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
		('Tòng Hoang', '1982-09-03', '256781231',	6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
		('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
select * from nhan_vien;

-- Chèn giá trị bảng loai_khach ----------------------
insert into loai_khach(ten_loai_khach)
values ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");
select * from loai_khach;

-- Chèn giá trị bảng khach_hang ----------------------
insert into khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
values ('Nguyễn Thị Hào', '1970-11-07', 0, '643431213',	'0945423362', 'thihao07@gmail.com',	'23 Nguyễn Hoàng, Đà Nẵng', 5),
	   ('Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị',3),
	   ('Trương Đình Nghệ', '1990-02-27', 1,	'488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh',1),
	   ('Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com',	'K453/12 Lê Lợi, Đà Nẵng',1),
       ('Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com',	'224 Lý Thái Tổ, Gia Lai',4),
       ('Tôn Nữ Mộc Châu', '2005-12-06',	0, '732434215',	'0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng',4),
       ('Nguyễn Mỹ Kim',	'1984-04-08', 0, '856453123', '0912345698',	'kimcuong84@gmail.com',	'K123/45 Lê Lợi, Hồ Chí Minh',1),
       ('Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com',	'55 Nguyễn Văn Linh, Kon Tum',3),
       ('Trần Đại Danh',	'1994-07-01', 1, '432341235', '0643343433',	'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi',1),
       ('Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng',2);
select * from khach_hang;

-- Chèn giá trị bảng kieu_thue -----------------------
insert into kieu_thue (ten_kieu_thue)
values ("year"),("month"),("day"),("hour");
select * from kieu_thue;

-- Chèn giá trị bảng loai_dich_vu --------------------
insert into loai_dich_vu(ten_loai_dich_vu)
values ("Villa"),("House"),("Room");
select * from loai_dich_vu;

-- Chèn giá trị bảng dich_vu -------------------------
insert into dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu)
values 	('Villa Beach Front', 25000, 10000000, 10 , 'vip', 'Có hồ bơi', 500, 4, 3, 1),
		('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, 2, 2),
		('Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, 4, 3),
		('Villa No Beach Front', 22000, 9000000, 8,'normal', 'Có hồ bơi', 300, 3, 3, 1),
		('House Princess 02',	10000, 4000000,	5, 'normal', 'Có thêm bếp nướng',	null, 2, 3, 2),
		('Room Twin 02', 3000, 900000, 2, 'normal',	'Có tivi', null, null, 4, 3);
select * from dich_vu;

-- Chèn giá trị bảng dich_vu_di_kem ------------------
insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
values 	('Karaoke', 10000, 'giờ',	'tiện nghi, hiện tại'),
		('Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
		('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
		('Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
		('Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
		('Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');
select * from dich_vu_di_kem;

-- Chèn giá trị bảng hop_dong ------------------------
insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values 	('2020-12-08', '2020-12-08', 0, 3, 1,3),
		('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
		('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
		('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
		('2021-07-14', '2021-07-15', 0, 7, 2, 6),
		('2021-06-01', '2021-06-03', 0, 7, 7, 6),
		('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
		('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
		('2020-11-19', '2020-11-19', 0, 3, 4, 3),
		('2021-04-12', '2021-04-14', 0, 10, 3, 5),
		('2021-04-25', '2021-04-25', 0, 2, 2,	1),
		('2021-05-25', '2021-05-27', 0, 7, 10, 1);
select * from hop_dong;

-- Chèn giá trị bảng hop_dong_chi_tiet ---------------
insert into hop_dong_chi_tiet(so_luong, ma_hop_dong, ma_dich_vu_di_kem)
values 	(5,2,4),
		(8,2,5),
        (15,2,6),
        (1,3,1),
        (11,3,2),
        (1,1,3),
        (2,1,2),
        (2,12,2);
select * from hop_dong_chi_tiet;

-- ************************************ SQL CƠ BẢN 2 - 5 *********************************************

-- 2. Hiển thị tất cả nhân viên có tên bắt đầu là ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự. -----
select * from nhan_vien as nv
where (nv.ho_ten like "H%") or (nv.ho_ten like "T%") or (nv.ho_ten like "K%") and char_length(nv.ho_ten) < 15;

-- 3. Hiển thị tất cả khách hàng độ tuổi từ 18 - 50 tuổi và ở “Đà Nẵng” hoặc “Quảng Trị”. ------------
select *, date_format(from_days(datediff(now(), ngay_sinh)), '%Y') + 0 as tuoi from khach_hang
where (date_format(from_days(datediff(now(), ngay_sinh)), '%Y') + 0 between 18 and 50) and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị';

-- 4. Đếm mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Sắp xếp tăng dần theo số lần đặt phòng -----
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang, kh.ho_ten,kh.dia_chi, kh.so_dien_thoai, count(hd.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach and lk.ma_loai_khach = '1'
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
group by kh.ma_khach_hang
order by so_lan_dat_phong;

-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ------------------------------------------------
-- ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien -----------------------------
create view ss5 as 
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, ifnull(hd.ma_hop_dong, 0) as ma_hop_dong, ifnull(dv.ten_dich_vu, 0) as ten_dich_vu, ifnull(hd.ngay_lam_hop_dong, 0) as ngay_lam_hop_dong, ifnull(hd.ngay_ket_thuc, 0) as ngay_ket_thuc, sum((ifnull(dv.chi_phi_thue, 0) + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0))) as tong_tien from khach_hang as kh
left join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang
left join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by ma_khach_hang; 
select * from ss5;
-- ************************************ SQL CƠ BẢN 6 - 10 *********************************************

-- 6. Hiển thị các loại dịch vụ chưa từng được khách hàng thực hiện từ quý 1 của năm 2021 -------------
-- ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu ---------------------------------
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu as dv
join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where ma_dich_vu not in (select  ma_dich_vu from hop_dong where (month(ngay_lam_hop_dong) between 1 and 3) and year(ngay_lam_hop_dong))
order by dien_tich desc;

-- 7. Hiển thị loại dịch vụ đã được kh đặt phòng 2020 nhưng chưa được kh đặt phòng 2021 ---------------
-- ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu ----------------
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu as dv
join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where ma_dich_vu not in (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) = 2021) 
and ma_dich_vu in(select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) = 2020);

-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau. ----
select ho_ten from khach_hang having count(ho_ten) > 1;
select ho_ten from khach_hang group by ho_ten;
select distinct ho_ten from khach_hang;

-- 9. Thống kê doanh thu theo tháng, nghĩa là  mỗi tháng trong năm 2021 có bao nhiêu kh đặt phòng -----
select month(ngay_lam_hop_dong) as thang, count(month(ngay_lam_hop_dong)) as so_luong_khach_hang from hop_dong 
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);

-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm ---------
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem from hop_dong as hd
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong;

-- ************************************ SQL CƠ BẢN 11 - 15 ********************************************

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi” ----------------------------
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem from dich_vu_di_kem as dvdk 
join khach_hang as kh on kh.ma_loai_khach = 1 and ( kh.dia_chi like "%Quảng Ngãi" or kh.dia_chi like "%Vinh")
join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem;
select * from hop_dong;

-- 12. Hiển thị các dịch vụ được kh đặt vào 3 tháng cuối 2020 nhưng kh khong đặt vào 6 tháng đầu 2021 -
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ma_dich_vu, dv.ten_dich_vu, ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem, hd.tien_dat_coc 
from hop_dong as hd
left join nhan_vien as nv on nv.ma_nhan_vien = hd.ma_nhan_vien
left join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where ((month(ngay_lam_hop_dong) between 10 and 12) and (year(ngay_lam_hop_dong) = 2020)) 
and month(ngay_lam_hop_dong) not in((month(ngay_lam_hop_dong) between 1 and 6) and (year(ngay_lam_hop_dong) = 2021))
group by hd.ma_hop_dong;

-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng --
select hdct.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong from hop_dong_chi_tiet as hdct 
join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having sum(hdct.so_luong) = (select max(so_luong) from hop_dong_chi_tiet);
-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất -------------
select hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, 1 as so_lan_su_dung from hop_dong_chi_tiet as hdct
join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
group by hdct.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1;

-- 15.	Hiển thi tất cả nhân viên bao gồm mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 - 2021 -------
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, vt.ten_vi_tri, nv.so_dien_thoai, nv.dia_chi from nhan_vien as nv
join hop_dong as hd on hd.ma_nhan_vien = nv.ma_nhan_vien and (year(hd.ngay_lam_hop_dong) between 2020 and 2021)
join trinh_do as td on td.ma_trinh_do = nv.ma_trinh_do
join vi_tri as vt on vt.ma_vi_tri = nv.ma_vi_tri
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3
order by hd.ma_nhan_vien;

-- ************************************ SQL CƠ BẢN 16 - 20 ********************************************

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021 -------------------
create or replace view ss16 as 
select * from nhan_vien where ma_nhan_vien in (select ma_nhan_vien from hop_dong as hd where year(hd.ngay_lam_hop_dong) between 2019 and 2021);
select * from ss16;

-- 17. Cập nhật khách hàng có ten_loai_khach Platinum -> Diamond
-- chỉ cập nhật khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong 2021 là lớn hơn 10tr ------
create or replace view ss17 as
select kh.ma_khach_hang, kh.ho_ten, 1 as loai_khach from khach_hang as kh
join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang and year(hd.ngay_lam_hop_dong) = 2021
join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
join  loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach and lk.ma_loai_khach = 2
having sum((ifnull(dv.chi_phi_thue, 0) + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0))) > 10000000;
select * from ss17;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng) --------------
create or replace view ss18 as 
select ma_khach_hang from khach_hang where ma_khach_hang in (select kh.ma_khach_hang from khach_hang as kh 
join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang and year(hd.ngay_lam_hop_dong) < 2021); 
delete from hop_dong as hd where hd.ma_khach_hang in (select ma_khach_hang from ss18);
delete from khach_hang as kh where hd.ma_khach_hang in (select ma_khach_hang from ss18);

-- 19. Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi -------
create or replace view ss19 as
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia * 2 as gia_sau_khi_tang from hop_dong as hd 
join hop_dong_chi_tiet as hdct on hd.ma_hop_dong = hdct.ma_hop_dong and hdct.so_luong > 10
join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) = 2020;
select * from ss19;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống ------------------
create view ss20 as 
select nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien as nv 
union all
select nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien as nv;
select * from ss20;

-- ************************************ SQL NÂNG CAO *************************************************

-- 21. Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên -----------
-- địa chỉ “Hải Châu” và từng lập hợp đồng cho một hoặc nhiều kh bất kì, ngày lập là “12/12/2019” ----
select * from nhan_vien;
select * from hop_dong;