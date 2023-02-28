use quan_ly_sinh_vien;
select * from class_of_school;
select * from mark;
select * from subject_class;
select * from student;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject_class 
group by mh_id 
having avg(credit) >= all (select avg(credit) from subject_class);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
set sql_mode='';
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select mh.mh_name, mh.credit, m.mark, m.exam_times from subject_class mh
inner join mark m on mh.mh_id = m.mh_id
group by mh.mh_name, mh.credit
having m.mark >= all(select mark from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, s.student_name, s.address, s.phone, s.status_student, s.class_id, avg(mark.mark) as average_mark from student as s
left join mark on mark.student_id = s.student_id
group by s.student_id
order by average_mark desc;