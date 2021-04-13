/*insert into supplier values(1, 'Sham', 'Devils Canyon');*/
CREATE OR REPLACE FUNCTION func(sid_input in supplier.sid%TYPE)
RETURN supplier.sname%TYPE
IS
userName supplier.sname%TYPE := 'A';
  
BEGIN
	insert into supplier values(sid_input, 'A', 'Dhaka');
	
	

RETURN userName;
END func;
/