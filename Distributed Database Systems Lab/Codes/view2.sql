create or replace view myview(view_id, view_name, view_cgpa) as
select S.id, S.name, R.cgpa
from student S, student_result R
where S.id = R.id;

select * from myview;

commit;
