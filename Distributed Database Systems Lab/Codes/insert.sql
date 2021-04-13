insert into student values(1, 'Rahim', 1, '10-oct-1990');
insert into student values(2, 'James', 2, '11-jan-1990');
insert into student values(3, 'Jamal', 3, '13-mar-1990');
insert into student values(4, 'Kavin', 4, '13-apr-1990');
insert into student values(5, 'Sharif', 5, '15-feb-1990');
insert into student values(6, 'Ahmad', 6, '10-oct-1990');
insert into student values(7, 'Tarek', 7, '11-jan-1990');
insert into student values(8, 'Kenny', 8, '13-mar-1990');
insert into student values(9, 'Flora', 1, '13-apr-1990');
insert into student values(10, 'Lindsey', 2, '15-feb-1990');

insert into student_result values(1, 3.99);
insert into student_result values(2, 3.85);
insert into student_result values(3, 2.99);
insert into student_result values(4, 3.5);
insert into student_result values(5, 3.1);
insert into student_result values(6, 3.75);
insert into student_result values(7, 2.69);
insert into student_result values(8, 3.78);
insert into student_result values(9, 3.21);
insert into student_result values(10, 3.01);


insert into student_contact values(1, 01722111111);
insert into student_contact values(1, 01722333333);
insert into student_contact values(4, 01722555555);
insert into student_contact values(4, 01722777777);
insert into student_contact values(5, 01722999999);
insert into student_contact values(6, 01722222222);
insert into student_contact values(7, 01722444444);


insert into student_blood_group values(1, 'O+');
insert into student_blood_group values(4, 'O-');
insert into student_blood_group values(5, 'A+');
insert into student_blood_group values(7, 'B+');
insert into student_blood_group values(15, 'B+');
insert into student_blood_group values(12, 'A+');
insert into student_blood_group values(13, 'O-');
commit;

clear screen;

select * from student;
select * from student_result;
select * from student_contact;
select * from student_blood_group;
