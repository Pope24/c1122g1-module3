use quan_ly_sinh_vien;
select * from class_of_school;
select * from mark;
select * from mon_hoc;
select * from student;

-- THUC HANH -------------------------------------------------

-- Hiển thị số lượng sinh viên ở từng nơi
select address, count(address) from student group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select student_name, avg(mark) average_mark from student 
inner join mark on student.student_id = mark.student_id 
group by student_name;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select student_name, avg(mark) average_mark from student 
join mark on student.student_id = mark.student_id
group by student_name
having average_mark > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select student_name, avg(mark) average_mark from student 
join mark on student.student_id = mark.student_id
group by student_name
having avg(mark) >= all (select avg(mark) from mark group by mark.student_id);

