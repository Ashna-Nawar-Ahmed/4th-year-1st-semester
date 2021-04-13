SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE proc(sid_input in supplier.sid%TYPE)
		IS
BEGIN
	delete from records
	where sid=sid_input;
	
	delete from supplier
	where sid=sid_input;
		
END proc;
/
