select S.name, B.cgpa
from student S, student_result B
where S.id = B.id;

select S.name, B.cgpa
from student S inner join student_result B
on S.id = B.id;

-- right join, left join