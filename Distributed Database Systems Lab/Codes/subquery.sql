select cgpa from student_result
where id = (select id
from student
where name = 'Karim');