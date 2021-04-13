SET SERVEROUTPUT ON;

DECLARE
	X records.sid%TYPE := &s_id;
	Y records.cost%TYPE:=0;
	

BEGIN
	
	DBMS_OUTPUT.PUT_LINE('The total cost of the supplier is: ');
	totalCost(X,Y);
	
END;
/