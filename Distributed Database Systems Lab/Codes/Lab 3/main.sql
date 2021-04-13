SET SERVEROUTPUT ON;

DECLARE
	A money.id%TYPE := &x;
	B money.id%TYPE := 0;

BEGIN
	B := isEven(A);
	--procEven(A);
	DBMS_OUTPUT.PUT_LINE(B);
END;
/