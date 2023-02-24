create database if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class_of_school (
	class_id int auto_increment primary key,
    class_name varchar(60) not null,
    startdate Date not null,
    status_class bit
);
create table student (
	student_id int auto_increment primary key,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    status_student bit,
    class_id int not null,
    foreign key(class_id) references class_of_school(class_id)
);
create table mon_hoc (
	mh_id int auto_increment primary key,
    mh_name varchar(30) not null,
    credit tinyint not null default 1 check (credit >= 1),
    status_mh bit default 1
);
create table mark (
	mark_id int not null auto_increment primary key,
    mh_id int not null,
    student_id int not null,
    mark float default 0 check (mark between 0 and 100),
    exam_times tinyint default 1,
    unique(mh_id, student_id),
    foreign key (mh_id) references mon_hoc(mh_id),
    foreign key (student_id) references student(student_id)
);
insert into class_of_school (class_name, start_date, status_class)
values 	("A1", "2008-12-20", 1), 
		("A2", "2008-12-22", 1), 
		("B3", curdate(), 0);
select * from class_of_school;
insert into student (student_name, address, phone, status_student, class_id)
values 	("Hung", "Ha Noi", "0912113113", 1, 1),
		("Hoa", "Hai Phong", null , 1, 1),
		("Manh", "HCM", "0123123123", 0, 2);
        select * from student;
insert into mon_hoc (mh_name, credit, status_mh)
values 	("CF", 5, 1),
		("C", 6, 1),
        ("HDJ", 5, 1),
        ("RDBMS", 10, 1);
select * from mon_hoc;
insert into mark(mh_id, student_id, mark, exam_times)
values 	(1,1,8,1),
		(1,2,10,2),
		(2,1,12,1);
select * from mark;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student.student_name like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class_of_school where month(class_of_school.start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from mon_hoc where mon_hoc.credit >= 3 and mon_hoc.credit <=5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
UPDATE student SET class_id=2 WHERE student_name='Hung';
SET SQL_SAFE_UPDATES = 1;
select * from student;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.student_name, mon_hoc.mh_name, mark.mark from student 
inner join mon_hoc inner join mark 
on (student.student_id = mark.student_id) AND (mark.mh_id = mon_hoc.mh_id) order by mark desc, student.student_name;