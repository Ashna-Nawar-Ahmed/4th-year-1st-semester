SET SERVEROUTPUT ON;

DECLARE
  A money.id%TYPE;
  B money.taka%TYPE;
  
BEGIN
	SELECT id, taka into A, B from money;
	DBMS_OUTPUT.PUT_LINE(A||' '||B);
END;
/