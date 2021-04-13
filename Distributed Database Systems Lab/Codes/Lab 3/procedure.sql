set serveroutput on;


create or replace procedure procEven(n_number IN money.id%TYPE)
		IS
begin
	
	IF MOD(n_number, 2) = 0 THEN
		DBMS_OUTPUT.PUT_LINE(1);
	ELSE
		DBMS_OUTPUT.PUT_LINE(0);
	END IF;
		
end procEven;
/
