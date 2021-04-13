create or replace view myview as
select S.id, S.name
from student S;

select * from myview;

commit;
