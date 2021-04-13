SET SERVEROUTPUT ON;

DECLARE
	n_id student.id %TYPE;
	v_name student.name %TYPE;
	v_newname student.name %TYPE;

BEGIN
	v_newname := 'Mamun';
	
	update student set name = v_newname
	where id = 1;
 
	select id, name
	into n_id, v_name
	from student;

DBMS_OUTPUT.PUT_LINE(n_id);
DBMS_OUTPUT.PUT_LINE(v_name);

END;
/

