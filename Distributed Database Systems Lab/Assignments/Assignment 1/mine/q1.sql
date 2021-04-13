--Question 1: Find the students older than 19 who has Drawing Classes. 
--Part A (without PL/SQL):
--Query:
select sname
from student
where age>19 and snum in
(select snum
from enrolled
where cnum=
(select cnum
from course
where cname='Drawing'));