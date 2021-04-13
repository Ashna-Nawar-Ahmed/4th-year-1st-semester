SET SERVEROUTPUT ON;
DECLARE
s_ID supplier.sid%TYPE:='&ID';
A supplier.sid%TYPE;
funcRet supplier.sname%TYPE;
CURSOR I IS SELECT SID FROM SUPPLIER WHERE sid=s_ID;

BEGIN
	OPEN I;
		LOOP
			FETCH I INTO A;
			
			IF A=s_ID  THEN
				proc(s_ID);
				DBMS_OUTPUT.PUT_LINE('A row has been deleted for id='||s_ID);
				exit;
			
			ELSIF I%ROWCOUNT=0 THEN
				funcRet := func(s_ID);
				DBMS_OUTPUT.PUT_LINE('A new row has been created for id='||s_ID);
			END IF;
			EXIT WHEN I%notfound;
		END LOOP;
	CLOSE I;
	
	
END;
/