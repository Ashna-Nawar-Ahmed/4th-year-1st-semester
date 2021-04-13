/*select sname
from student
where snum in
(select snum
from enrolled
where enrolled.cnum in
(select cnum
from course
where cname='Algorithm'));*/

/*select fname
from faculty
where fid in
(select fid
from course
where cname='Database');*/

--select * from student where age=22 and major='ME';

/*select sname
from student
where age>19 and snum in
(select snum
from enrolled
where cnum=
(select cnum
from course
where cname='Drawing'));*/

/*select deptid,fname
from faculty
where fid='1';*/

/*select room
from course
where cname='Programming';*/

/*select cname from course
where fid=2;*/

/*select * from faculty where fid=
(select fid
from course
where cname='Programming');*/

/*select cname from course where cnum in
(select cnum
from enrolled);*/

/*select sname,snum from student where snum not in
(select snum
from enrolled);*/

/*SELECT FNAME FROM
(SELECT FNAME, COUNT(COURSE.FID) 
FROM FACULTY LEFT JOIN COURSE ON FACULTY.FID = COURSE.FID
GROUP BY FNAME, COURSE.FID 
ORDER BY COUNT(COURSE.FID) DESC)
WHERE ROWNUM<=1;*/

/*
SELECT FNAME,DEPTID FROM FACULTY WHERE DEPTID IN(SELECT DEPTID FROM(SELECT DEPTID,COUNT(FACULTY.FID)
FROM FACULTY
GROUP BY DEPTID
ORDER BY COUNT(FACULTY.FID) DESC) 
WHERE ROWNUM<2);

*/






